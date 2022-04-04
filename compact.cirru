
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/
    :version nil
  :entries $ {}
  :files $ {}
    |app.comp.expr $ {}
      :ns $ quote
        ns app.comp.expr $ :require
          [] phlox.core :refer $ [] defcomp hslx rect circle text container graphics create-list g
          [] app.math :refer $ [] add-path subtract-path multiply-path divide-path
      :defs $ {}
        |comp-skip-node $ quote
          defcomp comp-skip-node () $ rect
            {}
              :line-style $ {}
                :color $ hslx 0 0 100
                :alpha 1
                :width 2
              :size $ [] 20 20
    |app.schema $ {}
      :ns $ quote (ns app.schema)
      :defs $ {}
        |store $ quote
          def store $ {} (:tab :drafts) (:x 0)
            :states $ {}
    |app.updater $ {}
      :ns $ quote
        ns app.updater $ :require
          phlox.cursor :refer $ update-states
      :defs $ {}
        |updater $ quote
          defn updater (store op op-data op-id op-time)
            case-default op
              do (println "\"unknown op" op op-data) store
              :add-x $ update store :x
                fn (x)
                  if (> x 10) 0 $ + x 1
              :tab $ assoc store :tab op-data
              :states $ update-states store op-data
              :hydrate-storage op-data
    |app.container $ {}
      :ns $ quote
        ns app.container $ :require
          phlox.core :refer $ defcomp >> hslx rect circle text container graphics create-list g
          phlox.comp.drag-point :refer $ comp-drag-point
          phlox.comp.slider :refer $ comp-slider
          app.math :refer $ divide-path multiply-path
      :defs $ {}
        |collect-nodes $ quote
          defn collect-nodes (expanded-code)
            let
                *nodes $ js-array ([])
                *counter $ js-array 0
                collect! $ fn (x)
                  aset *nodes "\"0" $ conj (.-0 *nodes) x
                get-idx! $ fn (inc?)
                  let
                      x $ .-0 *counter
                    if inc? $ aset *counter "\"0" (inc x)
                    , x
              collect-nodes-iter! expanded-code collect! get-idx!
              .-0 *nodes
        |comp-container $ quote
          defcomp comp-container (store)
            let
                states $ :states store
                cursor $ []
                state $ or (:data states) ({})
                code-data $ parse-cirru (inline "\"expr-demo.cirru")
                expanded-code $ expand-tree 0 code-data
                nodes $ collect-nodes expanded-code
              container ({}) (; comp-pivot)
                container
                  {} $ :position ([] 0 0)
                  comp-base
                  create-list :container ({})
                    -> nodes $ map-indexed
                      fn (idx node)
                        [] idx $ container
                          {}
                            :position $ [] 0 0
                            :angle $ -
                              * 2.6 $ :index node
                              , 90
                            :pivot $ [] 0 0
                          if
                            = :token $ :kind node
                            text $ {}
                              :text $ :item node
                              :position $ []
                                * 40 $ :level node
                                , 0
                              :style $ {}
                                :fill $ hslx 0 0 100
                                :font-size 14
                            rect $ {}
                              :position $ []
                                * 40 $ :level node
                                , 0
                              :size $ [] 40 1
                              :fill $ hslx 0 0 90
        |comp-base $ quote
          defcomp comp-base () $ rect
            {}
              :position $ [] 0 0
              :size $ [] 400 400
              :fill $ hslx 0 0 10
        |collect-nodes-iter! $ quote
          defn collect-nodes-iter! (item collect! get-idx!)
            if
              = :token $ :kind item
              collect! $ assoc item :index (get-idx! true)
              do
                collect! $ -> (dissoc item :items)
                  assoc :index $ get-idx! false
                &doseq
                  x $ :items item
                  collect-nodes-iter! x collect! get-idx!
        |expand-tree $ quote
          defn expand-tree (level x)
            if (string? x)
              {} (:kind :token) (:level level) (:item x) (:size 1)
              let
                  children $ -> x
                    map $ fn (y)
                      expand-tree (inc level) y
                {} (:kind :expr) (:level level) (:items children)
                  :size $ -> children
                    map $ fn (x) (:size x)
                    reduce 0 +
        |comp-pivot $ quote
          defcomp comp-pivot () $ container
            {} $ :position ([] 0 0)
            comp-base
            container
              {} $ :angle 24
              graphics $ {}
                :ops $ []
                  g :line-style $ {}
                    :color $ hslx 0 0 40
                    :width 1
                    :alpha 1
                  g :line-to $ [] 200 0
              text $ {} (:text "\"DEMO")
                :style $ {}
                  :fill $ hslx 0 0 100
                :position $ [] 200 0
                :angle 0
        |inline $ quote
          defmacro inline (path)
            read-file $ str "\"data/" path
    |app.main $ {}
      :ns $ quote
        ns app.main $ :require ("\"pixi.js" :as PIXI) ("\"shortid" :as shortid)
          phlox.core :refer $ render! update-viewer! clear-phlox-caches!
          app.container :refer $ comp-container
          app.schema :as schema
          app.config :refer $ dev? mobile?
          app.updater :refer $ updater
          "\"fontfaceobserver-es" :default FontFaceObserver
          "\"./calcit.build-errors" :default build-errors
          "\"bottom-tip" :default hud!
          touch-control.core :refer $ render-control! start-control-loop! replace-control-loop!
      :defs $ {}
        |main! $ quote
          defn main! () (; js/console.log PIXI)
            if dev? $ load-console-formatter!
            -> (new FontFaceObserver "\"Josefin Sans") (.!load)
              .!then $ fn (event) (render-app!)
            add-watch *store :change $ fn (store prev) (render-app!)
            when mobile? (render-control!) (start-control-loop! 8 on-control-event)
            println "\"App Started"
        |*store $ quote (defatom *store schema/store)
        |dispatch! $ quote
          defn dispatch! (op op-data)
            if (list? op)
              recur :states $ [] op op-data
              do
                when
                  and dev? $ not= op :states
                  println "\"dispatch!" op op-data
                let
                    op-id $ shortid/generate
                    op-time $ .now js/Date
                  reset! *store $ updater @*store op op-data op-id op-time
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (clear-phlox-caches!) (remove-watch *store :change)
              add-watch *store :change $ fn (store prev) (render-app!)
              render-app!
              when mobile? (replace-control-loop! 8 on-control-event) (render-control!)
              hud! "\"ok~" "\"Ok"
            hud! "\"error" build-errors
        |render-app! $ quote
          defn render-app! () $ render! (comp-container @*store) dispatch! ({})
        |on-control-event $ quote
          defn on-control-event (elapsed states delta)
            let
                move $ :left-move states
                scales $ :right-move delta
              update-viewer! move $ nth scales 1
    |app.math $ {}
      :ns $ quote (ns app.math)
      :defs $ {}
        |divide-path $ quote
          defn divide-path
              [] x y
              [] a b
            let
                inverted $ / 1
                  + (* a a) (* b b)
              []
                * inverted $ + (* x a) (* y b)
                * inverted $ - (* y a) (* x b)
        |add-path $ quote
          defn add-path
              [] a b
              [] x y
            [] (+ a x) (+ b y)
        |rough-size $ quote
          defn rough-size
              [] x y
            + (js/Math.abs x) (js/Math.abs y)
        |rand-color $ quote
          defn rand-color () $ rand-int 0xffffff
        |rand-point $ quote
          defn$ rand-point
              n
              rand-point n n
            (n m)
              []
                -
                  js/Math.round $ * 0.2 n
                  rand-int n
                -
                  js/Math.round $ * 0.2 m
                  rand-int m
        |divide-x $ quote
          defn divide-x (point x)
            []
              / (first point) x
              / (peek point) x
        |invert-y $ quote
          defn invert-y
              [] x y
            [] x $ unchecked-negate y
        |multiply-path $ quote
          defn multiply-path
              [] a b
              [] x y
            []
              - (* a x) (* b y)
              + (* a y) (* b x)
        |subtract-path $ quote
          defn subtract-path
              [] a b
              [] x y
            [] (- a x) (- b y)
    |app.config $ {}
      :ns $ quote
        ns app.config $ :require ("\"mobile-detect" :default mobile-detect)
      :defs $ {}
        |dev? $ quote
          def dev? $ = "\"dev" (get-env "\"mode")
        |site $ quote
          def site $ {} (:title "\"Phlox") (:icon "\"http://cdn.tiye.me/logo/quamolit.png") (:storage-key "\"phlox-workflow")
        |mobile? $ quote
          def mobile? $ .!mobile (new mobile-detect js/window.navigator.userAgent)
