/// WebGPU-backed Pixi.js API shim
/// Uses Canvas 2D for complex Graphics/Text, WebGPU for compositing

import { WebGPURenderer } from './webgpu-renderer';

// ---- Constants ----

export const LINE_CAP = Object.freeze({
  BUTT: Object.freeze({ value: 'butt', toNumber: () => 0 }),
  ROUND: Object.freeze({ value: 'round', toNumber: () => 1 }),
  SQUARE: Object.freeze({ value: 'square', toNumber: () => 2 }),
}) as any;
export const LINE_JOIN = Object.freeze({
  MITER: Object.freeze({ value: 'miter', toNumber: () => 0 }),
  ROUND: Object.freeze({ value: 'round', toNumber: () => 1 }),
  BEVEL: Object.freeze({ value: 'bevel', toNumber: () => 2 }),
}) as any;

// ---- Color ----

export class Color {
  private _r = 1; private _g = 1; private _b = 1; private _a = 1;
  constructor(value?: any) {
    if (value == null) return;
    if (typeof value === 'number') { this.setHex(value); return; }
    if (typeof value === 'string') { this.setHex(parseInt(value.replace('#', ''), 16)); return; }
    if (Array.isArray(value)) { [this._r, this._g, this._b, this._a = 1] = value; return; }
    if (typeof value === 'object') {
      // HSL object {h, s, l, a}
      if ('h' in value && 's' in value && 'l' in value) {
        const { h, s, l, a = 1 } = value as any;
        // Simple HSL→RGB conversion
        const hue = h / 360;
        const sat = s / 100;
        const lig = l / 100;
        const c = (1 - Math.abs(2 * lig - 1)) * sat;
        const x = c * (1 - Math.abs((hue * 6) % 2 - 1));
        const m = lig - c / 2;
        let r = 0, g = 0, b = 0;
        if (hue < 1/6) { r = c; g = x; }
        else if (hue < 2/6) { r = x; g = c; }
        else if (hue < 3/6) { g = c; b = x; }
        else if (hue < 4/6) { g = x; b = c; }
        else if (hue < 5/6) { r = x; b = c; }
        else { r = c; b = x; }
        this._r = r + m; this._g = g + m; this._b = b + m; this._a = a;
        return;
      }
      // Object with r,g,b or hex
      if ('r' in value) { this._r = (value as any).r; this._g = (value as any).g; this._b = (value as any).b; this._a = (value as any).a ?? 1; }
    }
  }
  setHex(hex: number): void {
    this._r = ((hex >> 16) & 0xff) / 255;
    this._g = ((hex >> 8) & 0xff) / 255;
    this._b = (hex & 0xff) / 255;
    this._a = 1;
  }
  toNumber(): number {
    return (Math.round(this._r * 255) << 16) | (Math.round(this._g * 255) << 8) | Math.round(this._b * 255);
  }
  toRgb(): [number, number, number] { return [this._r, this._g, this._b]; }
}

// ---- DisplayObject ----

class DisplayObject {
  x = 0; y = 0;
  position: { x: number; y: number; set: (x: number, y: number) => void };
  scale = { x: 1, y: 1, set(x: number, y: number) { this.x = x; this.y = y; } };
  pivot = { x: 0, y: 0, set(x: number, y: number) { this.x = x; this.y = y; } };
  rotation = 0; angle = 0; alpha = 1;
  visible = true;
  parent: Container | null = null;
  interactive = false;
  eventMode: string | undefined;
  buttonMode = false;
  cursor = 'auto';
  private _handlers: Map<string, (...args: any[]) => void> = new Map();
  hitArea: any = null;

  constructor() {
    const self = this;
    this.position = {
      get x() { return self.x; }, set x(v: number) { self.x = v; },
      get y() { return self.y; }, set y(v: number) { self.y = v; },
      set(x: number, y: number) { self.x = x; self.y = y; },
    };
  }

