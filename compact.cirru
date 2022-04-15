
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/ |pointed-prompt/
    :version nil
  :entries $ {}
    :server $ {} (:reload-fn |app.server/reload!)
      :modules $ [] |calcit-http/
      :init-fn |app.server/main!
  :files $ {}
    |app.schema $ {}
      :ns $ quote (ns app.schema)
      :defs $ {}
        |store $ quote
          def store $ {}
            :states $ {}
            :code-tree $ first
              parse-cirru (inline "\"cirru-edit.cirru") (; inline "\"with-linear.cirru") (; inline "\"debug.cirru") (; inline "\"updater.cirru")
            :saved-files $ {}
            :files $ {}
            :focus $ []
            :warning nil
            :def-path $ []
        |inline $ quote
          defmacro inline (path)
            read-file $ str "\"data/" path
        |example-files $ quote
          def example-files $ {}
            |cirru-edit $ parse-cirru (inline |cirru-edit.cirru)
            |debug $ parse-cirru (inline |debug.cirru)
            |expr-demo $ parse-cirru (inline |expr-demo.cirru)
            |page-demo $ parse-cirru (inline |page-demo.cirru)
            |updater-demo $ parse-cirru (inline |updater-demo.cirru)
            |with-linear $ parse-cirru (inline |with-linear.cirru)
            |wrap-expr-demo $ parse-cirru (inline |wrap-expr-demo.cirru)
            |empty $ parse-cirru (inline |empty.cirru)
    |app.updater $ {}
      :ns $ quote
        ns app.updater $ :require
          phlox.cursor :refer $ update-states
      :defs $ {}
        |updater $ quote
          defn updater (store op op-data op-id op-time)
            case-default op
              do (eprintln "\"unknown op" op op-data) store
              :load-files $ -> store (assoc  :files op-data) (assoc  :saved-files op-data)
              :cirru-edit $ let
                  def-path $ prepend (:def-path store) :files
                  def-target $ -> store (get-in def-path)
                if (tuple? def-target)
                  let[] (tree focus warning)
                    cirru-edit (nth def-target 1) (:focus store) op-data
                    if (some? warning) (js/console.warn warning)
                    -> store
                      assoc-in def-path $ :: 'quote tree
                      assoc :focus focus :warning warning
                  assoc store :warning $ str "\"target not found at:" def-path
              :cirru-edit-node $ let-sugar
                    [] focus code
                    , op-data
                  def-path $ prepend (:def-path store) :files
                  def-target $ -> store (get-in def-path)
                if (tuple? def-target)
                  assoc-in store def-path $ :: 'quote
                    assoc-in (nth def-target 1) focus code
                  assoc store :warning $ str "\"target not found at:" def-path
              :def-path $ assoc store :def-path op-data
              :focus $ assoc store :focus op-data
              :replace-tree $ assoc store :code-tree op-data :focus ([]) :warning nil
              :warn $ assoc store :warning op-data
              :add-ns $ let
                  ns $ or op-data "\"TODO_NS"
                assoc-in store ([] :files ns)
                  {}
                    :ns $ :: 'quote ([] "\"ns" ns)
                    :defs $ {}
              :rm-ns $ if (some? op-data)
                dissoc-in store $ [] :files op-data
                , store
              :add-def $ let[] (ns def-name)
                or op-data $ [] "\"TODO_NS" "\"TODO_DEF"
                update store :files $ fn (files)
                  if (contains? files ns)
                    update-in files ([] ns :defs)
                      fn (defs)
                        if (contains? defs def-name) defs $ assoc defs def-name
                          :: 'quote $ [] "\"defn" def-name ([])
                    , files
              :rm-def $ let[] (ns def-name)
                or op-data $ [] "\"TODO_NS" "\"TODO_DEF"
                update store :files $ fn (files)
                  if (contains? files ns)
                    update-in files ([] ns :defs)
                      fn (defs)
                        if (contains? defs def-name) (dissoc defs def-name) defs
                    , files
              :states $ update-states store op-data
              :hydrate-storage op-data
        |cirru-edit $ quote
          defn cirru-edit (tree focus op-data) (; println "\"TODO" tree focus op-data)
            let
                key $ :key op-data
                code $ :key-code op-data
                meta? $ or (:meta? op-data) (:ctrl? op-data)
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
                (and (>= code 65) (<= code 90) (not meta?))
                  let
                      target $ get-in tree focus
                    if (string? target)
                      []
                        assoc-in tree focus $ str target key
                        , focus nil
                      [] tree focus "\"not text"
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
                  if (empty? focus)
                    if (empty? tree)
                      [] ([] "\"") ([] 0) nil
                      [] tree focus "\"at root"
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
                (= key "\" ")
                  if (empty? focus)
                    if (empty? tree)
                      [] ([] "\"") ([] 0) nil
                      [] tree focus "\"at root"
                    if shift?
                      let
                          target $ get-in tree focus
                        if (string? target)
                          []
                            assoc-in tree focus $ str target key
                            , focus nil
                          []
                            update-in tree (butlast focus)
                              fn (xs)
                                &list:assoc-before xs (last focus) "\""
                            conj (butlast focus)
                              inc $ last focus
                            , nil
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
                        if (string? target)
                          let
                              parent $ get-in tree (butlast focus)
                            if
                              = 1 $ count parent
                              []
                                assoc-in tree (butlast focus) (get-in tree focus)
                                butlast focus
                                , nil
                              [] tree focus "\"not working for leaf"
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
                (and (= 1 (count key)) (not meta?))
                  let
                      target $ get-in tree focus
                    if (string? target)
                      []
                        assoc-in tree focus $ str target key
                        , focus nil
                      [] tree focus "\"not text"
                true $ do (js/console.log "\"unknown event:" op-data) ([] tree focus)
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
          phlox.comp.button :refer $ comp-button
          phlox.comp.drag-point :refer $ comp-drag-point
          phlox.comp.slider :refer $ comp-slider
          app.math :refer $ divide-path multiply-path
          app.config :refer $ leaf-gap block-indent leaf-height line-height code-font api-host
          app.schema :refer $ inline example-files
          phlox.complex :as complex
          pointed-prompt.core :refer $ prompt-at!
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
        |pick-leaf-color $ quote
          defn pick-leaf-color (s head?)
            cond
                or (= s "\"true") (= s "\"false") (= s "\"nil") (= s "\";")
                hslx 300 100 30
              (= "\"\"" (get s 0))
                hslx 70 50 40
              (= "\":" (get s 0))
                hslx 240 80 74
              (.!test pattern-number s) (hslx 340 100 30)
              head? $ hslx 160 70 76
              true $ hslx 190 50 50
        |shape-tabs $ quote
          def shape-tabs $ create-list :container
            {} $ :position ([] -200 0)
            -> ([] |cirru-edit |debug |expr-demo |page-demo |updater-demo |with-linear |wrap-expr-demo "\"empty")
              map-indexed $ fn (idx name)
                [] idx $ comp-button
                  {} (:text name)
                    :position $ [] 0 (* idx 40)
                    :on-pointertap $ fn (e d!)
                      d! :replace-tree $ or (get example-files name) ([])
        |comp-container $ quote
          defcomp comp-container (store)
            let
                states $ :states store
                cursor $ []
                state $ or (:data states)
                  {} (:selected-ns nil) (:def-target nil)
                tree $ :code-tree store
                focus $ :focus store
                files $ :files store
              container
                {} $ :on-keyboard
                  {} $ :down
                    fn (e d!)
                      if
                        = "\"Tab" $ :key e
                        .!preventDefault $ :event e
                        .!stopPropagation $ :event e
                        js/document.body.focus
                      if
                        not $ and (:meta? e)
                          = "\"Tab" $ :key e
                        d! :cirru-edit $ dissoc e :event
                comp-ns-entries (keys files) (:selected-ns state)
                  fn (ns d!)
                    d! cursor $ assoc state :selected-ns ns
                if-let
                  file $ get files (:selected-ns state)
                  comp-file (:selected-ns state) file (:def-target state)
                    fn (path d!)
                      d! cursor $ assoc state :def-target path
                      d! :def-path $ prepend path (:selected-ns state)
                if-let
                  warning $ :warning store
                  text $ {} (:text warning)
                    :position $ [] 0 -40
                    :style $ {} (:fill |red) (:font-size 14) (:font-family code-font)
                comp-button $ {} (:text "\"Save") (:font-family code-font)
                  :position $ [] -60 -160
                  :on-pointertap $ fn (e d!)
                    on-save (:files store) (:saved-files store) d!
                comp-button $ {} (:text "\"Command") (:font-family code-font)
                  :position $ [] 0 -160
                  :on-pointertap $ fn (e d!)
                    prompt-at!
                      &let
                        pos $ -> e .-data .-global
                        [] (.-x pos) (.-y pos)
                      {} $ :style
                        {} $ :font-family code-font
                      fn (content)
                        let
                            code $ first (parse-cirru content)
                          if (list? code) (run-command code d!)
                            d! :warn $ str "\"invalid command:" code
                :tree $ let
                    item $ -> files
                      get $ :selected-ns state
                      get-in $ or (:def-target state) ([])
                      get 1
                  cond
                      string? item
                      wrap-leaf item ([]) focus false
                    (is-linear? item)
                      wrap-linear-expr item ([]) focus
                    (with-linear? item)
                      wrap-expr-with-linear item ([]) focus true
                    true $ wrap-block-expr item ([]) focus
                ; comp-hint (>> states :hint) focus $ get-in tree focus
        |comp-file $ quote
          defn comp-file (ns file selected on-select)
            container
              {} $ :position ([] -160 0)
              comp-button $ {} (:text ns)
                :position $ [] 0 -60
                :font-family "\"Roboto Mono, monospace"
                :fill $ if
                  = (get selected 0) :ns
                  hslx 0 0 30
                :on-pointertap $ fn (e d!)
                  ; d! :replace-tree $ nth (:ns file) 1
                  on-select ([] :ns) d!
              create-list :container
                {} $ :position ([] 0 0)
                -> (:defs file) (.to-list)
                  map-indexed $ fn (idx pair)
                    [] idx $ comp-button
                      {}
                        :text $ first pair
                        :position $ [] 0 (* idx 40)
                        :font-family "\"Roboto Mono, monospace"
                        :fill $ if
                          = (get selected 1) (first pair)
                          hslx 0 0 30
                        :on-pointertap $ fn (e d!)
                          ; d! :replace-tree $ nth (nth pair 1) 1
                          on-select
                            [] :defs $ first pair
                            , d!
        |comp-hint $ quote
          defn comp-hint (states focus target)
            let
                cursor $ :cursor states
                state $ or (:data states)
                  {} $ :p1 ([] 400 -100)
              container ({})
                comp-drag-point (>> states :p1)
                  {} (:hide-text? true)
                    :position $ :p1 state
                    :radius 8
                    :fill $ hslx 60 90 44
                    :on-change $ fn (position d!)
                      d! cursor $ assoc state :p1 position
                text $ {}
                  :text $ .!slice
                    format-to-lisp $ turn-quoted target
                    , 0 200
                  :position $ complex/add (:p1 state) ([] 12 -6)
                  :style $ {}
                    :fill $ hslx 200 40 50
                    :font-size 10
                    :font-family "|Roboto Mono, manospace"
        |turn-quoted $ quote
          defn turn-quoted (target)
            if (string? target) (turn-symbol target) (map target turn-quoted)
        |pattern-number $ quote
          def pattern-number $ new js/RegExp "\"^-?\\d+(\\.\\d+)?$"
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
        |on-save $ quote
          defn on-save (files saved-files d!)
            let
                removed-entries $ difference (keys saved-files) (keys files)
                common-ns $ intersection (keys files) (keys saved-files)
                new-entries $ ->
                  difference (keys files) (keys saved-files)
                  .to-list
                  map $ fn (ns)
                    [] ns $ get files ns
                  pairs-map
                changed-entries $ -> common-ns
                  map $ fn (ns)
                    [] ns $ let
                        file $ get files ns
                        saved-file $ get saved-files ns
                      if (= file saved-file) nil $ let
                          defs $ :defs file
                          saved-defs $ :defs saved-file
                          common-defs $ intersection (keys saved-defs) (keys defs)
                          new-defs $ difference (keys defs) (keys saved-defs)
                        {}
                          :ns $ if
                            = (:ns file) (:ns saved-file)
                            , nil (:ns file)
                          :added-defs $ -> new-defs
                            map $ fn (def-name)
                              [] def-name $ get defs def-name
                            pairs-map
                          :removed-defs $ difference (keys saved-defs) (keys defs)
                          :changed-defs $ -> common-defs
                            filter $ fn (def-name)
                              not= (get defs def-name) (get saved-defs def-name)
                            map $ fn (def-name)
                              [] def-name $ get defs def-name
                            pairs-map
                  filter $ fn (pair)
                    some? $ nth pair 1
                  pairs-map
                content $ format-cirru-edn
                  {} (:added new-entries) (:removed removed-entries) (:changed changed-entries)
              ; js/console.log changed-entries
              ; println $ format-cirru-edn changed-entries
              ->
                js/fetch (str api-host "\"/compact-inc")
                  js-object (:method "\"PUT") (:body content)
                .then $ fn (res) (js/console.log "\"response" res)
        |comp-ns-entries $ quote
          defn comp-ns-entries (ns-entries selected on-select)
            create-list :container
              {} $ :position ([] -320 0)
              -> ns-entries (.to-list)
                map-indexed $ fn (idx name)
                  [] idx $ comp-button
                    {} (:text name)
                      :position $ [] 0 (* idx 40)
                      :font-family "\"Roboto Mono, monospace"
                      :fill $ if (= name selected) (hslx 0 0 30)
                      :on-pointertap $ fn (e d!) (on-select name d!)
        |wrap-leaf $ quote
          defn wrap-leaf (s coord focus head?)
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
                    :line-style $ {} (:width 1) (:alpha 0.18)
                      :color $ hslx 60 80 100
                    :on $ {}
                      :pointertap $ fn (e d!)
                        if (-> e .-data .-originalEvent .-metaKey)
                          prompt-at!
                            &let
                              pos $ -> e .-data .-global
                              [] (.-x pos) (.-y pos)
                            {} (:initial s)
                              :style $ {} (:font-family code-font)
                            fn (content)
                              d! :cirru-edit-node $ [] coord content
                          d! :focus coord
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
                      :fill $ pick-leaf-color s head?
                      :font-size 14
                      :font-family "|Roboto Mono"
                :width width
                :y-stack 1
                :winding-x nil
        |run-command $ quote
          defn run-command (code d!)
            case-default (first code)
              d! :warn $ str "\"invalid command: " code
              "\"add-ns" $ d! :add-ns (nth code 1)
              "\"rm-ns" $ d! :rm-ns (nth code 1)
              "\"add-def" $ d! :add-def
                [] (nth code 1) (nth code 2)
              "\"rm-def" $ d! :rm-def
                [] (nth code 1) (nth code 2)
        |on-expr-click $ quote
          defn on-expr-click (e code coord d!)
            if (-> e .-data .-originalEvent .-metaKey)
              prompt-at!
                &let
                  pos $ -> e .-data .-global
                  [] (.-x pos) (.-y pos)
                {} (:textarea? true)
                  :initial $ format-cirru ([] code)
                  :style $ {} (:font-family code-font)
                fn (content)
                  d! :cirru-edit-node $ [] coord
                    first $ parse-cirru content
              d! :focus coord
        |wrap-block-expr $ quote
          defn wrap-block-expr (xs coord focus)
            loop
                acc $ []
                ys xs
                x-position 0
                y-stack 0
                idx 0
                prev-width 0
                winding-x nil
                prev-leaf? false
              if (empty? ys)
                {}
                  :tree $ container ({})
                    polyline $ {}
                      :style $ {} (:width 1) (:alpha 1)
                        :color $ hslx 200 100 30
                      :position $ [] 0 0
                      :points $ [] ([] 0 0) ([] block-indent 0)
                        [] block-indent $ * line-height
                          &max 0 $ dec y-stack
                    circle $ {} (:radius 6)
                      :position $ [] 0 0
                      :fill $ hslx 160 50 70
                      :on $ {}
                        :pointertap $ fn (e d!) (on-expr-click e xs coord d!)
                    if (= coord focus) shape-focus
                    create-list :container ({}) acc
                  :width x-position
                  :y-stack y-stack
                  :winding-x winding-x
                if
                  and prev-leaf? $ string? (first ys)
                  let
                      item $ first ys
                      next-coord $ conj coord idx
                      info $ wrap-leaf item next-coord focus (= idx 0)
                      width $ :width info
                      tree $ :tree info
                      offset $ + x-position leaf-gap
                    recur
                      conj acc $ [] idx
                        container
                          {} $ :position
                            [] (+ block-indent offset)
                              * (dec y-stack) line-height
                          , tree
                      rest ys
                      + width offset
                      , y-stack (inc idx) (+ width offset)
                        if (= 0 idx) (:winding-x info) winding-x
                        , true
                  let
                      item $ first ys
                      next-coord $ conj coord idx
                      info $ cond
                          string? item
                          wrap-leaf item next-coord focus $ = idx 0
                        (is-linear? item) (wrap-linear-expr item next-coord focus)
                        (with-linear? item) (wrap-expr-with-linear item next-coord focus true)
                        true $ wrap-block-expr item next-coord focus
                      width $ :width info
                      tree $ :tree info
                      next-y-stack $ if
                        some? $ :winding-x info
                        if
                          >
                            either (:winding-x info) 0
                            + block-indent prev-width
                          , y-stack $ inc y-stack
                        , y-stack
                    recur
                      conj acc $ [] idx
                        container
                          {} $ :position
                            [] block-indent $ * next-y-stack line-height
                          , tree $ ; text
                            {}
                              :text $ str
                                [] prev-width (:winding-x info) (do width)
                              :position $ [] 0 -8
                              :rotation -0.4
                              :style $ {} (:fill |red) (:font-size 8) (:font-family "|Source Code Pro, monospace")
                      rest ys
                      , width
                        + next-y-stack $ :y-stack info
                        inc idx
                        , width
                          if (= 0 idx) (:winding-x info) winding-x
                          string? item
        |wrap-expr-with-linear $ quote
          defn wrap-expr-with-linear (xs coord focus parent-winding-okay?)
            loop
                acc $ []
                ys xs
                x-position block-indent
                y-stack 1
                idx 0
                winding-okay? parent-winding-okay?
                winding-x nil
              if (empty? ys)
                {}
                  :tree $ container ({})
                    polyline $ {}
                      :style $ {} (:width 1) (:alpha 1)
                        :color $ hslx 200 100 30
                      :position $ [] 0 0
                      :points $ [] ([] 0 0) ([] x-position 0)
                    circle $ {} (:radius 6)
                      :position $ [] 0 0
                      :fill $ hslx 340 90 50
                      :on $ {}
                        :pointertap $ fn (e d!) (on-expr-click e xs coord d!)
                    if (= coord focus) shape-focus
                    create-list :container ({}) (reverse acc)
                  :width x-position
                  :y-stack y-stack
                  :winding-x winding-x
                let
                    item $ first ys
                    next-coord $ conj coord idx
                  cond
                      string? item
                      let
                          info $ wrap-leaf item next-coord focus (= idx 0)
                          width $ :width info
                          tree $ :tree info
                        recur
                          conj acc $ [] idx
                            container
                              {} $ :position ([] x-position 0)
                              , tree
                          rest ys
                          + x-position width $ if
                            string? $ get ys 1
                            , leaf-gap block-indent
                          , y-stack (inc idx) winding-okay? winding-x
                    (and winding-okay? (is-linear? item) (not= 1 (count ys)))
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
                                  [] 0 $ * -1 line-height
                              circle $ {} (:radius 3) (:alpha 1)
                                :position $ [] 0 0
                                :fill $ hslx 200 100 30
                              container
                                {} $ :position
                                  [] 0 $ * -1 line-height
                                :tree info
                          rest ys
                          + x-position block-indent
                          , y-stack (inc idx) false x-position
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
                          , false winding-x
                    (and (= 1 (count ys)) (and (> y-stack 1) (is-linear? item)))
                      let
                          info $ cond
                              is-linear? item
                              wrap-linear-expr item next-coord focus
                            (with-linear? item) (wrap-expr-with-linear item next-coord focus winding-okay?)
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
                          , winding-okay? winding-x
                    (and (= 1 (count ys)) (&= y-stack 1))
                      let
                          info $ cond
                              is-linear? item
                              wrap-linear-expr item next-coord focus
                            (with-linear? item) (wrap-expr-with-linear item next-coord focus winding-okay?)
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
                          , winding-okay? $ either winding-x
                            if-let
                              x $ :winding-x info
                              + x-position x
                    (= 1 (count ys))
                      let
                          info $ cond
                              with-linear? item
                              wrap-expr-with-linear item next-coord focus winding-okay?
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
                          , winding-okay? winding-x
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
                      :radius 6
                      :fill $ hslx 260 80 60
                      :on $ {}
                        :pointertap $ fn (e d!) (on-expr-click e xs coord d!)
                    if (= coord focus) shape-focus
                    create-list :container ({}) acc
                  :width x-position
                  :y-stack y-stack
                let
                    item $ first ys
                    next-coord $ conj coord idx
                    info $ cond
                        string? item
                        wrap-leaf item next-coord focus $ = idx 0
                      (is-linear? item) (wrap-linear-expr item next-coord focus)
                      true $ comp-error item
                    width $ :width info
                    tree $ :tree info
                  recur
                    conj acc $ [] idx
                      container
                        {} $ :position
                          [] (+ x-position leaf-gap) 0
                        , tree
                    rest ys
                    + x-position width $ if
                      head-in-list $ rest ys
                      , block-indent leaf-gap
                    &max y-stack $ :y-stack info
                    inc idx
        |head-in-list $ quote
          defn head-in-list (xs)
            if
              some? $ first xs
              list? $ first xs
              , false
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
          app.config :refer $ api-host
      :defs $ {}
        |main! $ quote
          defn main! () (; js/console.log PIXI)
            if dev? $ load-console-formatter!
            -> (new FontFaceObserver "\"Roboto Mono") (.!load)
              .!then $ fn (event) (render-app!) ("js/window._phloxTree. renderer.plugins.accessibility.destroy")
            add-watch *store :change $ fn (store prev) (render-app!)
            render-control!
            start-control-loop! 8 on-control-event
            load-files! dispatch!
            println "\"App Started"
        |*store $ quote (defatom *store schema/store)
        |dispatch! $ quote
          defn dispatch! (op op-data)
            if (list? op)
              recur :states $ [] op op-data
              do
                when
                  and dev? $ not= op :states
                  println "\"dispatch!" op
                let
                    op-id $ shortid/generate
                    op-time $ js/Date.now
                  reset! *store $ updater @*store op op-data op-id op-time
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (clear-phlox-caches!) (remove-watch *store :change)
              add-watch *store :change $ fn (store prev) (render-app!)
              render-app!
              replace-control-loop! 8 on-control-event
              hud! "\"ok~" "\"Ok"
              load-files! dispatch!
            hud! "\"error" build-errors
        |render-app! $ quote
          defn render-app! () $ render! (comp-container @*store) dispatch! ({})
        |load-files! $ quote
          defn load-files! (d!)
            -> (str api-host "\"/compact-data") (js/fetch)
              .then $ fn (res) (.!text res)
              .then $ fn (text)
                let
                    files $ :files (parse-cirru-edn text)
                  if (some? files) (d! :load-files files) (js/console.log "\"unknown data:" files)
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
        |code-font $ quote (def code-font "\"Roboto Mono, monospace")
        |api-host $ quote
          def api-host $ str "\"http://" js/location.hostname "\":6101"
        |cors-headers $ quote
          def cors-headers $ {} (:Content-Type "\"data/cirru-edn") (:Access-Control-Allow-Origin "\"*") (:Access-Control-Allow-Methods "\"*")
    |app.server $ {}
      :ns $ quote
        ns app.server $ :require
          http.core :refer $ serve-http!
          app.config :refer $ cors-headers
      :defs $ {}
        |main! $ quote
          defn main! () (println "\"start web server") (start-server!)
        |reload! $ quote
          defn reload! () $ println "\"reload..."
        |on-request $ quote
          defn on-request (req)
            case-default (:url req)
              do
                eprintln "\"unknown url" $ :url req
                {} (:code 404)
                  :body $ str "\"unkown url " (:url req)
              "\"/compact-data" $ let
                  content $ read-file "\"compact.cirru"
                {} (:code 200) (:headers cors-headers) (:body content)
              "\"/compact-inc" $ case-default (:method req)
                do
                  println "\"Unknown method" $ :method req
                  {} (:code 400) (:headers cors-headers)
                    :body $ format-cirru-edn
                      {} (:ok? false)
                        :message $ str "\"Unknown method " (:method req)
                :PUT $ let
                    body $ :body req
                    changes $ parse-cirru-edn body
                    new-compact-data $ patch-compact-data
                      parse-cirru-edn $ read-file "\"compact.cirru"
                      , changes
                  write-file "\"compact.cirru" $ format-cirru-edn new-compact-data
                  write-file "\".compact-inc.cirru" body
                  println "\"wrote to" "\".compact-inc.cirru" "\" and " "\"compact.cirru"
                  ; println "\"data" $ :body req
                  {} (:code 200) (:headers cors-headers)
                    :body $ format-cirru-edn
                      {} (:ok? true) (:data "\"wrote")
                :OPTIONS $ {} (:code 200) (:headers cors-headers) (:body "\"OK")
        |start-server! $ quote
          defn start-server! () $ reset! *app-server
            serve-http!
              {} (:port 6101) (:host "\"0.0.0.0")
              fn (req) (on-request req)
        |*app-server $ quote (defatom *app-server nil)
        |patch-compact-data $ quote
          defn patch-compact-data (compact-data inc-changes)
            let
                removed $ or (:removed inc-changes) (#{})
                added $ or (:added inc-changes) ({})
                changed $ or (:changed inc-changes) ({})
              ; println "\"inc changes:" changed
              update compact-data :files $ fn (files)
                let
                    c1 $ -> files (unselect-keys removed) (merge added)
                  loop
                      files-data c1
                      changes $ .to-list changed
                    if (empty? changes) files-data $ let
                        pair $ first changes
                        target-ns $ nth pair 0
                        target $ nth pair 1
                        removed-defs $ :removed-defs target
                        added-defs $ :added-defs target
                        changed-defs $ :changed-defs target
                        ns-change $ :ns target
                        next $ update files-data target-ns
                          fn (file)
                            -> file
                              update :ns $ fn (ns)
                                if (some? ns-change) ns-change ns
                              update :defs $ fn (defs)
                                -> defs (unselect-keys removed-defs) (merge added-defs changed-defs)
                      recur next $ rest changes
