// Canvas 2D renderer for hovenia-editor element tree
// Called from Calcit's app.core/render-element!

import {
  CalcitMap,
  CalcitSliceMap,
  CalcitList,
  CalcitSliceList,
  CalcitTag,
} from "@calcit/procs";

// --- Color conversion ---
// Calcit uses 0xRRGGBB numbers for hex colors; Canvas 2D needs CSS strings
const toCssColor = (c: unknown): string => {
  if (typeof c === "number") {
    return "#" + c.toString(16).padStart(6, "0");
  }
  return String(c);
};

// --- Camera state (pan & zoom) ---

const camera = { x: 200, y: 60, scale: 1 };
let canvasRef: HTMLCanvasElement | null = null;
let _panZoomSetup = false;
let _clickSetupDone = false;
let _keySetupDone = false;

// --- Hit-testing for interactive elements ---

interface HitTarget {
  bx: number; by: number; bw: number; bh: number; // screen-space (CSS px) bounds
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  handler: (e: any, dispatch: unknown) => void;
  dispatch: unknown;
}

let _hitTargets: HitTarget[] = [];

function recordHitTarget(
  ctx: CanvasRenderingContext2D,
  localBounds: { x: number; y: number; w: number; h: number },
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  handler: (e: any, dispatch: unknown) => void,
  dispatch: unknown,
): void {
  const t = ctx.getTransform();
  const dpr = window.devicePixelRatio;
  // Transform local-bounds corners through CTM, then to CSS pixels
  const corners = [
    { x: localBounds.x, y: localBounds.y },
    { x: localBounds.x + localBounds.w, y: localBounds.y },
    { x: localBounds.x, y: localBounds.y + localBounds.h },
    { x: localBounds.x + localBounds.w, y: localBounds.y + localBounds.h },
  ].map(p => ({
    x: (t.a * p.x + t.c * p.y + t.e) / dpr,
    y: (t.b * p.x + t.d * p.y + t.f) / dpr,
  }));
  const minX = Math.min(...corners.map(p => p.x));
  const minY = Math.min(...corners.map(p => p.y));
  const maxX = Math.max(...corners.map(p => p.x));
  const maxY = Math.max(...corners.map(p => p.y));
  _hitTargets.push({ bx: minX, by: minY, bw: maxX - minX, bh: maxY - minY, handler, dispatch });
}

function applyCamera(ctx: CanvasRenderingContext2D): void {
  ctx.translate(camera.x, camera.y);
  ctx.scale(camera.scale, camera.scale);
}

function setupPanZoom(canvas: HTMLCanvasElement): void {
  if (_panZoomSetup) return;
  _panZoomSetup = true;
  canvasRef = canvas;
  let dragging = false;
  let lastX = 0;
  let lastY = 0;

  // mousedown on canvas only (not on navbar overlay)
  canvas.addEventListener("mousedown", (e) => {
    dragging = true;
    lastX = e.clientX;
    lastY = e.clientY;
    canvas.style.cursor = "grabbing";
  });

  window.addEventListener("mousemove", (e) => {
    if (!dragging) return;
    const dx = e.clientX - lastX;
    const dy = e.clientY - lastY;
    lastX = e.clientX;
    lastY = e.clientY;
    camera.x += dx;
    camera.y += dy;
    scheduleRedraw();
  });

  window.addEventListener("mouseup", () => {
    dragging = false;
    if (canvasRef) canvasRef.style.cursor = "default";
  });

  canvas.addEventListener(
    "wheel",
    (e) => {
      e.preventDefault();
      const direction = e.deltaY < 0 ? 1 : -1;
      const factor = 1 + direction * 0.02;
      const newScale = camera.scale * factor;
      if (newScale < 0.1 || newScale > 10) return;
      const rect = canvas.getBoundingClientRect();
      const mx = e.clientX - rect.left;
      const my = e.clientY - rect.top;
      camera.x = mx - (mx - camera.x) * factor;
      camera.y = my - (my - camera.y) * factor;
      camera.scale = newScale;
      scheduleRedraw();
    },
    { passive: false },
  );
}

// --- Redraw scheduler ---
let _lastEl: unknown = null;
let _lastCtx: CanvasRenderingContext2D | null = null;
let _lastDispatch: unknown = null;
let _rafId: number | null = null;
let _renderDepth = 0;

