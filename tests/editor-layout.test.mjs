import assert from "node:assert/strict";
import { test } from "node:test";

// Layout construction needs text metrics, not a Pixi renderer or a real DOM.
globalThis.window = {
  innerWidth: 1200, innerHeight: 800,
  navigator: { userAgent: "hovenia-layout-test" },
  location: { hostname: "localhost", search: "" },
};
globalThis.document = {
  body: {},
  createElement: () => ({ getContext: () => ({ font: "", measureText: (s) => ({ width: s.length * 8 }) }) }),
};
const editor = await import("../js-out/app.comp.editor.mjs");
const { _$L_: list, to_js_data: toJS } = await import("@calcit/procs");
const fromArray = (xs) => list(...xs.map((x) => Array.isArray(x) ? fromArray(x) : x));
const leaves = (xs) => xs.flatMap((x) => Array.isArray(x) ? leaves(x) : [x]);
function texts(node) {
  const result = node.name === "text" ? [node.props.text] : [];
  for (const pair of node.children) {
    assert.equal(pair.length, 2, "Phlox children remain keyed pairs");
    result.push(...texts(pair[1]));
  }
  return result;
}

test("block, linear and winding layouts retain every token", () => {
  assert.equal(editor.pick_leaf_color("2", false), editor.pick_leaf_color("-2.5", false));
  assert.notEqual(editor.pick_leaf_color("2", false), editor.pick_leaf_color("word", false));
  const cases = [[], ["a", "b", "c"], [["a", "b"]], [["a"], "b", "c"],
    ["a", ["b", "c"], "d"], [["a"], ["b"], ["c"]],
    ["a", [["b"], ["c"]], [["d"], "e"]],
    [["a"], "b", [["c"], ["d"]]]];
  for (const xs of cases) {
    for (const layout of [
      () => editor.wrap_block_expr(fromArray(xs), list(), list()),
      ...(editor.with_linear_$q_(fromArray(xs)) ? [() => editor.wrap_expr_with_linear(fromArray(xs), list(), list(), true, false, 300)] : []),
      ...(editor.is_linear_$q_(fromArray(xs)) ? [() => editor.wrap_linear_expr(fromArray(xs), list(), list(), false)] : []),
    ]) {
      const info = toJS(layout());
      assert.deepEqual(texts(info.tree).sort(), leaves(xs).sort());
      assert.ok(Number.isFinite(info.width));
      assert.ok(Number.isFinite(info["y-stack"]));
      assert.ok(["none", "some"].includes(info["winding-x"][0]));
    }
  }
  const block = toJS(editor.wrap_block_expr(list("a", "b", "c"), list(), list()));
  const tokens = block.tree.children.at(-1)[1].children.map(([, node]) => node.props.position);
  assert.deepEqual(tokens, [[16, 0], [40, 0], [64, 0]]);
});

test("Pixi global coordinates and expression clicks use the current event contract", () => {
  assert.deepEqual(toJS(editor.event_position({ global: { x: 23, y: 42 } })), [23, 42]);
  const operations = [];
  editor.on_expr_click({ metaKey: false, ctrlKey: false }, list("a"), list(1), (op) => operations.push(toJS(op)));
  assert.deepEqual(operations, [["focus-or-pick", [1]]]);
});

test("search clicks preserve mixed paths and query input resets selection", async () => {
  const nav = await import("../js-out/app.comp.nav.mjs");
  const { parse_cirru_edn: parse, init_tags: tags } = await import("@calcit/procs");
  const { defs, menu } = tags(["defs", "menu"]);
  const ops = [];
  let closed = 0;
  const component = toJS(nav.comp_search_entry(list(menu), parse("{} (:query |a)"),
    list(list("app.demo", defs, "alpha")), 0, () => { closed++; }));
  const row = component.tree[1][1].children[0].node[1][1];
  row.event.click({}, (op) => ops.push(toJS(op)));
  assert.equal(closed, 1);
  assert.deepEqual(ops, [["def-path", ["app.demo", "defs", "alpha"]],
    ["states", ["menu"], { query: "" }]]);

  const states = parse("{} (:cursor ([] :menu)) (:data ({} (:query |a) (:select-idx 2) (:ns nil)))");
  const tree = toJS(nav.comp_menu(states, parse("{}"), () => {}));
  function findInput(value) {
    if (value?.name === "input") return value;
    if (value && typeof value === "object") {
      for (const child of Object.values(value)) {
        const input = findInput(child);
        if (input) return input;
      }
    }
  }
  findInput(tree).event.input(parse("{} (:value |alpha)"), (op) => ops.push(toJS(op)));
  assert.deepEqual(ops.at(-1), ["states", ["menu"], { ns: null, query: "alpha", "select-idx": 0 }]);
});

