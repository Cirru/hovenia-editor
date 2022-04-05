
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
          phlox.core :refer $ defcomp >> hslx rect circle text container graphics create-list g polyline
          phlox.comp.drag-point :refer $ comp-drag-point
          phlox.comp.slider :refer $ comp-slider
          app.math :refer $ divide-path multiply-path
      :defs $ {}
        |comp-container $ quote
          defcomp comp-container (store)
            let
                states $ :states store
                cursor $ []
                state $ or (:data states) ({})
              circle
                {}
                  :position $ [] 1 1
                  :radius 4
                  :line-style $ {} (:width 2) (:color 0xffffff) (:alpha 1)
                  :fill 0x000001
                :tree $ wrap-expr code-data
        |inline $ quote
          defmacro inline (path)
            read-file $ str "\"data/" path
        |wrap-expr $ quote
          defn wrap-expr (xs)
            apply-args
                []
                , xs 0 0
              fn (acc ys x-position idx)
                if (empty? ys)
                  {}
                    :tree $ container ({})
                      circle $ {}
                        :position $ [] 0 20
                        :radius 5
                        :fill $ hslx 0 0 90
                      polyline $ {}
                        :style $ {} (:width 1)
                          :color $ hslx 200 100 30
                          :alpha 1
                        :position $ [] 0 0
                        :points $ [] ([] 0 0) ([] x-position 0)
                      create-list :container ({}) acc
                    :width x-position
                  let
                      item $ first ys
                      info $ if (string? item) (wrap-leaf item) (wrap-expr item)
                      width $ :width info
                      tree $ :tree info
                    recur
                      conj acc $ [] idx
                        container
                          {} $ :position
                            [] (* 1 x-position) 40
                          , tree
                      rest ys
                      + x-position width 0
                      inc idx
        |wrap-leaf $ quote
          defn wrap-leaf (s)
            let
                width $ + 0
                  * 8.8 $ count s
              {}
                :tree $ rect
                  {}
                    :position $ [] 0 0
                    :size $ [] width 24
                    :line-style $ {} (:width 2) (:color 0x000001) (:alpha 1)
                    :fill $ hslx 190 50 30
                    ; :radius 8
                  text $ {} (:text s)
                    :position $ [] 0 4
                    :style $ {} (:fill |red) (:font-size 14) (:font-family "|Roboto Mono")
                :width width
        |code-data $ quote
          def code-data $ parse-cirru (inline "\"expr-demo.cirru")
    |app.main $ {}
      :ns $ quote
        ns app.main $ :require ("\"pixi.js" :as PIXI) ("\"shortid" :as shortid)
          phlox.core :refer $ render! clear-phlox-caches! on-control-event
          app.container :refer $ comp-container
          app.schema :as schema
          phlox.config :refer $ dev? mobile?
          app.updater :refer $ updater
          "\"fontfaceobserver-es" :default FontFaceObserver
          "\"./calcit.build-errors" :default build-errors
          "\"bottom-tip" :default hud!
          touch-control.core :refer $ render-control! start-control-loop! replace-control-loop!
      :defs $ {}
        |main! $ quote
          defn main! () (; js/console.log PIXI)
            if dev? $ load-console-formatter!
            -> (new FontFaceObserver "\"Roboto Mono") (.!load)
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
        |site $ quote
          def site $ {} (:title "\"Phlox") (:icon "\"http://cdn.tiye.me/logo/quamolit.png") (:storage-key "\"phlox-workflow")
