## hovenia-editor 开发说明

### Chrome DevTools MCP 截图验证

使用 `chrome-devtools-mcp`（Chrome DevTools 官方 MCP 服务器）启动受控 Chrome 实例，通过 CLI 命令截图验证 WebGPU 渲染。chrome-devtools-mcp 由 Chrome DevTools 团队维护，自动管理浏览器生命周期，不会影响用户系统 Chrome。

#### 安装

```bash
# 全局安装（推荐）
npm i chrome-devtools-mcp@latest -g

# 验证安装
chrome-devtools status
```

#### CLI 命令参考

| 命令 | 用途 |
|------|------|
| `chrome-devtools start [flags]` | 启动后台 MCP 服务器 + 浏览器 |
| `chrome-devtools stop` | 停止后台进程 |
| `chrome-devtools status` | 检查运行状态 |
| `chrome-devtools navigate_page <url>` | 导航到 URL |
| `chrome-devtools take_screenshot --filePath <path>` | 截图保存到文件 |
| `chrome-devtools click <uid>` | 点击元素（uid 来自 take_snapshot） |
| `chrome-devtools evaluate_script <code>` | 执行 JS 脚本 |
| `chrome-devtools list_pages` | 列出标签页 |
| `chrome-devtools list_console_messages` | 查看控制台日志 |

#### 正确用法

```bash
# 1. 启动 Vite dev server（用于托管测试文件）
npx vite --port 8910 --host 127.0.0.1 &
sleep 1

# 2. 启动 chrome-devtools-mcp 后台服务（自动管理浏览器）
chrome-devtools start \
  --headless=false \
  --viewport=1280x800 \
  --isolated \
  --chrome-arg=--enable-webgpu

# 3. 使用 CLI 命令操作浏览器
chrome-devtools navigate_page "http://127.0.0.1:8910/sandbox/webgpu-test.html"

# 截图并保存
chrome-devtools take_screenshot --filePath /tmp/screenshot.png

# 执行 JS 检查状态
chrome-devtools evaluate_script "document.title"

# 查看控制台日志
chrome-devtools list_console_messages

# 4. 清理
chrome-devtools stop
pkill -f "vite.*8910" 2>/dev/null
```

#### 关键注意事项

| 要点 | 说明 |
|------|------|
| `--headless=false` | 显示浏览器窗口，便于观察调试过程；默认 headless=true |
| `--isolated` | 使用临时用户数据目录，自动清理，不影响系统 Chrome 配置 |
| `--chrome-arg` | 透传额外 Chrome 参数（如 `--enable-webgpu`），可重复使用 |
| `--viewport` | 设置初始视口大小（默认 1280x720） |
| 进程隔离 | chrome-devtools-mcp 管理独立的浏览器进程，**不会影响**用户已打开的 Chrome |
| 清理 | 用 `chrome-devtools stop` 精确停止，**禁止** `pkill -f "Google Chrome"` |

#### 错误用法

```bash
# ❌ 直接用系统 Chrome 二进制启动 — 会使用系统默认配置，干扰日常浏览
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222

# ❌ pkill 范围过大 — 会杀掉用户正常的 Chrome 浏览器
pkill -f "Google Chrome"

# ❌ 手动管理 WebSocket/CDP — chrome-devtools-mcp 已封装这些底层细节
node -e "cdp code..."  # 不需要
```

### WebGPU 渲染器开发

- TypeScript 源码: `lib/webgpu-renderer.ts`
- 类型检查: `npx tsc --noEmit`
- 测试页: `sandbox/webgpu-test.html`（通过 Vite dev server 访问 `http://localhost:8910/sandbox/webgpu-test.html`）
- Calcit FFI 入口: `calcit/webgpu-test.cirru`

### Canvas 2D 渲染器开发

- TypeScript 源码: `lib/canvas-renderer.ts`
- 类型检查: `npx tsc --noEmit`
- Calcit FFI 入口: `calcit.cirru` → `app.core/render!`

### Vite Dev Server 运行约定

**Vite 常驻运行，修改代码后只需刷新浏览器页面，不要反复 kill/restart。**

```bash
# 一次性启动（用 nohup 或 & 后台常驻）
nohup npx vite --port 5173 --host localhost > /tmp/vite-5173.log 2>&1 &
```

不要：
- ❌ `pkill -f "vite"` 后重新启动
- ❌ 每次改代码后重启 vite

正确：
- ✅ 启动一次后常驻
- ✅ 修改 `canvas-renderer.ts` 后 → `npx tsc --noEmit && cr calcit.cirru js` → 浏览器刷新
- ✅ 用 `chrome-devtools navigate_page --type reload` 刷新