  on(event: string, fn: (...args: any[]) => void): this {
    this._handlers.set(event, fn);
    if (event === 'pointertap' || event === 'pointerdown' || event === 'click') {
      this.eventMode = 'dynamic';
    }
    return this;
  }
  off(event: string, fn?: (...args: any[]) => void): this {
    this._handlers.delete(event);
    if (this._handlers.size === 0) this.eventMode = undefined;
    return this;
  }
  getBounds() { return { x: this.x, y: this.y, width: 0, height: 0 }; }

  /** For hit testing: fire a pointertap event on this node */
  _firePointertap(e: any): void {
    const h = this._handlers.get('pointertap');
    if (h) h(e);
  }
  _hasHandler(event: string): boolean {
    return this._handlers.has(event);
  }
}

// ---- Container ----

export class Container extends DisplayObject {
  children: DisplayObject[] = [];
  width = 0; height = 0;
  addChild<T extends DisplayObject>(c: T): T { this.children.push(c); c.parent = this; return c; }
  addChildAt<T extends DisplayObject>(c: T, index: number): T { this.children.splice(index, 0, c); c.parent = this; return c; }
  removeChild<T extends DisplayObject>(c: T): T {
    const i = this.children.indexOf(c); if (i >= 0) this.children.splice(i, 1); c.parent = null; return c;
  }
  getChildAt(index: number): DisplayObject { return this.children[index]; }
  removeChildAt(index: number): DisplayObject { const c = this.children.splice(index, 1)[0]; if (c) c.parent = null; return c; }
  removeChildren(): void { for (const c of this.children) c.parent = null; this.children = []; }
  destroy(): void { this.removeChildren(); }
}

// ---- Graphics ----

type GOp =
  | ['beginFill', number, number?] | ['endFill']
  | ['lineStyle', number, number?, number?]
  | ['moveTo', number, number] | ['lineTo', number, number] | ['closePath']
  | ['drawRect', number, number, number, number]
  | ['drawCircle', number, number, number]
  | ['quadraticCurveTo', number, number, number, number]
  | ['bezierCurveTo', number, number, number, number, number, number]
  | ['arc', number, number, number, number, number, boolean?]
  | ['arcTo', number, number, number, number, number]
  | ['beginHole'] | ['endHole'];

export class Graphics extends DisplayObject {
  private _ops: GOp[] = [];
  beginFill(c = 0xffffff, a = 1) { this._ops.push(['beginFill', c, a]); return this; }
  endFill() { this._ops.push(['endFill']); return this; }
  lineStyle(w: any, c?: number, a?: number) {
    // Support both lineStyle(width,color,alpha) and lineStyle({width,color,alpha,cap,join})
    if (typeof w === 'object') {
      const s = w as any;
      this._ops.push(['lineStyle', s.width ?? 0, s.color ?? 0xffffff, s.alpha ?? 1]);
    } else {
      this._ops.push(['lineStyle', w ?? 0, c ?? 0xffffff, a ?? 1]);
    }
    return this;
  }
  moveTo(x: number, y: number) { this._ops.push(['moveTo', x, y]); return this; }
  lineTo(x: number, y: number) { this._ops.push(['lineTo', x, y]); return this; }
  drawRect(x: number, y: number, w: number, h: number) { this._ops.push(['drawRect', x, y, w, h]); return this; }
  drawCircle(x: number, y: number, r: number) { this._ops.push(['drawCircle', x, y, r]); return this; }
  drawRoundedRect(x: number, y: number, w: number, h: number, r: number) { this._ops.push(['drawRect', x, y, w, h]); return this; }
  closePath() { this._ops.push(['closePath']); return this; }
  beginHole() { this._ops.push(['beginHole']); return this; }
  endHole() { this._ops.push(['endHole']); return this; }
  quadraticCurveTo(cpx: number, cpy: number, tox: number, toy: number) {
    this._ops.push(['quadraticCurveTo', cpx, cpy, tox, toy]); return this;
  }
  bezierCurveTo(cp1x: number, cp1y: number, cp2x: number, cp2y: number, tox: number, toy: number) {
    this._ops.push(['bezierCurveTo', cp1x, cp1y, cp2x, cp2y, tox, toy]); return this;
  }
  arc(x: number, y: number, r: number, sa: number, ea: number, acw = false) {
    this._ops.push(['arc', x, y, r, sa, ea, acw]); return this;
  }
  arcTo(x1: number, y1: number, x2: number, y2: number, r: number) {
    this._ops.push(['arcTo', x1, y1, x2, y2, r]); return this;
  }
  clear() { this._ops = []; return this; }
  get ops(): readonly GOp[] { return this._ops; }
  destroy() { this._ops = []; }

