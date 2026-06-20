{} (:package |app)
  :configs $ {} (:init-fn |app.webgpu-test/main!) (:reload-fn |app.webgpu-test/reload!) (:version |0.0.1)
    :modules $ []
  :entries $ {}
  :files $ {}
    |app.webgpu-test $ %{} :FileEntry
      :defs $ {}
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! ()
              println "|WebGPU renderer loaded"
              test-initialize
              test-draw-rect
              println "|All tests passed"
          :schema $ :: :fn
            {} (:return :unit)
              :args $ []
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () (main!)
          :schema $ :: :fn
            {} (:return :unit)
              :args $ []
        |test-initialize $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn test-initialize ()
              if init-renderer!
                println "|Renderer initialized"
                raise "|Failed to initialize renderer"
              nil
          :schema $ :: :fn
            {} (:return :unit)
              :args $ []
        |test-draw-rect $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn test-draw-rect ()
              draw-rect 100 100 200 150 0.2 0.4 0.8 1.0
              flush-renderer
              nil
          :schema $ :: :fn
            {} (:return :unit)
              :args $ []
      :ns $ %{} :NsEntry (:doc |)
        :code $ quote
          ns app.webgpu-test $ :require
            [] app.webgpu-ffi :refer $ [] init-renderer! draw-rect flush-renderer
    |app.webgpu-ffi $ %{} :FileEntry
      :defs $ {}
        |canvas-element $ %{} :CodeEntry (:doc |)
          :code $ quote
            def canvas-element $ js/document.querySelector |.app
          :examples $ []
        |init-renderer! $ %{} :CodeEntry (:doc | |Initialize WebGPU renderer)
          :code $ quote
            defn init-renderer! () $ as->
              %{} (:canvas canvas-element)
                :width js/window.innerWidth
                :height js/window.innerHeight
              $ js/WebGPURenderer.new! ~
          :schema $ :: :fn
            {} (:return :bool)
              :args $ []
        |draw-rect $ %{} :CodeEntry (:doc | |Draw a rectangle)
          :code $ quote
            defn draw-rect (x y w h r g b a)
              &js:renderer-call :drawRect $ %{} (:x x) (:y y) (:width w) (:height h)
                :fillColor $ [] r g b a
          :schema $ :: :fn
            {} (:return :nil)
              :args $ [] :number :number :number :number :number :number :number :number
        |flush-renderer $ %{} :CodeEntry (:doc | |Flush render commands)
          :code $ quote
            defn flush-renderer () $ &js:renderer-call :render
          :schema $ :: :fn
            {} (:return :nil)
              :args $ []
      :ns $ %{} :NsEntry (:doc |)
        :code $ quote
          ns app.webgpu-ffi $ :require