function scheduleRedraw(): void {
  if (_rafId != null) return;
  _rafId = requestAnimationFrame(() => {
    _rafId = null;
    if (_lastCtx && _lastEl != null) {
      const dpr = window.devicePixelRatio;
      _lastCtx.setTransform(dpr, 0, 0, dpr, 0, 0);
      _lastCtx.clearRect(0, 0, window.innerWidth, window.innerHeight);
      applyCamera(_lastCtx);
      _renderDepth = 0;
      renderElement(_lastEl, _lastCtx, _lastDispatch);
    }
  });
}

function getMapPairs(
  map: CalcitMap | CalcitSliceMap,
): Array<[unknown, unknown]> {
  if (map instanceof CalcitSliceMap) {
    return map.turnMap().pairs();
  }
  return map.pairs();
}

function calcitDataToJs(data: unknown): unknown {
  if (data == null) return null;
  if (data instanceof CalcitMap || data instanceof CalcitSliceMap) {
    const result: Record<string, unknown> = {};
    const pairs = getMapPairs(data);
    for (let i = 0; i < pairs.length; i++) {
      const k = pairs[i][0];
      const v = pairs[i][1];
      const key =
        k instanceof CalcitTag && typeof k.value === "string"
          ? k.value
          : String(calcitDataToJs(k));
      result[key] = calcitDataToJs(v);
    }
    return result;
  }
  if (data instanceof CalcitList) {
    return data.toArray().map((item) => calcitDataToJs(item));
  }
  if (data instanceof CalcitSliceList) {
    return data.turnListMode().toArray().map((item) => calcitDataToJs(item));
  }
  if (data instanceof CalcitTag) {
    return data.value;
  }
  return data;
}

interface JsElement {
  name: string;
  props: Record<string, unknown>;
  children: JsElement[];
}

interface JsStyle {
  fill?: string;
  width?: number;
  "font-size"?: number;
  "font-family"?: string;
  alpha?: number;
  color?: string;
}

interface JsLineStyle {
  width?: number;
  color?: string;
  alpha?: number;
}

type GraphicsOpData = Record<string, unknown> | number[];

function renderGraphicsOp(
  ctx: CanvasRenderingContext2D,
  opPair: [string, GraphicsOpData],
): void {
  const op = opPair[0];
  const data = opPair[1];
  switch (op) {
    case "begin-fill": {
      const d = data as Record<string, unknown>;
      ctx.beginPath();
      if (d.color != null) ctx.fillStyle = toCssColor(d.color);
      if (d.alpha != null) ctx.globalAlpha = d.alpha as number;
      break;
    }
    case "end-fill":
      ctx.fill();
      break;
    case "line-style": {
      const d = data as Record<string, unknown>;
      if (d.color != null) ctx.strokeStyle = toCssColor(d.color);
      if (d.width != null) ctx.lineWidth = d.width as number;
      if (d.alpha != null) ctx.globalAlpha = d.alpha as number;
      break;
    }
    case "move-to": {
      const arr = data as number[];
      ctx.moveTo(arr[0], arr[1]);
      break;
    }
    case "line-to": {
      const arr = data as number[];
      ctx.lineTo(arr[0], arr[1]);
      break;
    }
    case "close-path":
      ctx.closePath();
      break;
    case "bezier-to": {
      const d = data as Record<string, number[]>;
      ctx.bezierCurveTo(
        d.p1[0],
        d.p1[1],
        d.p2[0],
        d.p2[1],
        d["to-p"][0],
        d["to-p"][1],
      );
      break;
    }
    case "arc": {
      const d = data as Record<string, unknown>;
      const center = d.center as number[];
      const radian = d.radian as number[];
      ctx.arc(
        center[0],
        center[1],
        d.radius as number,
        radian[0],
        radian[1],
        d.anticlockwise as boolean,
      );
      break;
    }
  }
}

function extractElementFromChild(child: unknown): unknown | null {
  if (Array.isArray(child)) {
    return child.length >= 2 && typeof child[1] === "object" ? child[1] : null;
  }
  if (
    typeof child === "object" &&
    child != null &&
    (child as Record<string, unknown>).tree != null &&
    typeof (child as Record<string, unknown>).tree === "object"
  ) {
    return (child as Record<string, unknown>).tree;
  }
  if (
    typeof child === "object" &&
    child != null &&
    typeof (child as Record<string, unknown>).name === "string"
  ) {
    return child;
  }
  return null;
}