  /** Replay ops onto a Canvas2D context. Returns bounding box. */
  replayToCanvas(ctx: CanvasRenderingContext2D): { x: number; y: number; w: number; h: number } {
    let minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;
    const extend = (x: number, y: number) => {
      if (x < minX) minX = x; if (y < minY) minY = y;
      if (x > maxX) maxX = x; if (y > maxY) maxY = y;
    };

    let hasFill = false;
    let hasStroke = false;
    let pathOpen = false;

    const flushPath = () => {
      if (!pathOpen) return;
      if (hasFill) ctx.fill();
      if (hasStroke) ctx.stroke();
      pathOpen = false;
    };

    ctx.save();
    // Pixi.js transform: translate → rotate → scale → pivot
    ctx.translate(this.x, this.y);
    ctx.rotate(this.rotation + this.angle * Math.PI / 180);
    ctx.scale(this.scale.x, this.scale.y);
    ctx.translate(-this.pivot.x, -this.pivot.y);
    ctx.globalAlpha *= this.alpha;

    for (const op of this._ops) {
      switch (op[0]) {
        case 'beginFill': {
          flushPath(); // flush previous shape
          const [, c, a = 1] = op;
          const r = ((c >> 16) & 0xff) / 255, g = ((c >> 8) & 0xff) / 255, b = (c & 0xff) / 255;
          ctx.fillStyle = `rgba(${r * 255},${g * 255},${b * 255},${a})`;
          hasFill = true;
          ctx.beginPath();
          pathOpen = true;
          break;
        }
        case 'endFill': {
          flushPath();
          hasFill = false;
          break;
        }
        case 'lineStyle': {
          const [, w, c = 0xffffff, a = 1] = op;
          const r = ((c >> 16) & 0xff) / 255, g = ((c >> 8) & 0xff) / 255, b = (c & 0xff) / 255;
          ctx.strokeStyle = `rgba(${r * 255},${g * 255},${b * 255},${a})`;
          ctx.lineWidth = w;
          hasStroke = w > 0;
          break;
        }
        case 'moveTo': {
          // Pixi.js: each moveTo starts a new sub-path within the current fill
          if (!pathOpen) { ctx.beginPath(); pathOpen = true; }
          const [, x, y] = op;
          ctx.moveTo(x, y);
          extend(x, y);
          break;
        }
        case 'lineTo': {
          if (!pathOpen) { ctx.beginPath(); pathOpen = true; }
          const [, x, y] = op;
          ctx.lineTo(x, y);
          extend(x, y);
          break;
        }
        case 'drawRect': {
          flushPath();
          const [, x, y, w, h] = op;
          if (hasFill) ctx.fillRect(x, y, w, h);
          if (hasStroke) ctx.strokeRect(x, y, w, h);
          extend(x, y); extend(x + w, y + h);
          break;
        }
        case 'drawCircle': {
          flushPath();
          const [, cx, cy, r] = op;
          ctx.beginPath();
          ctx.arc(cx, cy, r, 0, Math.PI * 2);
          if (hasFill) ctx.fill();
          if (hasStroke) ctx.stroke();
          extend(cx - r, cy - r); extend(cx + r, cy + r);
          break;
        }
        case 'closePath': {
          ctx.closePath();
          break;
        }
        case 'bezierCurveTo': {
          if (!pathOpen) { ctx.beginPath(); pathOpen = true; }
          const [, c1x, c1y, c2x, c2y, tox, toy] = op;
          ctx.bezierCurveTo(c1x, c1y, c2x, c2y, tox, toy);
          extend(tox, toy);
          break;
        }
        case 'quadraticCurveTo': {
          if (!pathOpen) { ctx.beginPath(); pathOpen = true; }
          const [, cpx, cpy, tox, toy] = op;
          ctx.quadraticCurveTo(cpx, cpy, tox, toy);
          extend(tox, toy);
          break;
        }
        case 'arc': {
          if (!pathOpen) { ctx.beginPath(); pathOpen = true; }
          const [, x, y, r, sa, ea, acw = false] = op;
          ctx.arc(x, y, r, sa, ea, acw);
          break;
        }
        case 'arcTo': {
          if (!pathOpen) { ctx.beginPath(); pathOpen = true; }
          const [, x1, y1, x2, y2, r] = op;
          ctx.arcTo(x1, y1, x2, y2, r);
          break;
        }
      }
    }
    // Flush any remaining open path
    flushPath();
    ctx.restore();
    const pad = 2;
    return {
      x: Math.floor(minX) - pad, y: Math.floor(minY) - pad,
      w: Math.ceil(maxX - minX) + pad * 2, h: Math.ceil(maxY - minY) + pad * 2,
    };
  }
}

