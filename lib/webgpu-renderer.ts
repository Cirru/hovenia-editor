/// Core WebGPU renderer for Hovenia Editor
/// Batched 2D rendering: accumulates draw calls, flushes one vertex buffer per frame

export interface RendererConfig {
  canvas: HTMLCanvasElement;
  width: number;
  height: number;
  backgroundColor?: [number, number, number, number];
}

export interface RectProps {
  x: number;
  y: number;
  width: number;
  height: number;
  fillColor?: [number, number, number, number];
  alpha?: number;
  rotation?: number;
}

export interface CircleProps {
  x: number;
  y: number;
  radius: number;
  fillColor?: [number, number, number, number];
  alpha?: number;
}

export interface TextProps {
  text: string;
  x: number;
  y: number;
  fontSize?: number;
  color?: [number, number, number, number];
  alpha?: number;
}

// ---- Draw command types ----

type ShapeKind = 'rect' | 'circle';

interface DrawCommand {
  kind: ShapeKind;
  x: number;
  y: number;
  w: number;
  h: number;
  r: number;
  color: [number, number, number, number];
}

// ---- WGSL Shaders ----

const VERTEX_SHADER = `
  struct Uniforms {
    projection: mat4x4<f32>,
  }

  @group(0) @binding(0) var<uniform> uniforms: Uniforms;

  struct VertexOutput {
    @builtin(position) position: vec4<f32>,
    @location(0) uv: vec2<f32>,
    @location(1) color: vec4<f32>,
    @location(2) kind: f32,
  }

  @vertex
  fn main(@location(0) pos: vec2<f32>, @location(1) uv: vec2<f32>, @location(2) color: vec4<f32>, @location(3) kind: f32) -> VertexOutput {
    var output: VertexOutput;
    output.position = uniforms.projection * vec4<f32>(pos, 0.0, 1.0);
    output.uv = uv;
    output.color = color;
    output.kind = kind;
    return output;
  }
`;

const FRAGMENT_SHADER = `
  @fragment
  fn main(@location(0) uv: vec2<f32>, @location(1) color: vec4<f32>, @location(2) kind: f32) -> @location(0) vec4<f32> {
    var alpha = color.a;
    if (kind > 0.5) {
      let dist = length(uv - vec2<f32>(0.5, 0.5));
      let radius = 0.5;
      let smoothed = 1.0 - smoothstep(radius - 0.01, radius + 0.01, dist);
      alpha = alpha * smoothed;
    }
    return vec4<f32>(color.rgb, alpha);
  }
`;

// ---- Matrix utilities ----

function orthoMatrix(left: number, right: number, bottom: number, top: number, near: number, far: number): Float32Array {
  const out = new Float32Array(16);
  out[0] = 2 / (right - left);
  out[5] = 2 / (top - bottom);
  out[10] = -2 / (far - near);
  out[12] = -(right + left) / (right - left);
  out[13] = -(top + bottom) / (top - bottom);
  out[14] = -(far + near) / (far - near);
  out[15] = 1;
  return out;
}

// ---- Vertex data constants ----

const VERTEX_STRIDE = 36; // 9 floats * 4 bytes
const VERTS_PER_QUAD = 4;
const INDICES_PER_QUAD = 6;

// ---- Main Renderer ----

export class WebGPURenderer {
  private device: GPUDevice | null = null;
  private context: GPUCanvasContext | null = null;
  private format: GPUTextureFormat = 'bgra8unorm';
  private canvas: HTMLCanvasElement | null = null;

  private pipeline: GPURenderPipeline | null = null;
  private uniformBuffer: GPUBuffer | null = null;
  private bindGroup: GPUBindGroup | null = null;
  private projection: Float32Array = new Float32Array(16);

  private vertexBuffer: GPUBuffer | null = null;
  private indexBuffer: GPUBuffer | null = null;
  private maxQuads: number = 0;

  private commands: DrawCommand[] = [];
  private frameCount = 0;
  private initialized = false;

  // Reusable vertex data buffer to avoid per-frame allocation
  private vertData: Float32Array | null = null;
  private vertDataCapacity = 0;