test("cyclic dependency graph draws numeric curves and navigates with an unwrapped path", async () => {
  const graph = await import("../js-out/app.comp.deps-tree.mjs");
  const { _$n__$M_: map, init_tags: tags } = await import("@calcit/procs");
  const t = tags(["file", "def"]);
  const data = map(
    list("app.main", "a"), list(list("app.main", "b", t.file), list("external.lib", "x", t.def)),
    list("app.main", "b"), list(list("app.main", "a", t.file)));
  const tree = toJS(graph.comp_deps_tree(data, "app.main/a", "app"));
  assert.deepEqual(texts(tree).sort(), [".main/a", ".main/a", ".main/b", ".main/b"]);
  const curves = tree.children[0][1].props.ops.filter(([op]) => op === "bezier-to");
  assert.equal(curves.length, 2);
  for (const [, curve] of curves) {
    for (const point of [curve.p1, curve.p2, curve["to-p"]]) {
      assert.equal(point.length, 2);
      assert.ok(point.every(Number.isFinite));
    }
  }
  const clicks = [];
  function collect(node) {
    // Phlox buttons store :on as an Option, which to_js_data renders as ["some", handlers].
    const on = Array.isArray(node.props.on) ? node.props.on[1] : node.props.on;
    if (on?.pointertap) clicks.push(on.pointertap);
    for (const [, child] of node.children) collect(child);
  }
  collect(tree);
  assert.equal(clicks.length, 2);
  const operations = [];
  clicks[0]({ metaKey: true }, (op) => operations.push(toJS(op)));
  assert.deepEqual(operations, [["router", { name: "editor" }],
    ["def-path", ["app.main", "defs", "b"]]]);
  const detail = await import("../js-out/app.comp.deps-of.mjs");
  clicks.length = 0;
  collect(toJS(detail.comp_deps_of(data, list("app.main", "a"), "app")));
  assert.equal(clicks.length, 2);
  operations.length = 0;
  clicks[0]({ metaKey: false, ctrlKey: true }, (op) => operations.push(toJS(op)));
  assert.deepEqual(operations, [["def-path", ["app.main", "defs", "b"]],
    ["router", { name: "editor" }]]);
});

test("default container selects an actual Snapshot Struct without crossing it as a Map", async () => {
  const { comp_container } = await import("../js-out/app.container.mjs");
  const { updater } = await import("../js-out/app.updater.mjs");
  const schema = await import("../js-out/app.schema.mjs");
  const p = await import("@calcit/procs");
  const map = p._$n__$M_, fromMap = p._$n_struct_$o_from_map;
  const t = p.init_tags(["doc", "code", "ns", "defs", "files", "editor", "stack", "pointer", "focus"]);
  const entry = fromMap(schema.CodeEntry, map(t.doc, "",
    t.code, p._$o__$o_(new p.CalcitSymbol("quote"), list("def", "demo", "1"))));
  const file = fromMap(schema.FileEntry, map(t.ns, entry, t.defs, map("demo", entry)));
  const store = map(t.files, map("app.demo", file), t.editor,
    map(t.stack, list(list("app.demo", t.defs, "demo")), t.pointer, 0, t.focus, list()));
  assert.deepEqual(texts(toJS(comp_container(store))), ["def", "demo", "1"]);
  const changed = updater(store, schema.replace_node_op(list(2), "2"));
  assert.deepEqual(texts(toJS(comp_container(changed))), ["def", "demo", "2"]);
  assert.deepEqual(texts(toJS(comp_container(schema.store))), ["No code selected"]);
});

test("save acknowledges only submitted files and HTTP failure leaves newer edits dirty", async () => {
  const { on_save } = await import("../js-out/app.comp.command.mjs");
  const { updater } = await import("../js-out/app.updater.mjs");
  const schema = await import("../js-out/app.schema.mjs");
  const p = await import("@calcit/procs");
  const core = await import("../js-out/calcit.core.mjs");
  const map = p._$n__$M_, fromMap = p._$n_struct_$o_from_map;
  const t = p.init_tags(["doc", "code", "ns", "defs", "files", "saved-files"]);
  const files = (label) => {
    const entry = fromMap(schema.CodeEntry, map(t.doc, "kept",
      t.code, p._$o__$o_(new p.CalcitSymbol("quote"), list("def", "demo", `|${label}`))));
    const ns = fromMap(schema.CodeEntry, map(t.doc, "namespace",
      t.code, p._$o__$o_(new p.CalcitSymbol("quote"), list("ns", "app.demo"))));
    return map("app.demo", fromMap(schema.FileEntry, map(t.ns, ns, t.defs, map("demo", entry))));
  };
  const baseline = files("old"), submitted = files("submitted"), newer = files("newer");
  let current = map(t.files, newer, t["saved-files"], baseline);
  const field = (key) => core.option_$o_unwrap(p._$n_map_$o_get(current, key));
  const operations = [];
  const dispatch = (op) => { operations.push(toJS(op)); current = updater(current, op); };
  let finish;
  const requests = [];
  const previousFetch = globalThis.fetch;
  globalThis.fetch = (url, options) => {
    requests.push({ url, options });
    return new Promise((resolve) => { finish = resolve; });
  };
  try {
    on_save(submitted, baseline, dispatch);
    assert.ok(requests[0].url.endsWith("/compact-inc"));
    assert.equal(requests[0].options.method, "PUT");
    assert.equal(typeof requests[0].options.body, "string");
    const get = (value, key) => core.option_$o_unwrap(p._$n_map_$o_get(value, key));
    const names = p.init_tags(["changed", "changed-defs"]);
    const patch = p.parse_cirru_edn(requests[0].options.body);
    const changed = get(get(get(patch, names.changed), "app.demo"), names["changed-defs"]);
    assert.equal(core.cirru_quote_$q_(get(p._$n_struct_$o_to_map(get(changed, "demo")), t.code)), true);
    finish({ ok: true, status: 200 });
    await new Promise(setImmediate);
    assert.strictEqual(field(t.files), newer);
    assert.equal(p._$n__$e_(field(t["saved-files"]), submitted), true);
    assert.deepEqual(operations.map(([tag]) => tag), ["files-synced", "ok"]);

    on_save(newer, submitted, dispatch);
    finish({ ok: false, status: 503 });
    await new Promise(setImmediate);
    assert.equal(p._$n__$e_(field(t["saved-files"]), submitted), true);
    assert.equal(operations.at(-1)[0], "warn");
    assert.match(operations.at(-1)[1], /503/);
  } finally {
    globalThis.fetch = previousFetch;
  }
});