// ---- Text ----

export class TextStyle {
  fontFamily = 'monospace'; fontSize = 14; fill: number | string = 0xffffff;
  fontWeight = 'normal'; align: 'left' | 'center' | 'right' = 'left'; lineHeight?: number;
  constructor(s?: Partial<TextStyle>) { if (s) Object.assign(this, s); }
}

export class Text extends DisplayObject {
  text: string; style: TextStyle; width = 0; height = 0;
  private _dirty = true;
  anchor: { x: number; y: number; set: (x: number, y: number) => void };
  constructor(text = '', style?: TextStyle | Partial<TextStyle>) {
    super();
    this.text = text; this.style = style instanceof TextStyle ? style : new TextStyle(style);
    this.anchor = { x: 0, y: 0, set(x: number, y?: number) { this.x = x; if (y !== undefined) this.y = y; } };
  }
}

// ---- Geometry & Mesh & Shader & Sprite ----

export class Geometry {
  constructor(
    public vertices: Float32Array,
    public indices: Uint16Array,
    public uvs: Float32Array = new Float32Array(),
  ) {}
}
export class Mesh extends DisplayObject {
  constructor(public geometry: Geometry, public shader: Shader | null = null) { super(); }
}
export class Shader {
  constructor(
    public vertexSrc: string, public fragmentSrc: string,
    public uniforms: Record<string, any> = {},
  ) {}
}
export class Sprite extends DisplayObject {
  width = 0; height = 0; texture: any;
  constructor(texture?: any) { super(); this.texture = texture; }
}

// ---- Application ----

export class Application {
  renderer: any;
  stage: Container;
  ticker: Ticker;
  private _canvas: HTMLCanvasElement;
  private _ctx: CanvasRenderingContext2D;
  private _displayCanvas: HTMLCanvasElement;
  private _wgpu: WebGPURenderer | null = null;
  private _wgpuReady = false;
  private _dpr = window.devicePixelRatio || 1;
  private _logicalW: number;
  private _logicalH: number;
  private _traverseCount = { g: 0, c: 0, t: 0 };
  private _debugCount = 0;
  private _debugLogged = false;
  private _hitTargets: Array<{ node: DisplayObject; bx: number; by: number; bw: number; bh: number }> = [];

