# Phlox 引用审计与删除计划

## 已提交

Commit `6993a78` — Fix text vertical centering in rects and URL quick navigation.

## Phlox 引用概览

### 1. 依赖声明

| 文件 | 内容 |
|------|------|
| `deps.cirru:4` | `|Phlox-GL/phlox |0.7.3` — Calcit 模块依赖 |
| `package.json:26` | `"@quamolit/phlox-utils": "^0.0.2"` — npm 包依赖（用于 `phlox.util`/`phlox.render` 等） |
| `calcit.cirru:4` | `:modules` 中包含 `|phlox/` |
| `vite.config.js:5` | `'pixi.js': '/lib/pixi-shim.ts'` — 已用 shim 替换 pixi.js |

### 2. 源代码（calcit.cirru）中 phlox import 现状

#### ✅ 已清理完毕
| 模块 | 状态 | 替换方式 |
|------|------|----------|
| `phlox.complex` | ✅ 已移除 | 用 `app.math` 的 `add-path`/`subtract-path` 替换 |
| `phlox.config` | ✅ 已移除 | 在 `app.config` 中添加 `dev?`/`mobile?` 定义 |
| `phlox.cursor` | ✅ 已移除 | 在 `app.updater` 中添加本地 `update-states` |

#### ⬜ 仍在使用
| 模块 | 使用 ns 数 | API |
|------|-----------|-----|
| `phlox.core` | 6 | `defcomp`, `>>`, `hslx/hclx/hsluvx`, `rect/circle/text/container/graphics/create-list/g/polyline/line-segments`, `render!/clear-phlox-caches!/on-control-event` |

#### ✅ 已清理完毕
| 模块 | 状态 | 替换方式 |
|------|------|----------|
| `phlox.complex` | ✅ | 用 `app.math` 的 `add-path`/`subtract-path` 替换 |
| `phlox.config` | ✅ | 在 `app.config` 中添加 `dev?`/`mobile?` |
| `phlox.cursor` | ✅ | 在 `app.updater` 中添加本地 `update-states` |
| `phlox.util` | ✅ | 在 `app.config` 中添加本地 `measure-text-width!` |
| `phlox.comp.button` | ✅ | 在 `app.comp.deps-of` 中添加本地 `comp-button` |
| `phlox.comp.drag-point` | ✅ | 移除（死代码） |
| `phlox.comp.slider` | ✅ | 在 `app.comp.call-tree` 中添加本地 `comp-spin-slider` |

### 3. 已生成的 phlox JS（js-out/ — 29 个文件）

```
phlox.$meta.mjs
phlox.app.comp.drafts.mjs
phlox.app.comp.keyboard.mjs
phlox.app.comp.slider-demo.mjs
phlox.app.container.mjs
phlox.app.main.mjs
phlox.app.schema.mjs
phlox.app.updater.mjs
phlox.check.mjs
phlox.comp.arrow.mjs
phlox.comp.button.mjs
phlox.comp.drag-point.mjs
phlox.comp.messages.mjs
phlox.comp.slider.mjs
phlox.comp.switch.mjs
phlox.comp.tabs.mjs
phlox.complex.mjs
phlox.config.mjs
phlox.core.mjs
phlox.cursor.mjs
phlox.input.mjs
phlox.keyboard.mjs
phlox.math.mjs
phlox.render.draw.mjs
phlox.render.mjs
phlox.schema.mjs
phlox.util.lcs.mjs
phlox.util.mjs
phlox.util.styles.mjs
```

### 4. Phlox API 按使用频率

| API | 出现次数 | 来源模块 | 用途 |
|-----|----------|----------|------|
| `measure-text-width!` | 5 | `phlox.util` | 文本宽度测量 |
| `comp-button` | 5 | `phlox.comp.button` | 按钮组件 |
| `complex` (as) | 5 | `phlox.complex` | 向量/坐标运算 |
| `defcomp` | 5 | `phlox.core` | 组件定义宏 |
| `>>` | 5 | `phlox.core` | 状态/cursor 创建 |
| `hslx` | 5 | `phlox.core` | HSL 颜色函数 |
| `rect`, `circle`, `text`, `container`, `graphics`, `create-list`, `g`, `polyline` | 5 | `phlox.core` | 渲染原语 |
| `comp-slider` | 3 | `phlox.comp.slider` | 滑块组件 |
| `comp-drag-point` | 3 | `phlox.comp.drag-point` | 拖拽点组件 |
| `hclx` | 3 | `phlox.core` | 另一种颜色函数 |
| `line-segments` | 1 | `phlox.core` | 线片段原语 |
| `hsluvx` | 1 | `phlox.core` | HSLuv 颜色函数 |
| `comp-spin-slider` | 1 | `phlox.comp.slider` | 旋转滑块 |
| `render!`, `clear-phlox-caches!`, `on-control-event` | 1 | `phlox.core` | 渲染生命周期 |
| `dev?`, `mobile?` | 1 | `phlox.config` | 环境检测 |
| `update-states` | 1 | `phlox.cursor` | 状态更新 |