  async initialize(config: RendererConfig): Promise<boolean> {
    if (this.initialized) return true;
    this.canvas = config.canvas;

    if (!navigator.gpu) { console.warn('WebGPU not supported'); return false; }
    const adapter = await navigator.gpu.requestAdapter();
    if (!adapter) { console.warn('No GPU adapter'); return false; }

    this.device = await adapter.requestDevice();
    this.context = this.canvas.getContext('webgpu');
    if (!this.context) { console.warn('No WebGPU context'); return false; }

    this.format = navigator.gpu.getPreferredCanvasFormat();
    this.context.configure({ device: this.device, format: this.format, alphaMode: 'premultiplied' });

    this.projection = orthoMatrix(0, config.width, config.height, 0, -1, 1);

    // Create pipeline
    const vs = this.device.createShaderModule({ code: VERTEX_SHADER });
    const fs = this.device.createShaderModule({ code: FRAGMENT_SHADER });

    this.pipeline = this.device.createRenderPipeline({
      layout: 'auto',
      vertex: {
        module: vs,
        entryPoint: 'main',
        buffers: [{
          arrayStride: VERTEX_STRIDE,
          attributes: [
            { shaderLocation: 0, offset: 0, format: 'float32x2' },
            { shaderLocation: 1, offset: 8, format: 'float32x2' },
            { shaderLocation: 2, offset: 16, format: 'float32x4' },
            { shaderLocation: 3, offset: 32, format: 'float32' },
          ],
        }],
      },
      fragment: {
        module: fs, entryPoint: 'main',
        targets: [{ format: this.format }],
      },
      primitive: { topology: 'triangle-list' },
    });

    // Uniform buffer
    this.uniformBuffer = this.device.createBuffer({
      size: 64,
      usage: GPUBufferUsage.UNIFORM | GPUBufferUsage.COPY_DST,
    });

    this.bindGroup = this.device.createBindGroup({
      layout: this.pipeline.getBindGroupLayout(0),
      entries: [{ binding: 0, resource: { buffer: this.uniformBuffer } }],
    });

    this.maxQuads = 4096;
    this.allocateBuffers(this.maxQuads);

    this.initialized = true;
    return true;
  }

  private allocateBuffers(maxQuads: number): void {
    if (!this.device) return;
    this.maxQuads = maxQuads;

    this.vertexBuffer?.destroy();
    this.indexBuffer?.destroy();

    this.vertexBuffer = this.device.createBuffer({
      size: maxQuads * VERTS_PER_QUAD * VERTEX_STRIDE,
      usage: GPUBufferUsage.VERTEX | GPUBufferUsage.COPY_DST,
    });

    const indexData = new Uint16Array(maxQuads * INDICES_PER_QUAD);
    for (let i = 0; i < maxQuads; i++) {
      const base = i * 4;
      indexData[i * 6 + 0] = base + 0;
      indexData[i * 6 + 1] = base + 1;
      indexData[i * 6 + 2] = base + 2;
      indexData[i * 6 + 3] = base + 0;
      indexData[i * 6 + 4] = base + 2;
      indexData[i * 6 + 5] = base + 3;
    }

    this.indexBuffer = this.device.createBuffer({
      size: indexData.byteLength,
      usage: GPUBufferUsage.INDEX,
      mappedAtCreation: true,
    });
    new Uint16Array(this.indexBuffer.getMappedRange()).set(indexData);
    this.indexBuffer.unmap();
  }

  // ---- Public drawing API ----

  clear(_color?: { r: number; g: number; b: number; a: number }): void {}

  drawRect(props: RectProps): void {
    const c: [number, number, number, number] = props.fillColor ?? [1, 1, 1, 1];
    const a = props.alpha ?? 1;
    this.commands.push({
      kind: 'rect', x: props.x, y: props.y, w: props.width, h: props.height, r: props.rotation ?? 0,
      color: [c[0] * a, c[1] * a, c[2] * a, a],
    });
  }

  drawCircle(props: CircleProps): void {
    const c: [number, number, number, number] = props.fillColor ?? [1, 1, 1, 1];
    const a = props.alpha ?? 1;
    const d = props.radius * 2;
    this.commands.push({
      kind: 'circle', x: props.x - props.radius, y: props.y - props.radius, w: d, h: d, r: 0,
      color: [c[0] * a, c[1] * a, c[2] * a, a],
    });
  }