  constructor(options?: any) {
    this.stage = new Container();
    this.ticker = new Ticker();

    const opts = options || {};
    const getSymVal = (keyPart: string, def: any) => {
      if (opts[keyPart] !== undefined) return opts[keyPart];
      for (const k of Object.getOwnPropertySymbols(opts)) {
        const s = k.toString();
        if (s.includes(keyPart)) return (opts as any)[k];
      }
      return def;
    };

    const width = getSymVal('width', window.innerWidth);
    const height = getSymVal('height', window.innerHeight);
    const bg = getSymVal('backgroundColor', 0x000000);
    const bgAlpha = getSymVal('backgroundAlpha', 1);
    const dpr = this._dpr;
    this._logicalW = width;
    this._logicalH = height;

    // Create the visible display canvas (HiDPI: physical pixels = logical * dpr)
    this._displayCanvas = document.createElement('canvas');
    this._displayCanvas.width = Math.round(width * dpr);
    this._displayCanvas.height = Math.round(height * dpr);
    this._displayCanvas.style.position = 'absolute';
    this._displayCanvas.style.top = '0';
    this._displayCanvas.style.left = '0';
    this._displayCanvas.style.width = width + 'px';
    this._displayCanvas.style.height = height + 'px';
    this._displayCanvas.style.zIndex = '-1';
    // Pixi.js exposes app.view directly
    (this as any).view = this._displayCanvas;

    this.renderer = {
      plugins: { accessibility: { destroy() {} } },
      render: (stage: Container) => this._render(stage),
      resize: (w: number, h: number) => {
        this._logicalW = w;
        this._logicalH = h;
        const pw = Math.round(w * dpr);
        const ph = Math.round(h * dpr);
        this._canvas!.width = pw;
        this._canvas!.height = ph;
        this._displayCanvas.width = pw;
        this._displayCanvas.height = ph;
        this._displayCanvas.style.width = w + 'px';
        this._displayCanvas.style.height = h + 'px';
        this._wgpu?.resize(pw, ph);
        this._ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      },
      view: this._displayCanvas,
      width,
      height,
    };

    // Offscreen canvas for Canvas 2D rendering
    this._canvas = document.createElement('canvas');
    this._canvas.width = Math.round(width * dpr);
    this._canvas.height = Math.round(height * dpr);
    this._canvas.style.width = width + 'px';
    this._canvas.style.height = height + 'px';
    this._ctx = this._canvas.getContext('2d')!;
    // Scale ctx so all drawing uses logical coordinates
    this._ctx.scale(dpr, dpr);

    // Background
    const br = ((bg >> 16) & 0xff) / 255, bgc = ((bg >> 8) & 0xff) / 255, bb = (bg & 0xff) / 255;
    this._ctx.fillStyle = `rgba(${br * 255},${bgc * 255},${bb * 255},${bgAlpha})`;

    // Init WebGPU on a SEPARATE canvas (not _displayCanvas which must stay 2D)
    this._initWebGPU(width, height);

    // Click-to-focus: intercept clicks on display canvas
    this._displayCanvas.addEventListener('click', (e) => this._onCanvasClick(e));
    this._displayCanvas.addEventListener('mousemove', (e) => this._onCanvasMouseMove(e));
  }

  private async _initWebGPU(width: number, height: number): Promise<void> {
    if (!navigator.gpu) return;
    this._wgpu = new WebGPURenderer();
    try {
      const gpuCanvas = document.createElement('canvas');
      gpuCanvas.width = width;
      gpuCanvas.height = height;
      this._wgpuReady = await this._wgpu.initialize({ canvas: gpuCanvas, width, height });
    } catch (_e) { /* WebGPU unavailable */ }
  }

  render(): void {
    this._render(this.stage);
  }

