# 渲染引擎迁移: Pixi.js → WebGPU

日期: 2026-06-20
状态: Draft

## 1. 背景

当前 hovenia-editor 使用 Phlox（Calcit UI 框架）+ Pixi.js 做 2D 渲染。Pixi.js 封装了 WebGL，在反复更新（高频重绘）场景下性能不佳。目标是直接使用 WebGPU API，去掉 Pixi.js 依赖，减少中间层开销。

## 2. 当前架构

```
Calcit 源码 (calcit.cirru)
  → 编译为 JS (js-out/app.*.mjs)
    → 调用 Phlox (js-out/phlox.*.mjs) — UI 组件库
      → 调用 Pixi.js (npm) — WebGL 渲染
```

关键渲染接口在 `phlox.render.draw.mjs` 中：

| 函数 | 说明 | 调用 Pixi.js API |
|------|------|-----------------|
| `init_box_size` | 设置容器尺寸 | `target.width/height` |
| `init_position` | 设置位置 | `target.x/y` |
| `init_rotation` | 设置旋转 | `target.rotation` |
| `init_alpha` | 设置透明度 | `target.alpha` |
| `init_angle` | 设置角度 | `target.angle` |
| `init_events` | 绑定事件 | PIXI 事件系统 |
| `init_line_style` | 线条样式 | LINE_CAP/LINE_JOIN 等 |
| `init_pivot` | 设置锚点 | `target.pivot` |
| `draw_rect` | 绘制矩形 | `graphics.drawRect` |
| `draw_circle` | 绘制圆形 | `graphics.drawCircle` |
| `call_graphics_ops` | 批量图形操作 | `graphics` 各种方法 |
| `update_*` | 更新属性 | 对应 setter |

## 3. 目标架构

```
Calcit 源码 (calcit.cirru)
  → 编译为 JS (js-out/app.*.mjs)
    → 调用 Phlox (js-out/phlox.*.mjs) — UI 组件库
      → 调用 WebGPU Renderer (TypeScript, lib/webgpu-renderer/) — 直接 WebGPU
```

Phlox 层面不需要改动 UI 逻辑——只需要替换 `phlox.render.*` 背后的实现，从 Pixi.js 切换到 WebGPU。

## 4. 可行性评估

### 4.1 优势

- **减少中间层**：去掉 Pixi.js 的抽象，直接控制 GPU
- **更高效的批量绘制**：WebGPU 的 Compute Shader 和 Render Bundle 适合大量 2D 图元
- **更小的包体积**：Pixi.js 7.x ~1.5MB minified → WebGPU 自定义 ~200KB
- **更好的性能**：WebGPU 的 draw call 开销远低于 WebGL/Pixi.js

### 4.2 风险

- **浏览器兼容性**：WebGPU 仅在 Chrome 113+、Edge 113+、Firefox Nightly 支持。Safari 部分支持
- **开发成本高**：需要实现完整的 2D 渲染管线（顶点着色器、片段着色器、批处理）
- **事件系统**：Pixi.js 提供了完善的 hit-test + 事件分发；WebGPU 需要自己实现（通过 canvas 2D 或 JS 计算）
- **文本渲染**：Pixi.js 支持文本；WebGPU 原生不支持，需用 signed-distance-field (SDF) 或 canvas 纹理回退
- **过度绘制**：在超大量元素（数千矩形/圆）时，WebGPU Render Bundle 表现优异，但小场景可能感觉不到差异

### 4.3 依赖清单（需要实现）

| 能力 | Pixi.js 方案 | WebGPU 替代 |
|------|-------------|------------|
| Canvas/context 管理 | `new PIXI.Application` | `navigator.gpu.requestAdapter → device → context.configure` |
| 矩形绘制 | `graphics.drawRect` | 自定义 vertex/fragment shader + render pipeline |
| 圆形绘制 | `graphics.drawCircle` | 镶嵌为三角形 mesh，或使用 fragment shader SDF |
| 线条/路径 | `graphics.lineTo/moveTo` | 复杂——需要实现线框渲染或 triangulation |
| 变换(位置/旋转/缩放) | Pixi.js Container 内置 | uniform buffer + 矩阵计算 |
| 透明度 | `target.alpha` | 在 fragment shader 或 blend state 中处理 |
| 事件(hit-test) | `target.on('click',...)` | 基于鼠标坐标 + 渲染元素 bounding box 的 JS 计算 |
| 文本 | Pixi.js Text/TextStyle | canvas 2D 离屏渲染 → 上传为纹理 → 在 quad 上显示 (SDF) |
| 图层/容器 | Pixi.js Container 树 | Render bundle 排序 + 深度测试 |

## 5. 实施计划

### Phase 1: 基础设施（预估 2-3 周）

#### Task 1.1: WebGPU TypeScript 绑定层
- 创建 `lib/webgpu-renderer/types.ts` — 定义核心类型
- 创建 `lib/webgpu-renderer/device.ts` — GPU 设备初始化、adapter 请求、canvas context 配置
- 创建 `lib/webgpu-renderer/shader.ts` — 着色器模块加载与编译