  render(): void {
    if (!this.device || !this.context || !this.pipeline) return;
    const count = this.commands.length;

    if (count === 0) { return; }

    if (count > this.maxQuads) {
      this.allocateBuffers(Math.ceil(count * 1.5));
    }

    // Reuse vertex data buffer: grow when needed, never shrink
    const floatsNeeded = count * VERTS_PER_QUAD * 9;
    if (!this.vertData || floatsNeeded > this.vertDataCapacity) {
      this.vertDataCapacity = Math.ceil(floatsNeeded * 1.5);
      this.vertData = new Float32Array(this.vertDataCapacity);
    }
    const vertData = this.vertData!;
    let off = 0;

    for (let i = 0; i < count; i++) {
      const cmd = this.commands[i];
      const hw = cmd.w / 2, hh = cmd.h / 2;
      const cx = cmd.x + hw, cy = cmd.y + hh;
      const kind = cmd.kind === 'circle' ? 1.0 : 0.0;

      // Skip trig for non-rotated shapes
      let cr = 1, sr = 0;
      if (cmd.r !== 0) { cr = Math.cos(cmd.r); sr = Math.sin(cmd.r); }

      const c0 = cmd.color[0], c1 = cmd.color[1], c2 = cmd.color[2], c3 = cmd.color[3];

      // Unrolled quad vertices (4 corners) to avoid per-command array allocation
      // Corner 0: top-left
      vertData[off++] = -hw * cr - (-hh) * sr + cx;
      vertData[off++] = -hw * sr + (-hh) * cr + cy;
      vertData[off++] = 0; vertData[off++] = 0;
      vertData[off++] = c0; vertData[off++] = c1; vertData[off++] = c2; vertData[off++] = c3;
      vertData[off++] = kind;
      // Corner 1: top-right
      vertData[off++] = hw * cr - (-hh) * sr + cx;
      vertData[off++] = hw * sr + (-hh) * cr + cy;
      vertData[off++] = 1; vertData[off++] = 0;
      vertData[off++] = c0; vertData[off++] = c1; vertData[off++] = c2; vertData[off++] = c3;
      vertData[off++] = kind;
      // Corner 2: bottom-right
      vertData[off++] = hw * cr - hh * sr + cx;
      vertData[off++] = hw * sr + hh * cr + cy;
      vertData[off++] = 1; vertData[off++] = 1;
      vertData[off++] = c0; vertData[off++] = c1; vertData[off++] = c2; vertData[off++] = c3;
      vertData[off++] = kind;
      // Corner 3: bottom-left
      vertData[off++] = -hw * cr - hh * sr + cx;
      vertData[off++] = -hw * sr + hh * cr + cy;
      vertData[off++] = 0; vertData[off++] = 1;
      vertData[off++] = c0; vertData[off++] = c1; vertData[off++] = c2; vertData[off++] = c3;
      vertData[off++] = kind;
    }

    this.device.queue.writeBuffer(this.vertexBuffer!, 0, vertData.subarray(0, off));
    this.device.queue.writeBuffer(this.uniformBuffer!, 0, this.projection);

    const encoder = this.device.createCommandEncoder();
    const pass = encoder.beginRenderPass({
      colorAttachments: [{
        view: this.context.getCurrentTexture().createView(),
        loadOp: 'clear', storeOp: 'store',
        clearValue: { r: 0, g: 0, b: 0, a: 1 },
      }],
    });
    pass.setPipeline(this.pipeline);
    pass.setVertexBuffer(0, this.vertexBuffer!);
    pass.setIndexBuffer(this.indexBuffer!, 'uint16');
    pass.setBindGroup(0, this.bindGroup!);
    pass.drawIndexed(count * INDICES_PER_QUAD);
    pass.end();

    this.device.queue.submit([encoder.finish()]);
    this.commands.length = 0;
    this.frameCount++;
  }

  resize(width: number, height: number): void {
    if (this.canvas) { this.canvas.width = width; this.canvas.height = height; }
    this.projection = orthoMatrix(0, width, height, 0, -1, 1);
    if (this.context) {
      this.context.configure({ device: this.device!, format: this.format, alphaMode: 'premultiplied' });
    }
  }

  destroy(): void {
    this.initialized = false;
    this.vertexBuffer?.destroy();
    this.indexBuffer?.destroy();
    this.uniformBuffer?.destroy();
    this.device?.destroy();
    this.device = null;
    this.context = null;
  }
}