export function renderElement(
  el: unknown,
  ctx: CanvasRenderingContext2D,
  dispatch: unknown,
): void {
  // save root element for redraw (depth 0 only, not recursive child calls)
  if (_renderDepth === 0) {
    _lastEl = el;
    _lastCtx = ctx;
    _lastDispatch = dispatch;
    _hitTargets = [];
  }
  _renderDepth++;
  try {
    const jsEl = calcitDataToJs(el) as JsElement;
    const tag = jsEl.name;
    const props = jsEl.props || {};
    const children = jsEl.children || [];
    if (typeof tag !== "string") {
      console.warn("renderElement bad input:", { tag, jsEl });
      return;
    }
    switch (tag) {
    case "container": {
      const pos = props.position as number[] | undefined;
      const rot = props.rotation as number | undefined;
      const scl = props.scale as number | undefined;
      const pivot = props.pivot as number[] | undefined;
      if (pos != null) ctx.save();
      if (pos != null) ctx.translate(pos[0], pos[1]);
      if (rot != null) ctx.rotate(rot);
      if (scl != null) ctx.scale(scl, scl);
      if (pivot != null) ctx.translate(-pivot[0], -pivot[1]);
      for (const child of children) {
        const realChild = extractElementFromChild(child);
        if (realChild == null) continue;
        renderElement(realChild, ctx, dispatch);
      }
      if (pos != null) ctx.restore();
      return;
    }
    case "rect": {
      const pos = props.position as number[] | undefined;
      const size = props.size as number[] | undefined;
      const fill = props.fill;
      const lineStyle = props["line-style"] as JsLineStyle | undefined;
      const lineWidth = lineStyle ? lineStyle.width : null;
      const lineColor = lineStyle ? lineStyle.color : null;
      const lineAlpha = lineStyle?.alpha;
      const alpha = props.alpha as number | undefined;
      const angle = props.angle as number | undefined;
      const pivot = props.pivot as number[] | undefined;
      if (pos != null) ctx.save();
      if (angle != null && pivot != null && pos != null) {
        // rotate around center: translate to pivot point, rotate, draw centered
        ctx.translate(pos[0] + pivot[0], pos[1] + pivot[1]);
        ctx.rotate((angle * Math.PI) / 180);
        if (alpha != null) ctx.globalAlpha = alpha;
        if (fill != null && size != null) {
          ctx.fillStyle = toCssColor(fill);
          ctx.fillRect(-pivot[0], -pivot[1], size[0], size[1]);
        }
        if (lineWidth != null && lineColor != null && size != null) {
          ctx.lineWidth = lineWidth;
          ctx.strokeStyle = toCssColor(lineColor);
          if (lineAlpha != null) ctx.globalAlpha = lineAlpha;
          ctx.strokeRect(-pivot[0], -pivot[1], size[0], size[1]);
          if (lineAlpha != null) ctx.globalAlpha = 1;
        }
        // hit test recording
        const on = props.on as Record<string, unknown> | undefined;
        const pointertap = on?.pointertap as ((e: MouseEvent, d: unknown) => void) | undefined;
        if (pointertap && size != null) {
          recordHitTarget(ctx, { x: -pivot[0], y: -pivot[1], w: size[0], h: size[1] }, pointertap, dispatch);
        }
      } else {
        if (pos != null) ctx.translate(pos[0], pos[1]);
        if (alpha != null) ctx.globalAlpha = alpha;
        if (fill != null && size != null) {
          ctx.fillStyle = toCssColor(fill);
          ctx.fillRect(0, 0, size[0], size[1]);
        }
        if (lineWidth != null && lineColor != null && size != null) {
          ctx.lineWidth = lineWidth;
          ctx.strokeStyle = toCssColor(lineColor);
          if (lineAlpha != null) ctx.globalAlpha = lineAlpha;
          ctx.strokeRect(0, 0, size[0], size[1]);
          if (lineAlpha != null) ctx.globalAlpha = 1;
        }
        // hit test recording
        const on = props.on as Record<string, unknown> | undefined;
        const pointertap = on?.pointertap as ((e: MouseEvent, d: unknown) => void) | undefined;
        if (pointertap && size != null) {
          recordHitTarget(ctx, { x: 0, y: 0, w: size[0], h: size[1] }, pointertap, dispatch);
        }
      }
      if (pos != null) ctx.restore();
      break;
    }
    case "circle": {
      const pos = props.position as number[] | undefined;
      const radius = props.radius as number | undefined;
      const fill = props.fill;
      const lineStyle = props["line-style"] as JsLineStyle | undefined;
      const lineWidth = lineStyle ? lineStyle.width : null;
      const lineColor = lineStyle ? lineStyle.color : null;
      const lineAlpha = lineStyle?.alpha;
      const alpha = props.alpha as number | undefined;
      if (pos != null) ctx.save();
      if (pos != null) ctx.translate(pos[0], pos[1]);
      ctx.beginPath();
      if (radius != null) ctx.arc(0, 0, radius, 0, 2 * Math.PI);
      if (alpha != null) ctx.globalAlpha = alpha;
      if (fill != null) {
        ctx.fillStyle = toCssColor(fill);
        ctx.fill();
      }
      if (lineWidth != null && lineColor != null) {
        ctx.lineWidth = lineWidth;
        ctx.strokeStyle = toCssColor(lineColor);
        if (lineAlpha != null) ctx.globalAlpha = lineAlpha;
        ctx.stroke();
        if (lineAlpha != null) ctx.globalAlpha = 1;
      }
      // hit test recording
      const on = props.on as Record<string, unknown> | undefined;
      const pointertap = on?.pointertap as ((e: MouseEvent, d: unknown) => void) | undefined;
      if (pointertap && radius != null) {
        recordHitTarget(ctx, { x: -radius, y: -radius, w: radius * 2, h: radius * 2 }, pointertap, dispatch);
      }
      if (pos != null) ctx.restore();
      break;
    }
    case "text": {
      const pos = props.position as number[] | undefined;
      const txt = props.text as string | undefined;
      const style = (props.style || {}) as JsStyle;
      const fontSize = style["font-size"];
      const fontFamily = style["font-family"];
      const fill = style.fill;
      const rot = props.rotation as number | undefined;
      if (pos != null) ctx.save();
      if (pos != null) ctx.translate(pos[0], pos[1]);
      if (rot != null) ctx.rotate(rot);
      if (fontSize != null && fontFamily != null) {
        ctx.font = fontSize + "px " + fontFamily;
      }
      // PixiJS uses top-left as text origin; Canvas 2D defaults to baseline
      ctx.textBaseline = "top";
      if (fill != null) ctx.fillStyle = toCssColor(fill);
      if (txt != null) ctx.fillText(txt, 0, 0);
      // hit test recording
      const on = props.on as Record<string, unknown> | undefined;
      const pointertap = on?.pointertap as ((e: MouseEvent, d: unknown) => void) | undefined;
      if (pointertap && txt != null && fontSize != null) {
        const textW = ctx.measureText(txt).width;
        recordHitTarget(ctx, { x: 0, y: 0, w: textW, h: fontSize }, pointertap, dispatch);
      }
      if (pos != null) ctx.restore();
      break;
    }
    case "graphics": {
      const ops = (props.ops || []) as Array<[string, GraphicsOpData]>;
      for (const op of ops) {
        renderGraphicsOp(ctx, op);
      }
      break;
    }
    case "polyline": {
      const points = (props.points || []) as number[][];
      const style = (props.style || {}) as JsStyle;
      const lineWidth = style.width;
      const lineColor = style.color;
      const lineAlpha = style.alpha;
      ctx.beginPath();
      points.forEach((point: number[], idx: number) => {
        if (idx === 0) ctx.moveTo(point[0], point[1]);
        else ctx.lineTo(point[0], point[1]);
      });
      if (lineColor != null) ctx.strokeStyle = toCssColor(lineColor);
      if (lineWidth != null) ctx.lineWidth = lineWidth;
      if (lineAlpha != null) ctx.globalAlpha = lineAlpha;
      if (lineColor != null) ctx.stroke();
      if (lineAlpha != null) ctx.globalAlpha = 1;
      // hit test recording
      const on = props.on as Record<string, unknown> | undefined;
      const pointertap = on?.pointertap as ((e: MouseEvent, d: unknown) => void) | undefined;
      if (pointertap && points.length > 0) {
        let minX = points[0][0], minY = points[0][1], maxX = points[0][0], maxY = points[0][1];
        for (const p of points) {
          if (p[0] < minX) minX = p[0];
          if (p[1] < minY) minY = p[1];
          if (p[0] > maxX) maxX = p[0];
          if (p[1] > maxY) maxY = p[1];
        }
        recordHitTarget(ctx, { x: minX, y: minY, w: maxX - minX || 1, h: maxY - minY || 1 }, pointertap, dispatch);
      }
      break;
    }
    case "line-segments":
      break;
    default:
      console.warn("unknown tag:", tag);
  }
  } finally {
    _renderDepth--;
  }
}