```
lib/webgpu-renderer/
  types.ts         — Vec2, Rect, Color, Transform 等基础类型
  device.ts        — GPUDevice 单例管理
  shaders/         — WGSL 着色器源码
    rect.wgsl      — 矩形渲染
    circle.wgsl    — 圆形渲染 (SDF)
    line.wgsl      — 线条渲染
  pipeline.ts      — RenderPipeline 工厂
  buffer.ts        — 顶点/索引 buffer 管理
```

#### Task 1.2: 基础几何体渲染管线
- 实现矩形渲染管线（顶点buffer + uniform buffer + render pipeline）
- 实现圆形渲染管线（使用 fragment shader SDF，在 quad 上绘制圆）
- 实现批量提交（batch submit）—— 多个几何体合并到一个 draw call
- 实现 transform 矩阵（位置、旋转、缩放）

#### Task 1.3: RenderBundle 系统
- 利用 WebGPU RenderBundle 录制重复的绘制命令
- 在元素未变化时复用 bundle，减少 CPU 端的 command encoding 开销
- 这是解决"反复更新性能问题"的核心优化

### Phase 2: 渲染能力补齐（预估 2-3 周）

#### Task 2.1: 线条/路径渲染
- 实现线框渲染管线（支持线宽、line-cap、line-join）
- 或先用 tessellation 将线条转为三角形 mesh
- 支持 `moveTo` / `lineTo` / `bezierTo` / `arcTo` 等路径命令

#### Task 2.2: 纹理与文本渲染
- 实现纹理渲染管线（纹理坐标、sampler）
- 使用 canvas 2D 离屏渲染文本 → 上传为纹理 → WebGPU 渲染
- 可选：实现 SDF (Signed Distance Field) 文本渲染以获得更好的缩放质量

#### Task 2.3: 事件系统
- 实现 hit-test 机制：维护渲染元素的 bounding box 树
- 鼠标/触摸 → 计算坐标 → 遍历查找命中元素 → 触发回调
- 可复用 Pixi.js 的部分设计思路但直接用 JS 实现

### Phase 3: 集成与替换（预估 1-2 周）

#### Task 3.1: 替换 `phlox.render.draw.mjs` 接口
- 分析 `phlox.render.draw.mjs` 导出的所有函数签名
- 在 TypeScript 层实现相同的 API（`draw_rect`, `draw_circle`, `init_line_style` 等）
- 保持函数签名兼容，使 Phlox 无感知切换

#### Task 3.2: 替换 `phlox.render.mjs` 生命周期
- 初始化流程：`new PIXI.Application()` → WebGPU device + context 初始化
- 帧循环：Pixi.js ticker → `requestAnimationFrame` + WebGPU command encoding + submit
- resize 处理

#### Task 3.3: 替换 `phlox.core.mjs` 的容器/元素管理
- Container 树 → RenderBundle 层级管理
- 增删改操作 → diff → bundle 重建或 patch

#### Task 3.4: 移除 Pixi.js 依赖
- `yarn remove pixi.js`
- 清理 `package.json` 和 `main.mjs` 中的 Pixi.js 引用

### Phase 4: 优化与验证（预估 1 周）

#### Task 4.1: 性能基准测试
- 测量当前 Pixi.js 版本的 FPS、内存、首次加载时间
- 测量 WebGPU 版本的相同指标
- 确认高频更新场景下的性能提升

#### Task 4.2: 浏览器兼容性验证
- Chrome / Edge (WebGPU 支持完整)
- Firefox Nightly
- Safari (WebGPU 部分支持 — 可能需要 fallback)
- 移动端测试

#### Task 4.3: 降级方案
- 对于不支持 WebGPU 的浏览器，回退到 Pixi.js 或 Canvas 2D
- 通过 `navigator.gpu` 检测决定使用哪个渲染后端

## 6. 风险与应对

| 风险 | 概率 | 影响 | 应对 |
|------|------|------|------|
| WebGPU 浏览器覆盖率低 | 中 | 高 | 保留 Canvas 2D 降级方案 |
| 文本渲染质量下降 | 低 | 中 | 使用 canvas 2D 离屏纹理 |
| 事件系统精度不足 | 中 | 中 | 使用 hit-test + bounding box；参考 SVG 方案 |
| 开发周期过长 | 中 | 高 | 分阶段交付，Phase 1 完成即可验证核心性能 |

## 7. 验收标准

- [ ] 矩形、圆形、线条绘制与 Pixi.js 版本像素级一致
- [ ] 文本渲染正确（含中文字符）
- [ ] 事件（点击、鼠标移动）在不同缩放/变换下位置准确
- [ ] 高频更新场景（>60fps）下帧率稳定
- [ ] bundle 体积 ≤ 原始 Pixi.js 的 30%
- [ ] Chrome/Edge 上运行无报错
