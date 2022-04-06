
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/
    :version nil
  :entries $ {}
  :files $ {}
    |app.schema $ {}
      :ns $ quote (ns app.schema)
      :defs $ {}
        |store $ quote
          def store $ {}
            :states $ {}
            :code-tree $ first
              parse-cirru $ inline "\"with-linear.cirru"
            :focus $ []
            :warning nil
        |inline $ quote
          defmacro inline (path)
            read-file $ str "\"data/" path
    |app.updater $ {}
      :ns $ quote
        ns app.updater $ :require
          phlox.cursor :refer $ update-states
      :defs $ {}
        |updater $ quote
          defn updater (store op op-data op-id op-time)
            case-default op
              do (println "\"unknown op" op op-data) store
              :cirru-edit $ let[] (tree focus warning)
                cirru-edit (:code-tree store) (:focus store) op-data
                if (some? warning) (js/console.warn warning)
                assoc store :code-tree tree :focus focus :warning warning
              :focus $ assoc store :focus op-data
              :states $ update-states store op-data
              :hydrate-storage op-data
        |cirru-edit $ quote
          defn cirru-edit (tree focus op-data) (; println "\"TODO" tree focus op-data)
            let
                key $ :key op-data
                code $ :key-code op-data
                meta? $ :meta? op-data
                shift? $ :shift? op-data
              cond
                  = "\"Backspace" key
                  if (empty? focus) ([] tree focus "\"cannot delete root")
                    let
                        target $ get-in tree focus
                      if
                        or (list? target) meta? $ = target "\""
                        let
                            parent-coord $ butlast focus
                            next-tree $ dissoc-in tree focus
                            next-focus $ if
                              = 0 $ last focus
                              , parent-coord
                                conj parent-coord $ dec (last focus)
                          [] next-tree next-focus nil
                        []
                          update-in tree focus $ fn (leaf)
                            .slice leaf 0 $ dec (count leaf)
                          , focus nil
                (and (>= code 65) (<= code 90))
                  let
                      target $ get-in tree focus
                    if (string? target)
                      []
                        assoc-in tree focus $ str target key
                        , focus nil
                      tree focus "\"not text"
                (= key "\"ArrowUp")
                  if (empty? focus) ([] tree focus "\"already at top")
                    [] tree (butlast focus) nil
                (= key "\"ArrowLeft")
                  if (empty? focus) ([] tree focus "\"already at root")
                    if
                      > (last focus) 0
                      [] tree
                        conj (butlast focus)
                          dec $ last focus
                        , nil
                      [] tree focus "\"already at first elelement"
                (= key "\"ArrowRight")
                  if (empty? focus) ([] tree focus "\"already at root")
                    let
                        parent $ get-in tree (butlast focus)
                      if
                        >= (last focus)
                          dec $ count parent
                        [] tree focus "\"already at last elelement"
                        [] tree
                          conj (butlast focus)
                            inc $ last focus
                          , nil
                (= key "\"ArrowDown")
                  let
                      target $ get-in tree focus
                    if (string? target) ([] tree focus "\"already reached leaf")
                      if (empty? target) ([] tree focus "\"it's empty")
                        [] tree (conj focus 0) nil
                (= key "\"Enter")
                  if (empty? focus) ([] tree focus "\"at root")
                    if shift?
                      []
                        update-in tree (butlast focus)
                          fn (xs)
                            &list:assoc-before xs (last focus) "\""
                        , focus nil
                      []
                        update-in tree (butlast focus)
                          fn (xs)
                            &list:assoc-after xs (last focus) "\""
                        conj (butlast focus)
                          inc $ last focus
                        , nil
                (= "\"Tab" key)
                  if shift?
                    if (empty? focus) ([] tree focus "\"not working for root")
                      let
                          target $ get-in tree focus
                        if (string? target) ([] tree focus "\"not working for leaf")
                          []
                            update-in tree (butlast focus)
                              fn (xs)
                                let
                                    i $ last focus
                                  -> xs
                                    splice-after i $ get xs i
                                    dissoc i
                            , focus nil
                    []
                      update-in tree focus $ fn (xs) ([] xs)
                      conj focus 0
                      , nil
                true $ do (js/console.log op-data) ([] tree focus)
        |splice-after $ quote
          defn splice-after (xs i ys)
            loop
                acc xs
                data $ reverse ys
              if (empty? data) acc $ recur
                &list:assoc-after acc i $ first data
                rest data
    |app.container $ {}
      :ns $ quote
        ns app.container $ :require
          phlox.core :refer $ defcomp >> hslx rect circle text container graphics create-list g polyline
          phlox.comp.drag-point :refer $ comp-drag-point
          phlox.comp.slider :refer $ comp-slider
          app.math :refer $ divide-path multiply-path
          app.config :refer $ leaf-gap block-indent leaf-height line-height
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
                tree $ :code-tree store
                focus $ :focus store
              container
                {} $ :on-keyboard
                  {} $ :down
                    fn (e d!)
                      if
                        = "\"Tab" $ :key e
                        .!preventDefault $ :event e
                      d! :cirru-edit $ dissoc e :event
                text $ {}
                  :text $ :warning store
                  :position $ [] 0 -40
                  :style $ {} (:fill |red) (:font-size 14) (:font-family "|Roboto, sans-serif")
                :tree $ wrap-block-expr tree ([]) focus
        |shape-focus $ quote
          def shape-focus $ circle
            {} (:radius 8)
              :position $ [] 0 0
              :line-style $ {} (:width 1)
                :color $ hslx 60 80 80
                :alpha 0.8
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
          defn wrap-leaf (s coord focus)
            let
                width $ + leaf-gap
                  * 8.8 $ count s
                height leaf-height
              {}
                :tree $ container ({})
                  rect $ {}
                    :position $ [] 0 (* -0.5 height)
                    :size $ [] width height
                    :alpha 0.9
                    :fill $ hslx 190 70 14
                    :on $ {}
                      :pointertap $ fn (e d!) (d! :focus coord)
                  if (= coord focus)
                    rect $ {}
                      :position $ [] 0 (* -0.5 height)
                      :size $ [] width height
                      :alpha 0.8
                      :line-style $ {} (:width 1)
                        :color $ hslx 60 80 80
                        :alpha 0.8
                  text $ {} (:text s)
                    :position $ [] (* 0.5 leaf-gap) -8
                    :style $ {}
                      :fill $ hslx 200 50 80
                      :font-size 14
                      :font-family "|Roboto Mono"
                :width width
                :y-stack 1
        |wrap-block-expr $ quote
          defn wrap-block-expr (xs coord focus)
            loop
                acc $ []
                ys xs
                x-position 0
                y-stack 0
                idx 0
              if (empty? ys)
                {}
                  :tree $ container ({})
                    polyline $ {}
                      :style $ {} (:width 1) (:alpha 1)
                        :color $ hslx 200 100 30
                      :position $ [] 0 0
                      :points $ [] ([] 0 0) ([] block-indent 0)
                        [] block-indent $ * line-height (dec y-stack)
                    circle $ {} (:radius 6)
                      :position $ [] 0 0
                      :fill $ hslx 120 50 70
                      :on $ {}
                        :pointertap $ fn (e d!) (d! :focus coord)
                    if (= coord focus) shape-focus
                    create-list :container ({}) acc
                  :width x-position
                  :y-stack y-stack
                let
                    item $ first ys
                    next-coord $ conj coord idx
                    info $ cond
                        string? item
                        wrap-leaf item next-coord focus
                      (is-linear? item) (wrap-linear-expr item next-coord focus)
                      (with-linear? item) (wrap-expr-with-linear item next-coord focus)
                      true $ wrap-block-expr item next-coord focus
                    width $ :width info
                    tree $ :tree info
                  recur
                    conj acc $ [] idx
                      container
                        {} $ :position
                          [] block-indent $ * y-stack line-height
                        , tree
                    rest ys
                    , 20
                      + y-stack $ :y-stack info
                      inc idx
        |wrap-expr-with-linear $ quote
          defn wrap-expr-with-linear (xs coord focus)
            loop
                acc $ []
                ys xs
                x-position block-indent
                y-stack 1
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
                      :on $ {}
                        :pointertap $ fn (e d!) (d! :focus coord)
                    if (= coord focus) shape-focus
                    create-list :container ({}) (reverse acc)
                  :width x-position
                  :y-stack y-stack
                let
                    item $ first ys
                    next-coord $ conj coord idx
                  cond
                      string? item
                      let
                          info $ wrap-leaf item next-coord focus
                          width $ :width info
                          tree $ :tree info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position ([] x-position 0)
                              , tree
                          rest ys
                          + x-position width block-indent
                          , y-stack $ inc idx
                    (and (is-linear? item) (not= 1 (count ys)))
                      let
                          focused? $ = next-coord focus
                          info $ wrap-linear-expr item next-coord focus
                          width $ :width info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position
                                [] (+ 4 x-position) 0
                              polyline $ {}
                                :style $ {} (:width 1) (:alpha 0.8)
                                  :color $ if focused? (hslx 200 100 80) (hslx 200 100 40)
                                :position $ [] 0 0
                                :points $ [] ([] 0 0)
                                  [] 0 $ * y-stack line-height
                              circle $ {} (:radius 3) (:alpha 1)
                                :position $ [] 0 0
                                :fill $ hslx 200 100 30
                              container
                                {} $ :position
                                  [] 0 $ * y-stack line-height
                                :tree info
                          rest ys
                          + x-position block-indent
                          inc y-stack
                          inc idx
                    (and (= 1 (count ys)) (and (> y-stack 1) (is-linear? item)))
                      let
                          info $ cond
                              is-linear? item
                              wrap-linear-expr item next-coord focus
                            (with-linear? item) (wrap-expr-with-linear item next-coord focus)
                            true $ wrap-block-expr item next-coord focus
                          width $ :width info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position
                                [] (+ block-indent x-position) 0
                              :tree info
                          rest ys
                          + x-position width block-indent
                          &max y-stack $ :y-stack info
                          inc idx
                    (and (= 1 (count ys)) (&= y-stack 1))
                      let
                          info $ cond
                              is-linear? item
                              wrap-linear-expr item next-coord focus
                            (with-linear? item) (wrap-expr-with-linear item next-coord focus)
                            true $ wrap-block-expr item next-coord focus
                          width $ :width info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position ([] x-position 0)
                              :tree info
                          rest ys
                          + x-position width leaf-gap
                          &max y-stack $ :y-stack info
                          inc idx
                    (= 1 (count ys))
                      let
                          info $ cond
                              with-linear? item
                              wrap-expr-with-linear item next-coord focus
                            true $ wrap-block-expr item next-coord focus
                          width $ :width info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position ([] x-position 0)
                              polyline $ {}
                                :style $ {} (:width 1) (:alpha 0.8)
                                  :color $ hslx 200 100 40
                                :position $ [] 0 0
                                :points $ [] ([] 0 0)
                                  [] 0 $ * y-stack line-height
                              circle $ {} (:radius 3) (:alpha 1)
                                :fill $ hslx 200 100 30
                                :position $ [] 0 0
                              container
                                {} $ :position
                                  [] 0 $ * y-stack line-height
                                :tree info
                          rest ys
                          + x-position width 4
                          + y-stack $ :y-stack info
                          inc idx
                    true $ {}
                      :tree $ create-list :container ({})
                        conj acc $ [] idx (comp-error ys)
                      :width x-position
                      :y-stack y-stack
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
          defn wrap-linear-expr (xs coord focus)
            loop
                acc $ []
                ys xs
                x-position leaf-gap
                y-stack 1
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
                      :on $ {}
                        :pointertap $ fn (e d!) (d! :focus coord)
                    if (= coord focus) shape-focus
                    create-list :container ({}) acc
                  :width x-position
                  :y-stack y-stack
                let
                    item $ first ys
                    next-coord $ conj coord idx
                    info $ cond
                        string? item
                        wrap-leaf item next-coord focus
                      (is-linear? item) (wrap-linear-expr item next-coord focus)
                      (with-linear? item) (wrap-expr-with-linear item next-coord focus)
                      true $ wrap-block-expr item next-coord focus
                    width $ :width info
                    tree $ :tree info
                  recur
                    conj acc $ [] idx
                      container
                        {} $ :position
                          [] (+ leaf-gap x-position) 0
                        , tree
                    rest ys
                    + x-position width leaf-gap
                    &max y-stack $ :y-stack info
                    inc idx
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
                    op-time $ js/Date.now
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
        |leaf-gap $ quote (def leaf-gap 8)
        |block-indent $ quote (def block-indent 20)
        |leaf-height $ quote (def leaf-height 24)
        |line-height $ quote (def line-height 32)