export function setupCanvas(
  mountTarget: Element,
): CanvasRenderingContext2D | null {
  let canvas = document.getElementById("hovenia-canvas") as HTMLCanvasElement | null;
  if (canvas == null) {
    canvas = document.createElement("canvas");
    canvas.id = "hovenia-canvas";
    document.body.appendChild(canvas);
  }
  const dpr = window.devicePixelRatio;
  const width = window.innerWidth;
  const height = window.innerHeight;
  canvas.width = width * dpr;
  canvas.height = height * dpr;
  canvas.style.width = width + "px";
  canvas.style.height = height + "px";
  canvas.style.position = "absolute";
  canvas.style.top = "0";
  canvas.style.left = "0";
  canvas.style.zIndex = "0";
  canvas.tabIndex = 0;
  canvas.style.outline = "none";
  // focus canvas when clicked (for keyboard event routing)
  canvas.addEventListener("mousedown", () => canvas?.focus());
  // ensure Respo-rendered .app container sits above the canvas
  const appDiv = document.querySelector(".app");
  if (appDiv instanceof HTMLElement) {
    appDiv.style.position = "relative";
    appDiv.style.zIndex = "1";
  }
  const ctx = canvas.getContext("2d");
  if (ctx == null) return null;
  ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
  ctx.clearRect(0, 0, width, height);
  // setup pan & zoom event handlers
  setupPanZoom(canvas);

  // --- Click-to-focus: intercept clicks for interactive elements ---
  if (!_clickSetupDone) {
    _clickSetupDone = true;
    let _dragStartX = 0, _dragStartY = 0;
    document.addEventListener("mousedown", (e: MouseEvent) => {
      _dragStartX = e.clientX;
      _dragStartY = e.clientY;
    });
    document.addEventListener("click", (e: MouseEvent) => {
      const dx = e.clientX - _dragStartX;
      const dy = e.clientY - _dragStartY;
      if (dx * dx + dy * dy > 9) return; // skip if dragged > 3px
      const mx = e.clientX;
      const my = e.clientY;
      console.log(`[click] (${mx.toFixed(0)},${my.toFixed(0)}) targets=${_hitTargets.length}`);
      // check hit targets in reverse order (topmost first)
      for (let i = _hitTargets.length - 1; i >= 0; i--) {
        const t = _hitTargets[i];
        if (mx >= t.bx && mx <= t.bx + t.bw && my >= t.by && my <= t.by + t.bh) {
          console.log(`[hit] #${i} (${t.bx.toFixed(0)},${t.by.toFixed(0)},${t.bw.toFixed(0)}x${t.bh.toFixed(0)})`);
          // construct PixiJS-compatible event wrapper
          const worldX = (e.clientX - camera.x) / camera.scale;
          const worldY = (e.clientY - camera.y) / camera.scale;
          const pixiEvent = {
            data: {
              global: { x: worldX, y: worldY },
              originalEvent: e,
            },
            originalEvent: e,
            metaKey: e.metaKey,
            shiftKey: e.shiftKey,
            ctrlKey: e.ctrlKey,
            altKey: e.altKey,
            button: e.button,
            buttons: e.buttons,
            clientX: e.clientX,
            clientY: e.clientY,
            screenX: e.screenX,
            screenY: e.screenY,
            preventDefault: () => e.preventDefault(),
            stopPropagation: () => e.stopPropagation(),
          };
          t.handler(pixiEvent, t.dispatch);
          return;
        }
      }
      console.log("[click] no hit");
    });
  }

  // --- Keyboard events: forward to Calcit dispatch ---
  if (!_keySetupDone) {
    _keySetupDone = true;
    window.addEventListener("keydown", (e: KeyboardEvent) => {
      const dispatch = _lastDispatch;
      if (typeof dispatch !== "function") return;
      // Construct Calcit-compatible event map
      const calEvent = {
        key: e.key,
        "key-code": e.keyCode,
        "meta?": e.metaKey,
        "ctrl?": e.ctrlKey,
        "shift?": e.shiftKey,
        altKey: e.altKey,
        preventDefault: () => e.preventDefault(),
        stopPropagation: () => e.stopPropagation(),
      };
      console.log(`[keydown] key=${e.key} code=${e.keyCode} meta=${e.metaKey} ctrl=${e.ctrlKey}`);
      try { (dispatch as (action: string, data: unknown) => void)(":key-event", calEvent); } catch (_) { /* ignore */ }
    });
  }
  // apply camera offset & scale
  applyCamera(ctx);
  return ctx;
}