## 当前架构现状

```
calcit.cirru ──cr js──▶ js-out/app.*.mjs ──import──▶ phlox.*.mjs ──import──▶ pixi.js
                                                                       ↕ (aliased)
                                                              lib/pixi-shim.ts (Canvas 2D)
```

phlox 作为 Calcit 编译链的一部分生成 JS 代码，这些代码最终调用 pixi.js API。但 pixi.js 已被 `vite.config.js` 中 `resolve.alias` 替换为 `lib/pixi-shim.ts`（Canvas 2D 实现）。

## 删除路线图（建议）

### Phase 1: 内联 phlox.complex（最低风险）
- `phlox.complex` 是纯数学库（向量加减、缩放等），无渲染依赖
- 可以在 `app.math` 或新文件 `lib/phlox-complex-inline.ts` 中重新实现
- 移除此依赖后，5 个 ns 中 `phlox.complex :as complex` 可替换为 `app.math :as complex` 或类似

### Phase 2: 替换 phlox.util（中等风险）
- `measure-text-width!` 在 5 个 ns 中使用
- 可以用 Canvas `measureText()` 直接实现内联版本
- 或用 `lib/pixi-shim.ts` 已有的 `measureText` 方法

### Phase 3: 替换 phlox.config（低风险）
- `dev?` 和 `mobile?` 可简单内联（检查 `process.env.NODE_ENV` 和 `mobile-detect`）
- 仅 `app.main` 使用

### Phase 4: 替换 phlox.cursor（低风险）
- `update-states` 是简单的状态更新函数
- 可在 `app.updater` 或 `app.schema` 中内联实现

### Phase 5: 替换 phlox.comp.*（高复杂度）
- `comp-button`（5 个 ns）—— 按钮组件，可替换为简单矩形+文本
- `comp-drag-point`（3 个 ns）—— 拖拽点，需要重写
- `comp-slider`（3 个 ns）—— 滑块，需要重写
- `comp-spin-slider`（1 个 ns）—— 旋转滑块，需要重写
- 这些组件 phlox 源码在 `js-out/phlox.comp.*.mjs` 中可查阅

### Phase 6: 替换 phlox.core 渲染原语（最高复杂度）
- `defcomp`, `>>`, `hslx/hclx/hsluvx`, `rect`, `circle`, `text`, `container`, `graphics`, `create-list`, `g`, `polyline`, `line-segments`
- 这些会被编译为 JS 调用，最终调用 pixi-shim.ts
- 替换方案：创建内联渲染函数直接调用 pixi-shim.ts 的 API
- `render!`, `clear-phlox-caches!`, `on-control-event` — 需要重写渲染循环

### Phase 7: 移除 phlox 模块依赖
- 从 `deps.cirru` 移除 `|Phlox-GL/phlox`
- 从 `package.json` 移除 `@quamolit/phlox-utils`
- 从 `calcit.cirru` 的 `:modules` 中移除 `|phlox/`
- 删除 `js-out/phlox.*.mjs` 生成文件
- `vite.config.js` 中 pixi.js alias 可能仍需要（取决于剩余代码是否生成 pixi.js 调用）

## 优先级建议

1. **先做 Phase 1+2+3+4**（纯数学/工具/配置，无渲染逻辑）— 可并行
2. 然后 **Phase 5**（重写 phlox 组件）
3. 最后 **Phase 6**（替换 core 渲染原语 + render 循环）
4. **Phase 7** 收尾清理

## 已完成

### ✅ Phase 1: phlox.complex → app.math（2025-06-20）
- 5 个 ns 移除 `phlox.complex :as complex` 引用
- 将 `complex/add` → `add-path`，`complex/minus` → `subtract-path`
- 修复 `add-path`/`subtract-path` 使用 `nth` 而非模式匹配以支持跨 ns 调用
- 涉及的 ns: call-tree, deps-of, deps-tree, editor, container

### ✅ Phase 3: phlox.config → app.config（2025-06-20）
- 在 `app.config` 中添加 `dev?` 和 `mobile?` 定义
- 将 `app.main` 的 phlox.config 引用改为 app.config
- `dev?` = `(= |dev (get-env |mode |release))`
- `mobile?` = `(.!mobile (new mobile-detect (.-userAgent js/window.navigator)))`

### ✅ Phase 4: phlox.cursor → app.updater（2025-06-20）
- 在 `app.updater` 中添加 `update-states` 本地实现
- 移除 `phlox.cursor` import
- `update-states` = `(assoc-in store (concat ([] :states) cursor ([] :data)) data)`
