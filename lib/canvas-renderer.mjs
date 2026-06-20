// Canvas 2D renderer for hovenia-editor element tree
// Called from Calcit's app.core/render-element!
// @ts-check

import { CalcitMap, CalcitSliceMap, CalcitList, CalcitSliceList, CalcitTag } from "@calcit/procs";

// --- Calcit data to plain JS converter ---

/**
 * Convert Calcit data structures to plain JS objects/arrays.
 * Calcit maps use CalcitTag instances as keys (not strings).
 * Calcit lists wrap ternary trees (not plain arrays).
 * @param {unknown} data
 * @returns {unknown}
 */
/**
 * Get pairs from a Calcit map (handles both CalcitMap and CalcitSliceMap).
 * CalcitSliceMap has no .pairs() method, so convert via .turnMap() first.
 * @param {CalcitMap | CalcitSliceMap} map
 * @returns {Array<[unknown, unknown]>}
 */
function getMapPairs(map) {
  if (map instanceof CalcitSliceMap) {
    return map.turnMap().pairs();
  }
  return map.pairs();
}

/**
 * @param {unknown} data
 * @returns {unknown}
 */
function calcitDataToJs(data) {
  if (data == null) return null;
  if (data instanceof CalcitMap || data instanceof CalcitSliceMap) {
    /** @type {Record<string, unknown>} */
    const result = {};
    const pairs = getMapPairs(/** @type {CalcitMap | CalcitSliceMap} */ (data));
    for (let i = 0; i < pairs.length; i++) {
      const k = pairs[i][0];
      const v = pairs[i][1];
      // CalcitTag has .value property with the string name
      const key = (k instanceof CalcitTag && typeof k.value === 'string')
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
  // primitive: number, string, boolean
  return data;
}

/**
 * @typedef {Object} JsElement
 * @property {string} name
 * @property {Record<string, unknown>} props
 * @property {JsElement[]} children
 */

/**
 * @typedef {Object} JsStyle
 * @property {string} [fill]
 * @property {number} [width]
 * @property {number} [font-size]
 * @property {string} [font-family]
 * @property {number} [alpha]
 * @property {string} [color]
 */

/**
 * @typedef {Object} JsLineStyle
 * @property {number} [width]
 * @property {string} [color]
 * @property {number} [alpha]
 */

/**
 * @typedef {Record<string, unknown> | number[]} GraphicsOpData
 */

/**
 * @param {CanvasRenderingContext2D} ctx
 * @param {[string, GraphicsOpData]} opPair
 */
function renderGraphicsOp(ctx, opPair) {
  const op = opPair[0];
  const data = opPair[1];
  switch (op) {
    case 'begin-fill': {
      const d = /** @type {Record<string, unknown>} */ (data);
      ctx.beginPath();
      if (d.color != null) ctx.fillStyle = /** @type {string} */ (d.color);
      if (d.alpha != null) ctx.globalAlpha = /** @type {number} */ (d.alpha);
      break;
    }
    case 'end-fill':
      ctx.fill();
      break;
    case 'line-style': {
      const d = /** @type {Record<string, unknown>} */ (data);
      if (d.color != null) ctx.strokeStyle = /** @type {string} */ (d.color);
      if (d.width != null) ctx.lineWidth = /** @type {number} */ (d.width);
      if (d.alpha != null) ctx.globalAlpha = /** @type {number} */ (d.alpha);
      break;
    }
    case 'move-to': {
      const arr = /** @type {number[]} */ (data);
      ctx.moveTo(arr[0], arr[1]);
      break;
    }
    case 'line-to': {
      const arr = /** @type {number[]} */ (data);
      ctx.lineTo(arr[0], arr[1]);
      break;
    }
    case 'close-path':
      ctx.closePath();
      break;
    case 'bezier-to': {
      const d = /** @type {Record<string, number[]>} */ (data);
      ctx.bezierCurveTo(d.p1[0], d.p1[1], d.p2[0], d.p2[1], d['to-p'][0], d['to-p'][1]);
      break;
    }
    case 'arc': {
      const d = /** @type {Record<string, unknown>} */ (data);
      const center = /** @type {number[]} */ (d.center);
      const radian = /** @type {number[]} */ (d.radian);
      ctx.arc(center[0], center[1], /** @type {number} */ (d.radius), radian[0], radian[1], /** @type {boolean} */ (d.anticlockwise));
      break;
    }
  }
}

/**
 * @param {unknown} el
 * @param {CanvasRenderingContext2D} ctx
 * @param {unknown} dispatch
 */
export function renderElement(el, ctx, dispatch) {
  // Convert Calcit data to plain JS at the boundary
  const jsEl = /** @type {JsElement} */ (calcitDataToJs(el));
  const tag = jsEl.name;
  const props = jsEl.props || {};
  const children = jsEl.children || [];
  if (typeof tag !== 'string') {
    console.warn('renderElement bad input:', 'tag:', tag, 'jsEl:', jsEl, 'el type:', el?.constructor?.name);
    return;
  }
  switch (tag) {
    case 'container': {
      const pos = /** @type {number[] | undefined} */ (props.position);
      const rot = /** @type {number | undefined} */ (props.rotation);
      const scl = /** @type {number | undefined} */ (props.scale);
      const pivot = /** @type {number[] | undefined} */ (props.pivot);
      if (pos != null) ctx.save();
      if (pos != null) ctx.translate(pos[0], pos[1]);
      if (rot != null) ctx.rotate(rot);
      if (scl != null) ctx.scale(scl, scl);
      if (pivot != null) ctx.translate(-pivot[0], -pivot[1]);
      for (const child of children) {
        // Skip non-element children (e.g. :tree keyword used as named slot marker)
        if (typeof child !== 'object' || child == null) continue;
        renderElement(child, ctx, dispatch);
      }
      if (pos != null) ctx.restore();
      return;
    }
    case 'rect': {
      const pos = /** @type {number[] | undefined} */ (props.position);
      const size = /** @type {number[] | undefined} */ (props.size);
      const fill = /** @type {string | undefined} */ (props.fill);
      const lineStyle = /** @type {JsLineStyle | undefined} */ (props['line-style']);
      const lineWidth = lineStyle ? lineStyle.width : null;
      const lineColor = lineStyle ? lineStyle.color : null;
      const alpha = /** @type {number | undefined} */ (props.alpha);
      const angle = /** @type {number | undefined} */ (props.angle);
      const pivot = /** @type {number[] | undefined} */ (props.pivot);
      if (pos != null) ctx.save();
      if (pos != null) ctx.translate(pos[0], pos[1]);
      if (angle != null && size != null) {
        if (pivot != null) {
          ctx.translate(pivot[0], pivot[1]);
          ctx.rotate(angle * Math.PI / 180);
          ctx.translate(-pivot[0], -pivot[1]);
        }
      }
      if (alpha != null) ctx.globalAlpha = alpha;
      if (fill != null && size != null) {
        ctx.fillStyle = fill;
        ctx.fillRect(0, 0, size[0], size[1]);
      }
      if (lineWidth != null && lineColor != null && size != null) {
        ctx.lineWidth = lineWidth;
        ctx.strokeStyle = lineColor;
        ctx.strokeRect(0, 0, size[0], size[1]);
      }
      if (pos != null) ctx.restore();
      break;
    }
    case 'circle': {
      const pos = /** @type {number[] | undefined} */ (props.position);
      const radius = /** @type {number | undefined} */ (props.radius);
      const fill = /** @type {string | undefined} */ (props.fill);
      const alpha = /** @type {number | undefined} */ (props.alpha);
      if (pos != null) ctx.save();
      if (pos != null) ctx.translate(pos[0], pos[1]);
      ctx.beginPath();
      if (radius != null) ctx.arc(0, 0, radius, 0, 2 * Math.PI);
      if (alpha != null) ctx.globalAlpha = alpha;
      if (fill != null) {
        ctx.fillStyle = fill;
        ctx.fill();
      }
      if (pos != null) ctx.restore();
      break;
    }
    case 'text': {
      const pos = /** @type {number[] | undefined} */ (props.position);
      const txt = /** @type {string | undefined} */ (props.text);
      const style = /** @type {JsStyle} */ (props.style || {});
      const fontSize = style['font-size'];
      const fontFamily = style['font-family'];
      const fill = style.fill;
      const rot = /** @type {number | undefined} */ (props.rotation);
      if (pos != null) ctx.save();
      if (pos != null) ctx.translate(pos[0], pos[1]);
      if (rot != null) ctx.rotate(rot);
      if (fontSize != null && fontFamily != null) {
        ctx.font = fontSize + 'px ' + fontFamily;
      }
      if (fill != null) ctx.fillStyle = fill;
      if (txt != null) ctx.fillText(txt, 0, 0);
      if (pos != null) ctx.restore();
      break;
    }
    case 'graphics': {
      const ops = /** @type {Array<[string, GraphicsOpData]>} */ (props.ops || []);
      for (const op of ops) {
        renderGraphicsOp(ctx, op);
      }
      break;
    }
    case 'polyline': {
      const points = /** @type {number[][]} */ (props.points || []);
      const style = /** @type {JsStyle} */ (props.style || {});
      const lineWidth = style.width;
      const lineColor = style.color;
      const lineAlpha = style.alpha;
      ctx.beginPath();
      points.forEach((point, idx) => {
        if (idx === 0) ctx.moveTo(point[0], point[1]);
        else ctx.lineTo(point[0], point[1]);
      });
      if (lineColor != null) ctx.strokeStyle = lineColor;
      if (lineWidth != null) ctx.lineWidth = lineWidth;
      if (lineAlpha != null) ctx.globalAlpha = lineAlpha;
      if (lineColor != null) ctx.stroke();
      break;
    }
    case 'line-segments':
      // not implemented
      break;
    default:
      console.warn('unknown tag:', tag, 'jsEl keys:', Object.keys(jsEl));
  }
}

/**
 * @param {Element} mountTarget
 * @returns {CanvasRenderingContext2D | null}
 */
export function setupCanvas(mountTarget) {
  let canvas = /** @type {HTMLCanvasElement | null} */ (mountTarget.querySelector('canvas'));
  if (canvas == null) {
    canvas = document.createElement('canvas');
    mountTarget.appendChild(canvas);
  }
  const dpr = window.devicePixelRatio;
  const width = window.innerWidth;
  const height = window.innerHeight;
  canvas.width = width * dpr;
  canvas.height = height * dpr;
  canvas.style.width = width + 'px';
  canvas.style.height = height + 'px';
  const ctx = canvas.getContext('2d');
  if (ctx == null) return null;
  ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
  ctx.clearRect(0, 0, width, height);
  return ctx;
}
