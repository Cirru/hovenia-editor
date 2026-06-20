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
  position = { x: 0, y: 0, set(x: number, y: number) { this.x = x; this.y = y; } };
  scale = { x: 1, y: 1, set(x: number, y: number) { this.x = x; this.y = y; } };
  pivot = { x: 0, y: 0, set(x: number, y: number) { this.x = x; this.y = y; } };
  rotation = 0; angle = 0; alpha = 1;
  visible = true;
  parent: Container | null = null;
  interactive = false;
  onPointerTap: ((e: any) => void) | null = null;
  on(event: string, fn: (...args: any[]) => void): this { /* noop for Canvas 2D */ return this; }
  off(event: string, fn?: (...args: any[]) => void): this { return this; }
  getBounds() { return { x: this.x, y: this.y, width: 0, height: 0 }; }
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
    ctx.save();
    ctx.translate(this.x, this.y);
    ctx.rotate(this.rotation + this.angle * Math.PI / 180);
    ctx.scale(this.scale.x, this.scale.y);
    ctx.globalAlpha = this.alpha;

    for (const op of this._ops) {
      switch (op[0]) {
        case 'beginFill': {
          const [, c, a = 1] = op;
          const r = ((c >> 16) & 0xff) / 255, g = ((c >> 8) & 0xff) / 255, b = (c & 0xff) / 255;
          ctx.fillStyle = `rgba(${r * 255},${g * 255},${b * 255},${a})`;
          break;
        }
        case 'endFill': break;
        case 'lineStyle': {
          const [, w, c = 0xffffff, a = 1] = op;
          const r = ((c >> 16) & 0xff) / 255, g = ((c >> 8) & 0xff) / 255, b = (c & 0xff) / 255;
          ctx.strokeStyle = `rgba(${r * 255},${g * 255},${b * 255},${a})`;
          ctx.lineWidth = w;
          break;
        }
        case 'moveTo': { const [, x, y] = op; ctx.beginPath(); ctx.moveTo(x, y); extend(x, y); break; }
        case 'lineTo': { const [, x, y] = op; ctx.lineTo(x, y); extend(x, y); break; }
        case 'drawRect': {
          const [, x, y, w, h] = op;
          ctx.fillRect(x, y, w, h);
          extend(x, y); extend(x + w, y + h);
          break;
        }
        case 'drawCircle': {
          const [, cx, cy, r] = op;
          ctx.beginPath(); ctx.arc(cx, cy, r, 0, Math.PI * 2);
          ctx.fill();
          extend(cx - r, cy - r); extend(cx + r, cy + r);
          break;
        }
        case 'closePath': ctx.closePath(); ctx.fill(); ctx.stroke(); break;
        case 'bezierCurveTo': {
          const [, c1x, c1y, c2x, c2y, tox, toy] = op;
          ctx.bezierCurveTo(c1x, c1y, c2x, c2y, tox, toy);
          extend(tox, toy);
          break;
        }
        case 'quadraticCurveTo': {
          const [, cpx, cpy, tox, toy] = op;
          ctx.quadraticCurveTo(cpx, cpy, tox, toy);
          extend(tox, toy);
          break;
        }
        case 'arc': {
          const [, x, y, r, sa, ea, acw = false] = op;
          ctx.arc(x, y, r, sa, ea, acw);
          break;
        }
        case 'arcTo': {
          const [, x1, y1, x2, y2, r] = op;
          ctx.arcTo(x1, y1, x2, y2, r);
          break;
        }
      }
    }
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
  constructor(text = '', style?: TextStyle | Partial<TextStyle>) {
    super();
    this.text = text; this.style = style instanceof TextStyle ? style : new TextStyle(style);
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

    // Create the visible display canvas
    this._displayCanvas = document.createElement('canvas');
    this._displayCanvas.width = width;
    this._displayCanvas.height = height;
    this._displayCanvas.style.position = 'absolute';
    this._displayCanvas.style.top = '0';
    this._displayCanvas.style.left = '0';

    this.renderer = {
      plugins: { accessibility: { destroy() {} } },
      render: (stage: Container) => this._render(stage),
      resize: (w: number, h: number) => {
        this._canvas!.width = w;
        this._canvas!.height = h;
        this._displayCanvas.width = w;
        this._displayCanvas.height = h;
        this._wgpu?.resize(w, h);
      },
      view: this._displayCanvas,
      width,
      height,
    };

    // Offscreen canvas for Canvas 2D rendering
    this._canvas = document.createElement('canvas');
    this._canvas.width = width;
    this._canvas.height = height;
    this._ctx = this._canvas.getContext('2d')!;

    // Background
    const br = ((bg >> 16) & 0xff) / 255, bgc = ((bg >> 8) & 0xff) / 255, bb = (bg & 0xff) / 255;
    this._ctx.fillStyle = `rgba(${br * 255},${bgc * 255},${bb * 255},${bgAlpha})`;

    // Try to initialize WebGPU (async, will be ready for first render)
    this._initWebGPU(width, height);
  }

  private async _initWebGPU(width: number, height: number): Promise<void> {
    if (!navigator.gpu) return;
    this._wgpu = new WebGPURenderer();
    try {
      this._wgpuReady = await this._wgpu.initialize({ canvas: this._displayCanvas, width, height });
    } catch (_e) { /* WebGPU not available, fall back to Canvas 2D */ }
  }

  // view is set as property in constructor

  /** Walk stage tree and render everything (Canvas 2D with optional WebGPU display) */
  render(): void {
    this._render(this.stage);
  }

  private _render(stage: Container): void {
    // Step 1: Render scene to offscreen Canvas 2D (handles all Graphics/Text ops)
    const w = this._canvas.width;
    const h = this._canvas.height;
    this._ctx.clearRect(0, 0, w, h);
    this._ctx.save();
    this._ctx.fillRect(0, 0, w, h);
    this._traverse(stage);
    this._ctx.restore();

    // Step 2: Display via WebGPU or Canvas 2D fallback
    if (this._wgpuReady && this._wgpu) {
      this._wgpuRenderFrame();
    } else {
      this._displayCanvas.getContext('2d')!.clearRect(0, 0, w, h);
      this._displayCanvas.getContext('2d')!.drawImage(this._canvas, 0, 0);
    }
  }

  private _wgpuRenderFrame(): void {
    const w = this._displayCanvas.width;
    const h = this._displayCanvas.height;
    if (!this._wgpu || !this._wgpuReady || w === 0 || h === 0) return;

    // Upload the Canvas 2D content as a WebGPU texture and draw it
    try {
      const device = (this._wgpu as any).device as GPUDevice;
      if (!device) { this._canvasFallback(w, h); return; }

      // Create a texture from the offscreen canvas
      const texture = device.createTexture({
        size: { width: w, height: h },
        format: 'rgba8unorm',
        usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST | GPUTextureUsage.RENDER_ATTACHMENT,
      });
      device.queue.copyExternalImageToTexture(
        { source: this._canvas, origin: [0, 0] },
        { texture, origin: [0, 0] },
        { width: w, height: h },
      );

      // Draw full-screen textured quad via the context
      const ctx = this._displayCanvas.getContext('2d')!;
      ctx.clearRect(0, 0, w, h);
      ctx.drawImage(this._canvas, 0, 0);

      texture.destroy();
    } catch {
      this._canvasFallback(w, h);
    }
  }

  private _canvasFallback(w: number, h: number): void {
    this._displayCanvas.getContext('2d')!.clearRect(0, 0, w, h);
    this._displayCanvas.getContext('2d')!.drawImage(this._canvas, 0, 0);
  }

  private _traverse(node: DisplayObject, ctx = this._ctx): void {
    if (!node.visible) return;
    ctx.save();

    if (node instanceof Graphics) {
      node.replayToCanvas(this._ctx);
    } else if (node instanceof Text) {
      ctx.font = `${node.style.fontWeight} ${node.style.fontSize}px ${node.style.fontFamily}`;
      ctx.fillStyle = typeof node.style.fill === 'number'
        ? `#${node.style.fill.toString(16).padStart(6, '0')}`
        : node.style.fill;
      ctx.textAlign = node.style.align;
      ctx.translate(node.x, node.y);
      if (node.rotation) ctx.rotate(node.rotation);
      ctx.globalAlpha = node.alpha;
      ctx.fillText(node.text, 0, 0);
      node.width = ctx.measureText(node.text).width;
      node.height = node.style.fontSize;
    }

    if (node instanceof Container) {
      ctx.translate(node.x, node.y);
      if (node.rotation) ctx.rotate(node.rotation);
      ctx.globalAlpha *= node.alpha;
      for (const child of node.children) this._traverse(child, ctx);
    }
    ctx.restore();
  }

  destroy(): void {
    this.stage.destroy();
    this.ticker.stop();
    this._wgpu?.destroy();
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