  private _render(stage: Container): void {
    const w = this._logicalW;
    const h = this._logicalH;
    this._ctx.clearRect(0, 0, w, h);
    this._ctx.fillRect(0, 0, w, h);
    this._traverseCount = { g: 0, c: 0, t: 0 };
    this._debugCount = 0;
    this._debugLogged = false;
    this._hitTargets = [];
    this._traverse(stage);
    console.log(`[render done] Graphics=${this._traverseCount.g} Container=${this._traverseCount.c} Text=${this._traverseCount.t} total=${this._traverseCount.g+this._traverseCount.c+this._traverseCount.t}`);
    const dispCtx = this._displayCanvas.getContext('2d')!;
    // Use physical pixel dimensions for display canvas (no DPR transform needed)
    dispCtx.clearRect(0, 0, this._displayCanvas.width, this._displayCanvas.height);
    dispCtx.drawImage(this._canvas, 0, 0, this._displayCanvas.width, this._displayCanvas.height);
  }

  private _traverse(node: DisplayObject, ctx = this._ctx, depth = 0): void {
    if (!node.visible) return;

    if (!this._debugLogged) {
      this._debugCount++;
      if (this._debugCount <= 15) {
        const type = node instanceof Graphics ? 'Graphics' : node instanceof Text ? 'Text' : node instanceof Container ? 'Container' : 'DisplayObject';
        console.log(`[traverse #${this._debugCount}] ${type} x=${node.x} y=${node.y} pivot=(${node.pivot.x},${node.pivot.y}) scale=(${node.scale.x},${node.scale.y}) rot=${node.rotation} children=${node instanceof Container ? node.children.length : 0}`);
      }
      if (this._debugCount === 16) { this._debugLogged = true; console.log(`... (more nodes, total will be logged later)`); }
    }

    ctx.save();

    // Check if this node should be recorded for hit testing
    const isInteractive = node.eventMode === 'dynamic' || node.eventMode === 'static' || node.buttonMode;
    let recordHitTarget = false;
    let localBounds: { x: number; y: number; w: number; h: number } | null = null;

    if (node instanceof Graphics) {
      this._traverseCount.g++;
      if (isInteractive) {
        localBounds = this._computeGraphicsLocalBounds(node);
        recordHitTarget = true;
      }
      node.replayToCanvas(ctx);
    } else if (node instanceof Text) {
      this._traverseCount.t++;
      ctx.font = `${node.style.fontWeight} ${node.style.fontSize}px ${node.style.fontFamily}`;
      ctx.fillStyle = typeof node.style.fill === 'number'
        ? `#${node.style.fill.toString(16).padStart(6, '0')}`
        : node.style.fill;
      ctx.textAlign = node.style.align;
      ctx.textBaseline = 'top';
      // Pixi.js transform for text: translate → rotate → scale → pivot
      ctx.translate(node.x, node.y);
      if (node.rotation) ctx.rotate(node.rotation);
      ctx.scale(node.scale.x, node.scale.y);
      ctx.translate(-node.pivot.x, -node.pivot.y);
      ctx.globalAlpha *= node.alpha;
      const textW = ctx.measureText(node.text).width;
      const metrics = ctx.measureText(node.text);
      const ascent = metrics.actualBoundingBoxAscent || 0;
      const descent = metrics.actualBoundingBoxDescent || 0;
      const textH = ascent + descent || node.style.fontSize;
      const ox = -node.anchor.x * textW;
      const oy = -node.anchor.y * textH;
      ctx.fillText(node.text, ox, oy);
      node.width = textW;
      node.height = textH;

      if (isInteractive) {
        localBounds = { x: -node.anchor.x * textW, y: -node.anchor.y * textH, w: textW, h: textH };
        recordHitTarget = true;
      }
    }

    if (node instanceof Container) {
      this._traverseCount.c++;
      // Pixi.js transform: translate → rotate → scale → pivot
      ctx.translate(node.x, node.y);
      if (node.rotation) ctx.rotate(node.rotation);
      ctx.scale(node.scale.x, node.scale.y);
      ctx.translate(-node.pivot.x, -node.pivot.y);
      ctx.globalAlpha *= node.alpha;

      // Record container itself as hit target if interactive
      if (isInteractive && node.width > 0 && node.height > 0) {
        localBounds = { x: 0, y: 0, w: node.width, h: node.height };
        recordHitTarget = true;
      }

      for (const child of node.children) this._traverse(child, ctx);
    }

    // Record hit target with screen-space bounds (convert from physical to logical pixels)
    if (recordHitTarget && localBounds && (node._hasHandler('pointertap') || node._hasHandler('pointerdown') || node._hasHandler('click'))) {
      let t: { a: number; b: number; c: number; d: number; e: number; f: number } = ctx.getTransform();
      // For Graphics, combine parent transform with Graphics' own transform
      // (not applied to ctx because replayToCanvas does internal save/restore)
      if (node instanceof Graphics) {
        const angle = node.rotation + node.angle * Math.PI / 180;
        const cosA = Math.cos(angle);
        const sinA = Math.sin(angle);
        const sx = node.scale.x;
        const sy = node.scale.y;
        const px = node.pivot.x;
        const py = node.pivot.y;
        // Graphics local matrix: T(x,y) × R(θ) × S(sx,sy) × T(-px,-py)
        const la = cosA * sx;
        const lb = sinA * sx;
        const lc = -sinA * sy;
        const ld = cosA * sy;
        const ltx = node.x - px * la - py * lc;
        const lty = node.y - px * lb - py * ld;
        // Multiply parent × local
        t = {
          a: t.a * la + t.c * lb,
          b: t.b * la + t.d * lb,
          c: t.a * lc + t.c * ld,
          d: t.b * lc + t.d * ld,
          e: t.a * ltx + t.c * lty + t.e,
          f: t.b * ltx + t.d * lty + t.f,
        };
      }
      const dprInv = 1 / this._dpr;
      const corners = [
        { x: localBounds.x, y: localBounds.y },
        { x: localBounds.x + localBounds.w, y: localBounds.y },
        { x: localBounds.x, y: localBounds.y + localBounds.h },
        { x: localBounds.x + localBounds.w, y: localBounds.y + localBounds.h },
      ].map(p => ({ x: (t.a * p.x + t.c * p.y + t.e) * dprInv, y: (t.b * p.x + t.d * p.y + t.f) * dprInv }));
      const minX = Math.min(...corners.map(p => p.x));
      const minY = Math.min(...corners.map(p => p.y));
      const maxX = Math.max(...corners.map(p => p.x));
      const maxY = Math.max(...corners.map(p => p.y));
      this._hitTargets.push({ node, bx: minX, by: minY, bw: maxX - minX, bh: maxY - minY });
    }

    ctx.restore();
  }

