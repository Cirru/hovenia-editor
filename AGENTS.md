## hovenia-editor 开发说明

### Chrome 无头模式 WebGPU 验证

使用 Chrome DevTools Protocol (CDP) 在**可见的 Chrome 窗口**（非 headless）中验证 WebGPU 渲染，避免干扰系统正常浏览器使用。

#### 正确用法

```bash
# 1. 启动 Vite dev server（用于托管测试文件）
npx vite --port 8910 --host 127.0.0.1 &
sleep 1

# 2. 启动独立的 Chrome 实例（使用临时用户目录，不影响日常浏览）
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --enable-webgpu \
  --no-sandbox \
  --remote-debugging-port=9229 \
  --user-data-dir=/tmp/chrome-wgpu-test \
  about:blank &
sleep 3

# 3. 通过 CDP 创建新标签页、导航、截图
node --input-type=module -e '
import { WebSocket } from "ws";
import fs from "fs";

const resp = await fetch("http://127.0.0.1:9229/json/new", {method:"PUT"});
const page = await resp.json();
const ws = new WebSocket(page.webSocketDebuggerUrl);
let id = 0;
const send = (m, p) => ws.send(JSON.stringify({id:++id,method:m,params:p||{}}));

ws.on("open", () => {
  send("Page.enable");
  send("Runtime.enable");
  send("Page.navigate", {url:"http://127.0.0.1:8910/sandbox/webgpu-test.html"});
});

ws.on("message", data => {
  const m = JSON.parse(data.toString());
  if (m.method === "Runtime.consoleAPICalled") {
    console.log(">", m.params.args.map(a=>a.value||"").join(" "));
  }
  if (m.method === "Runtime.exceptionThrown") {
    console.log("EXC:", m.params.exceptionDetails.text);
  }
  if (m.id && m.result?.data) {
    fs.writeFileSync("/tmp/screenshot.png", Buffer.from(m.result.data, "base64"));
    console.log("SCREENSHOT:", fs.statSync("/tmp/screenshot.png").size, "bytes");
    ws.close();
    process.exit(0);
  }
});
setTimeout(() => process.exit(1), 15000);
'

# 4. 清理
pkill -f "Google Chrome.*remote-debugging.*9229" 2>/dev/null
pkill -f "vite.*8910" 2>/dev/null
```

#### 关键注意事项

| 要点 | 说明 |
|------|------|
| `--user-data-dir` | **必须使用临时目录**（如 `/tmp/chrome-*`），避免污染系统 Chrome 用户数据 |
| `--remote-debugging-port` | 每次使用**不同端口**（如 9229, 9230...），避免与已有实例冲突 |
| `about:blank` | 初始打开空白页，**不要直接打开目标 URL**，通过 CDP `Page.navigate` 导航 |
| 清理 | 测试结束后用 `pkill -f` 精确杀掉相关进程，避免误杀其他 Chrome |
| ws 模块 | CDP 需要 `ws`（WebSocket）库，项目中已安装为 devDependency |

#### 错误用法

```bash
# ❌ 没有 --user-data-dir — 会使用系统默认用户目录，干扰登录态和扩展
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222

# ❌ 没有 about:blank — 直接打开 URL 可能被已有窗口劫持
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome "http://..."

# ❌ pkill 范围过大 — 会杀掉所有 Chrome 进程，包括正常使用的浏览器
pkill -f "Google Chrome"
```

### WebGPU 渲染器开发

- TypeScript 源码: `lib/webgpu-renderer.ts`
- 类型检查: `npx tsc --noEmit`
- 测试页: `sandbox/webgpu-test.html`（通过 Vite dev server 访问 `http://localhost:8910/sandbox/webgpu-test.html`）
- Calcit FFI 入口: `calcit/webgpu-test.cirru`
