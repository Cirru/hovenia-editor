
export default {
  build: {
    minify: false,
  },
  resolve: {
    alias: {
      // Redirect Calcit's .mjs imports to .ts source
      "/lib/canvas-renderer.mjs": "/lib/canvas-renderer.ts",
    },
  },
}