  private _computeGraphicsLocalBounds(g: Graphics): { x: number; y: number; w: number; h: number } {
    // Quick bounds from Graphics ops (simple version)
    let minX = Infinity, minY = Infinity, maxX = -Infinity, maxY = -Infinity;
    for (const op of g.ops) {
      switch (op[0]) {
        case 'drawRect': {
          const [, x, y, w, h] = op;
          if (x < minX) minX = x; if (y < minY) minY = y;
          if (x + w > maxX) maxX = x + w; if (y + h > maxY) maxY = y + h;
          break;
        }
        case 'drawCircle': {
          const [, cx, cy, r] = op;
          if (cx - r < minX) minX = cx - r; if (cy - r < minY) minY = cy - r;
          if (cx + r > maxX) maxX = cx + r; if (cy + r > maxY) maxY = cy + r;
          break;
        }
        case 'moveTo':
        case 'lineTo':
        case 'bezierCurveTo':
        case 'quadraticCurveTo': {
          for (let i = 1; i < op.length; i += 2) {
            const x = op[i] as number;
            const y = op[i + 1] as number;
            if (x < minX) minX = x; if (y < minY) minY = y;
            if (x > maxX) maxX = x; if (y > maxY) maxY = y;
          }
          break;
        }
        case 'arc': {
          const [, x, y, r] = op;
          if (x - r < minX) minX = x - r; if (y - r < minY) minY = y - r;
          if (x + r > maxX) maxX = x + r; if (y + r > maxY) maxY = y + r;
          break;
        }
      }
    }
    if (minX === Infinity) { minX = 0; minY = 0; maxX = 1; maxY = 1; }
    return { x: minX, y: minY, w: maxX - minX || 1, h: maxY - minY || 1 };
  }

