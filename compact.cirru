
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
          app.config :refer $ line-height
      :defs $ {}
        |is-linear? $ quote
          defn is-linear? (xs)
            cond
                empty? xs
                , true
              (= 1 (count xs))
                let
                    x0 $ first xs
                  if (string? x0) true $ recur x0
              true $ let
                  x0 $ first xs
                if (string? x0)
                  recur $ rest xs
                  , false
        |comp-container $ quote
          defcomp comp-container (store)
            let
                states $ :states store
                cursor $ []
                state $ or (:data states) ({})
              :tree $ wrap-block-expr
                w-js-log $ first code-data
        |code-data $ quote
          def code-data $ parse-cirru (inline "\"with-linear.cirru")
        |comp-error $ quote
          defcomp comp-error (ys)
            circle
              {}
                :position $ [] 0 0
                :radius 10
                :fill 0xff0000
              text $ {}
                :text $ format-cirru-edn ys
                :position $ [] 0 0
                :style $ {} (:fill |red) (:font-size 10) (:font-family "|Roboto Mono")
        |wrap-leaf $ quote
          defn wrap-leaf (s)
            let
                width $ + 8
                  * 8.8 $ count s
                height line-height
              {}
                :tree $ container ({})
                  rect $ {}
                    :position $ [] 0 (* -0.5 line-height)
                    :size $ [] width height
                    :alpha 0.9
                    :fill $ hslx 190 40 20
                  text $ {} (:text s)
                    :position $ [] 4 -8
                    :style $ {}
                      :fill $ hslx 200 50 80
                      :font-size 14
                      :font-family "|Roboto Mono"
                :width width
                :height height
        |wrap-block-expr $ quote
          defn wrap-block-expr (xs)
            loop
                acc $ []
                ys xs
                x-position 0
                y-position 0
                idx 0
              if (empty? ys)
                {}
                  :tree $ container ({})
                    polyline $ {}
                      :style $ {} (:width 1) (:alpha 1)
                        :color $ hslx 200 100 30
                      :position $ [] 0 0
                      :points $ [] ([] 0 0) ([] 0 y-position)
                    circle $ {} (:radius 4)
                      :position $ [] 0 0
                      :fill $ hslx 0 0 90
                    create-list :container ({}) acc
                  :width x-position
                  :height y-position
                let
                    item $ first ys
                    info $ cond
                        string? item
                        wrap-leaf item
                      (is-linear? item) (wrap-linear-expr item)
                      (with-linear? item) (wrap-expr-with-linear item)
                      true $ wrap-block-expr item
                    width $ :width info
                    height $ :height info
                    tree $ :tree info
                  recur
                    conj acc $ [] idx
                      container
                        {} $ :position ([] 20 y-position)
                        , tree
                    rest ys
                    , 20 (+ y-position height 4) (inc idx)
        |wrap-expr-with-linear $ quote
          defn wrap-expr-with-linear (xs)
            loop
                acc $ []
                ys xs
                x-position 20
                y-position 0
                stacked 0
                idx 0
              if (empty? ys)
                {}
                  :tree $ container ({})
                    polyline $ {}
                      :style $ {} (:width 1) (:alpha 1)
                        :color $ hslx 200 100 30
                      :position $ [] 0 0
                      :points $ [] ([] 0 0) ([] x-position 0)
                    circle $ {} (:radius 5)
                      :position $ [] 0 0
                      :fill $ hslx 20 90 50
                    create-list :container ({}) acc
                  :width x-position
                  :height $ &max y-position
                    * line-height $ inc stacked
                let
                    item $ first ys
                  cond
                      string? item
                      let
                          info $ wrap-leaf item
                          width $ :width info
                          height $ :height info
                          tree $ :tree info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position ([] x-position 10)
                              , tree
                          rest ys
                          + x-position width 4
                          , y-position stacked $ inc idx
                    (and (is-linear? item) (not= 1 (count ys)))
                      let
                          info $ wrap-linear-expr item
                          width $ :width info
                          height $ :height info
                          tree $ :tree info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position
                                [] (+ 4 x-position) 0
                              polyline $ {}
                                :style $ {} (:width 1) (:alpha 0.8)
                                  :color $ hslx 200 100 30
                                :position $ [] 0 0
                                :points $ [] ([] 0 0)
                                  [] 0 $ * (inc stacked) (+ 12 line-height)
                              circle $ {} (:radius 3) (:alpha 1)
                                :fill $ hslx 200 100 30
                                :position $ [] 0 0
                              container
                                {} $ :position
                                  [] 0 $ * (inc stacked) (+ 12 line-height)
                                , tree
                          rest ys
                          + x-position 40
                          &max y-position $ + height
                            * (inc stacked) (+ 12 line-height)
                          inc stacked
                          inc idx
                    (= 1 (count ys))
                      let
                          info $ cond
                              string? item
                              wrap-leaf item
                            (is-linear? item) (wrap-linear-expr item)
                            (with-linear? item) (wrap-expr-with-linear item)
                            true $ wrap-block-expr item
                          width $ :width info
                          height $ :height info
                          tree $ :tree info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position ([] x-position 0)
                              , tree
                          rest ys
                          + x-position width 4
                          &max (+ y-position height) height
                          inc stacked
                          inc idx
                    true $ {}
                      :tree $ create-list :container ({})
                        conj acc $ [] idx (comp-error ys)
                      :width x-position
                      :height $ * line-height (inc stacked)
        |with-linear? $ quote
          defn with-linear? (xs)
            cond
                empty? xs
                , true
              (= 1 (count xs))
                , true
              true $ let
                  x0 $ first xs
                if (string? x0)
                  recur $ rest xs
                  if (is-linear? x0)
                    recur $ rest xs
                    , false
        |wrap-linear-expr $ quote
          defn wrap-linear-expr (xs)
            loop
                acc $ []
                ys xs
                x-position 4
                h 0
                idx 0
              if (empty? ys)
                {}
                  :tree $ container ({})
                    polyline $ {}
                      :style $ {} (:width 1) (:alpha 1)
                        :color $ hslx 40 100 30
                      :position $ [] 0 0
                      :points $ [] ([] 0 0) ([] x-position 0)
                    circle $ {}
                      :position $ [] 0 0
                      :radius 5
                      :fill $ hslx 260 80 60
                    create-list :container ({}) acc
                  :width x-position
                  :height $ &max h line-height
                let
                    item $ first ys
                    info $ cond
                        string? item
                        wrap-leaf item
                      (is-linear? item) (wrap-linear-expr item)
                      (with-linear? item) (wrap-expr-with-linear item)
                      true $ wrap-block-expr item
                    width $ :width info
                    height $ :height info
                    tree $ :tree info
                  recur
                    conj acc $ [] idx
                      container
                        {} $ :position
                          [] (+ 6 x-position) 0
                        , tree
                    rest ys
                    + x-position width 8
                    &max h height
                    inc idx
        |inline $ quote
          defmacro inline (path)
            read-file $ str "\"data/" path
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
        |line-height $ quote (def line-height 24)
