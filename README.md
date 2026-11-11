## (Experimental) Hovenia Editor

> Canvas-based tree layout for Calcit `calcit.cirru`.

- Explainations for demo https://www.bilibili.com/video/BV1z3411J76p
- Demos https://www.bilibili.com/video/BV1tq4y1a7bB https://www.bilibili.com/video/BV16a411i7aq

Mocked example(with fake API) http://repo.cirru.org/hovenia-editor/?mocked=true .

![demo of hovenia-editor](./assets/demo.png)

### 迁移状态

候选版配对 Calcit / `@calcit/procs` 0.41.0、Respo 0.19.5、Phlox 0.9.3 和 Cirru Editor 0.7.2。编辑、导航与命令框的内部回调使用具名 `Op`，Cirru 编辑命令使用具名 `EditOp`。原匿名操作仍可从框架边界进入。原生服务器使用 Calcit HTTP 0.4.0，并用 `Option` 包装原监听配置。

```sh
yarn build
node --test tests/editor-layout.test.mjs
calcit calcit.cirru test --require-match
```

载入时同时接受当前 Snapshot 的 symbol 键和旧格式的 string 键，编辑器内部统一按 string 寻址。把修改写回 symbol 键 Snapshot 的流程尚未验证。

### Usage

Install the published dependencies with Calcit and `@calcit/procs` 0.41.0,
Node 24 and Yarn 4.18.0:

```bash
caps --strict --ci
yarn install --immutable
```

Then launch the HTTP server from the directory containing the project you want
to edit. Use the absolute path to Hovenia's canonical snapshot:

```bash
calcit /absolute/path/to/hovenia-editor/calcit.cirru --entry server
```

The existing server reads/writes the edited project's `calcit.cirru` and writes
its old incremental `.calcit-inc.cirru`. HTTP paths and port remain unchanged;
the migration was tested through native type checks and synthetic patch/layout
regressions. Actual file writes and compiler watch integration remain to be verified.
Maintain only canonical `calcit.cirru` / `deps.cirru` in Hovenia itself.

Use Web UI from http://repo.cirru.org/hovenia-editor/ .

### Commands

In the command box:

- `add-ns a.b`
- `rm-ns a.b`
- `add-def a.b c`
- `rm-def a.b c`
- `load`
- `save`
- `mv-ns from to`
- `mv-def from/a to/b`
- `pick` or `pick off` for turning on/off picker mode
- `deps-tree` for loading dependency graph
- `deps-of` for deps of a single definition
- `call-tree` for a sunburst graph for deps

### Workflow

`yarn dev` compiles initially and starts Vite. For live Calcit edits, run
`calcit calcit.cirru js -w` in another terminal. Build/release compile once;
no extra process manager or npm dependency is needed.

CI keeps strict frontend entry/all-public checks, the existing server public
contract check and actual frontend build. Repeated diagnostic reports are removed
without a new verifier or test suite. Vite and COS action v1.2.0 share the
frontend base: production `Cirru/hovenia-editor/`, preview
`pr/<number>/<run-id>/<attempt>/`. Per-PR and separate production concurrency
does not cancel active uploads; `queue: max` retains pending runs as well. The
action is pinned to the reviewed release commit and handles upload/public
verification through the existing `public-base-url`, without another script.
The original upload policy and server `dist/*` source/destination remain; COS
only handles frontend resources, not the native editor server. Snapshot, editor
and server code were unchanged by the previous workflow-only update. PR success is not production/editor acceptance.
That previous workflow update retained Calcit/procs 0.27.0 and the existing non-strict
Caps resolution policy; it does not certify a completed 0.28 source migration
or a conflict-free strict dependency graph.

Workflow https://github.com/Phlox-GL/phlox-workflow

### License

MIT