  private _onCanvasClick(e: MouseEvent): void {
    const rect = this._displayCanvas.getBoundingClientRect();
    const mx = (e.clientX - rect.left) * (this._logicalW / rect.width);
    const my = (e.clientY - rect.top) * (this._logicalH / rect.height);
    // Check hit targets in reverse order (topmost first)
    for (let i = this._hitTargets.length - 1; i >= 0; i--) {
      const t = this._hitTargets[i];
      if (mx >= t.bx && mx <= t.bx + t.bw && my >= t.by && my <= t.by + t.bh) {
        t.node._firePointertap({
          target: t.node,
          currentTarget: t.node,
          data: { global: { x: mx, y: my }, originalEvent: e },
          originalEvent: e,
          metaKey: e.metaKey, shiftKey: e.shiftKey, ctrlKey: e.ctrlKey, altKey: e.altKey,
          button: e.button, buttons: e.buttons,
          clientX: e.clientX, clientY: e.clientY,
          screenX: e.screenX, screenY: e.screenY,
          preventDefault: () => e.preventDefault(),
          stopPropagation: () => e.stopPropagation(),
        });
        return;
      }
    }
  }

  private _onCanvasMouseMove(e: MouseEvent): void {
    const rect = this._displayCanvas.getBoundingClientRect();
    const mx = (e.clientX - rect.left) * (this._logicalW / rect.width);
    const my = (e.clientY - rect.top) * (this._logicalH / rect.height);
    let found = false;
    for (let i = this._hitTargets.length - 1; i >= 0; i--) {
      const t = this._hitTargets[i];
      if (mx >= t.bx && mx <= t.bx + t.bw && my >= t.by && my <= t.by + t.bh) {
        if (t.node.buttonMode) { found = true; break; }
      }
    }
    this._displayCanvas.style.cursor = found ? 'pointer' : 'default';
  }

  destroy(): void {
    this.stage.destroy();
    this.ticker.stop();
    this._wgpu?.destroy();
    this._displayCanvas.removeEventListener('click', (e: any) => this._onCanvasClick(e));
    this._displayCanvas.removeEventListener('mousemove', (e: any) => this._onCanvasMouseMove(e));
  }
}

// ---- Ticker ----

export class Ticker {
  static shared = { stop() { /* noop */ } } as any;
  static system = { stop() { /* noop */ } } as any;

  private _fns: Array<() => void> = [];
  private _running = false;
  private _rafId = 0;

  add(fn: () => void): void {
    this._fns.push(fn);
    if (!this._running) this._start();
  }

  remove(fn: () => void): void {
    const idx = this._fns.indexOf(fn);
    if (idx >= 0) this._fns.splice(idx, 1);
  }

  private _start(): void {
    if (this._running) return;
    this._running = true;
    const loop = () => {
      if (!this._running) return;
      for (const fn of this._fns) fn();
      this._rafId = requestAnimationFrame(loop);
    };
    this._rafId = requestAnimationFrame(loop);
  }

  stop(): void {
    this._running = false;
    cancelAnimationFrame(this._rafId);
  }

  destroy(): void { this.stop(); }

  get started(): boolean { return this._running; }
  get FPS(): number { return 60; }
}
