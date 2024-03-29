
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!) (:version nil)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/ |pointed-prompt/ |alerts.calcit/ |respo-cirru-editor/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:reload-fn |app.server/reload!)
      :modules $ [] |calcit-http/
  :files $ {}
    |app.analyze $ %{} :FileEntry
      :defs $ {}
        |analyze-deps $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn analyze-deps (files)
              let
                  ns-deps-dict $ -> files
                    map-kv $ fn (ns file)
                      [] ns $ parse-import-dict
                        get-in file $ [] :ns :code 1
                  defs-deps-dict $ -> files .to-list
                    mapcat $ fn (pair)
                      let
                          ns $ nth pair 0
                          defs $ -> pair (nth 1) (get :defs)
                        -> defs (.to-list)
                          map $ fn (pair)
                            let
                                def-name $ nth pair 0
                                code $ get-in pair ([] 1 :code 1)
                              [] ([] ns def-name)
                                lookup-body-deps (slice code 2) (get ns-deps-dict ns) ns def-name $ keys defs
                    pairs-map
                  ; defs-dependants-dict $ lookup-dependants defs-deps-dict
                , defs-deps-dict
        |digit-pattern $ %{} :CodeEntry (:doc |)
          :code $ quote
            def digit-pattern $ new js/RegExp "\"^\\d$"
        |flatten $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn flatten (xs)
              if (list? xs) (mapcat xs flatten) ([] xs)
        |lookup-body-deps $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn lookup-body-deps (body imports-dict ns def-name def-names)
              -> body flatten
                filter $ fn (token)
                  if (= token "\"") false $ let
                      c $ nth token 0
                    not $ or (= "\":" c) (= "\"\"" c) (= "\"'" c) (= "\"." c) (= "\";" c) (= token def-name) (= token "\"true") (= token "\"false") (= token "\"nil") (.!test digit-pattern token)
                map strip-at
                , distinct
                  map $ fn (token)
                    cond
                        = token def-name
                        , nil
                      (.includes? def-names token) ([] ns token :file)
                      (contains? (:defs imports-dict) token)
                        &let
                          target-ns $ get-in imports-dict ([] :defs token)
                          [] target-ns token :def
                      (contains? (:npm-defs imports-dict) token)
                        &let
                          target-ns $ get-in imports-dict ([] :npm-defs token)
                          [] target-ns token :npm-def
                      (contains? (:npm-defaults imports-dict) token)
                        &let
                          target-ns $ get-in imports-dict ([] :npm-defaults token)
                          [] target-ns token :npm-default
                      (and (not= (get token 0) "\"/") (.includes? token "\"/"))
                        let
                            pieces $ .split token "\"/"
                            ns-alias $ first pieces
                            def-part $ nth pieces 1
                          cond
                              contains? (:namespaces imports-dict) ns-alias
                              &let
                                target-ns $ get-in imports-dict ([] :namespaces ns-alias)
                                [] target-ns def-part :ns-def
                            (contains? (:npm-namespaces imports-dict) ns-alias)
                              &let
                                target-ns $ get-in imports-dict ([] :npm-namespaces ns-alias)
                                [] target-ns def-part :npm-ns-def
                            true nil
                      true nil
                  filter some?
        |lookup-dependants $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn lookup-dependants (deps-dict)
              -> deps-dict keys
                map $ fn (entry)
                  [] entry $ -> deps-dict
                    filter $ fn (pair)
                      let
                          deps $ nth pair 1
                        any? deps $ fn (piece)
                          and
                            = (nth piece 0) (nth entry 0)
                            = (nth piece 1) (nth entry 1)
                    keys
                pairs-map
        |lookup-target-def $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn lookup-target-def (token files def-path pkg)
              let
                  ns $ first def-path
                  imports-form $ get-in files ([] ns :ns :code 1)
                  dict $ parse-import-dict imports-form
                if
                  contains-in? files $ [] ns :defs token
                  [] ns :defs token
                  if
                    contains-in? dict $ [] :defs token
                    let
                        target-ns $ get-in dict ([] :defs token)
                      if (.starts-with? target-ns pkg) ([] target-ns :defs token) nil
                    if
                      and
                        not= "\"/" $ get token 0
                        .includes? token "\"/"
                      let[] (ns-part def-part) (.split token "\"/")
                        if
                          contains? (:namespaces dict) ns-part
                          let
                              target-ns $ get-in dict ([] :namespaces ns-part)
                            if (.starts-with? target-ns pkg) ([] target-ns :defs def-part) nil
                          , nil
                      , nil
        |parse-import-dict $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn parse-import-dict (ns-form)
              loop
                  dict $ {}
                    :namespaces $ {}
                    :defs $ {}
                    :npm-defaults $ {}
                    :npm-defs $ {}
                    :npm-namespaces $ {}
                  rules $ rest (nth ns-form 2)
                if (empty? rules) dict $ let
                    rule $ regularize-rule (first rules)
                    method $ nth rule 1
                  case-default method
                    raise $ str "\"unknown rule: " method
                    "\":as" $ let[] (target _m alias) rule
                      if
                        = "\"\"" $ first target
                        recur
                          assoc-in dict ([] :npm-namespaces alias) target
                          rest rules
                        recur
                          assoc-in dict ([] :namespaces alias) target
                          rest rules
                    "\":refer" $ let[] (target _m defs-list) rule
                      if
                        = "\"\"" $ first target
                        recur
                          update dict :npm-defs $ fn (dict)
                            loop
                                d dict
                                defs defs-list
                              list-match defs
                                () d
                                (d0 ds)
                                  recur (assoc d d0 target) ds
                          rest rules
                        recur
                          update dict :defs $ fn (dict)
                            loop
                                d dict
                                defs defs-list
                              list-match defs
                                () d
                                (d0 ds)
                                  recur (assoc d d0 target) ds
                          rest rules
                    "\":default" $ recur
                      assoc-in dict
                        [] :npm-defaults $ nth rule 2
                        nth rule 0
                      rest rules
        |regularize-rule $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn regularize-rule (rule)
              -> rule
                filter $ fn (item) (not= item "\"[]")
                map $ fn (item)
                  if (list? item) (regularize-rule item) item
        |strip-at $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn strip-at (token)
              if
                = "\"@" $ nth token 0
                .!slice token 1
                , token
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns app.analyze)
    |app.comp.call-tree $ %{} :FileEntry
      :defs $ {}
        |build-call-tree $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn build-call-tree (deps-tree entry parents)
              let
                  ret $ if (.includes? parents entry)
                    {} (:entry entry) (:looped? true)
                      :children $ []
                    {} (:entry entry) (:looped? false)
                      :children $ let
                          child-deps $ get deps-tree entry
                        if (empty? child-deps) ([])
                          -> child-deps
                            map $ fn (entry3)
                              let
                                  child-entry $ take entry3 2
                                if (contains? deps-tree child-entry)
                                  build-call-tree deps-tree child-entry $ .include parents entry
                                  , nil
                            filter some?
                assoc ret :size $ count-tree ret
        |comp-call-tree $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-call-tree (states deps-tree router pkg)
              let
                  cursor $ :cursor states
                  state $ or (:data states)
                    {}
                      :spin-pos $ [] 600 200
                      :spin 0
                  call-tree $ build-call-tree deps-tree router (#{})
                container ({})
                  ; w-js-log $ comp-curve 200 0.1 0.7 (hsluvx 20 100 60) 40
                  comp-sector call-tree 40 (:spin state) (* 2 &PI) 0
                  comp-spin-slider (>> states :c)
                    {} (:unit 0.4) (:label "\"spin") (:fraction 1)
                      :position $ :spin-pos state
                      :value $ :spin state
                      :on-change $ fn (value d!)
                        d! cursor $ assoc state :spin value
                      :on-move $ fn (pos d!)
                        d! cursor $ assoc state :spin-pos pos
        |comp-sector $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-sector (call-tree radius start-radian radian-size idx)
              let
                  thickness $ + 10 (js/Math.pow radius 0.7)
                    * 2 $ count (:children call-tree)
                container ({})
                  create-list :container ({})
                    loop
                        acc $ []
                        xs $ :children call-tree
                        a0 start-radian
                      list-match xs
                        () acc
                        (x0 xss)
                          let
                              delta $ * (- radian-size 0.01)
                                / (:size x0) (:size call-tree)
                            recur
                              conj acc $ let
                                  index $ count acc
                                [] index $ comp-sector x0 (+ radius thickness 20) a0 delta index
                              , xss $ + a0 delta
                  comp-sector-curve radius start-radian radian-size
                    hslx
                      .rem
                        + radius $ * idx 77
                        , 360
                      , 100 50
                    , thickness
                  text $ {}
                    :text $ nth (:entry call-tree) 1
                    :position $ []
                      * radius $ cos start-radian
                      * radius $ sin start-radian
                    :style $ {} (:fill 0xffffff) (:font-size 10) (:font-family |Hind)
                    :rotation start-radian
        |comp-sector-curve $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-sector-curve (radius start-radian radian-size color thickness)
              let
                  r-extend $ + radius thickness
                  start $ []
                    * radius $ cos start-radian
                    * radius $ sin start-radian
                  end $ []
                    * radius $ cos (+ start-radian radian-size)
                    * radius $ sin (+ start-radian radian-size)
                  start-extend $ []
                    * r-extend $ cos start-radian
                    * r-extend $ sin start-radian
                  end-extend $ []
                    * r-extend $ cos (+ start-radian radian-size)
                    * r-extend $ sin (+ start-radian radian-size)
                graphics $ {}
                  :ops $ []
                    g :begin-fill $ {} (:color color) (:alpha 0.8)
                    ; g :line-style $ {} (:color color) (:width 1) (:alpha 0.6)
                    g :move-to start
                    g :line-to start-extend
                    ; g :arc-to $ {} (:p1 start-extend) (:p2 end-extend) (:radius r-extend)
                    g :arc $ {}
                      :center $ [] 0 0
                      :radian $ [] start-radian (+ start-radian radian-size)
                      :radius r-extend
                    g :line-to end
                    ; g :arc-to $ {} (:p1 end) (:p2 start) (:radius radius)
                    g :arc $ {}
                      :center $ [] 0 0
                      :radian $ [] (+ start-radian radian-size) start-radian
                      :radius radius
                      :anticlockwise? true
                    g :close-path nil
                    g :end-fill
        |count-tree $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn count-tree (tree)
              inc $ -> (:children tree) (map count-tree) (foldl 0 &+)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.call-tree $ :require
            phlox.core :refer $ defcomp >> hslx hclx hsluvx rect circle text container graphics create-list g polyline
            phlox.comp.button :refer $ comp-button
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            app.comp.deps-tree :refer $ comp-deps-tree
            app.analyze :refer $ lookup-target-def strip-at
            phlox.util :refer $ measure-text-width!
            app.comp.editor :refer $ comp-editor
            memof.once :refer $ memof1-call
            phlox.comp.slider :refer $ comp-spin-slider
    |app.comp.command $ %{} :FileEntry
      :defs $ {}
        |commands $ %{} :CodeEntry (:doc |)
          :code $ quote
            def commands $ []
              {} (:tip "\"add-ns <ns>") (:fill "\"add-ns ")
              {} (:tip "\"rm-ns <ns>") (:fill "\"rm-ns ")
              {} (:tip "\"add-def <ns> <def>") (:fill "\"add-def ")
              {} (:tip "\"rm-def <ns> <def>") (:fill "\"rm-def ")
              {} (:tip "\"load") (:comment "\"load data")
              {} (:tip "\"save") (:comment "\"save all files")
              {} (:tip "\"mv-ns <from> <to>") (:fill "\"mv-ns ")
              {} (:tip "\"move-def <from>/<a> <to>/<b>") (:fill "\"move-def ")
              {} (:tip "\"pick [off]") (:fill "\"pick") (:comment "\"pick mode on/off")
              {} (:tip "\"deps-tree") (:fill "\"deps-tree") (:comment "\"call")
              {} (:tip "\"deps-of") (:fill "\"deps-of") (:comment "\"current dependency")
              {} (:tip "\"call-tree") (:fill "\"call-tree") (:comment "\"sunburst graph of current function")
        |comp-command $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-command (states store on-close)
              let
                  cursor $ :cursor states
                  state $ or (:data states)
                    {} $ :content "\""
                  editor $ :editor store
                  def-path $ get-in editor
                    [] :stack $ :pointer editor
                  set-box-text! $ fn (v d!)
                    let
                        box $ -> "\"#command-box" js/document.querySelector
                        next $ str (.-value box) v
                      set! (.-value box) next
                      .!focus box
                      d! cursor $ assoc state :content next
                [] (effect-focus)
                  div
                    {} (:class-name css/column)
                      :style $ {} (:padding 16)
                    div ({})
                      input $ {} (:placeholder "\"Command...") (:autofocus true) (:id "\"command-box") (:spellcheck false) (:autocomplete "\"off")
                        :class-name $ str-spaced css/input css-command-box
                        :style $ {} (:width "\"100%")
                        :value $ :content state
                        :on-input $ fn (e d!)
                          d! cursor $ assoc state :content (:value e)
                        :on-keydown $ fn (e d!)
                          cond
                              = 13 $ :keycode e
                              let
                                  code $ first
                                    parse-cirru-list $ :content state
                                if (list? code) (run-command code store d!)
                                  d! :warn $ str "\"invalid command:" code
                                on-close d!
                            (= "\"Escape" (:key e))
                              on-close d!
                    =< nil 16
                    div
                      {} $ :style ui/row-middle
                      button $ {} (:class-name css/button) (:inner-text "\"Run")
                        :on-click $ fn (e d!)
                          let
                              code $ first
                                parse-cirru-list $ :content state
                            if (list? code) (run-command code store d!)
                              d! :warn $ str "\"invalid command:" code
                            on-close d!
                      =< 16 nil
                      if (list? def-path)
                        list->
                          {} $ :style
                            {} $ :line-height "\"20px"
                          -> def-path $ map-indexed
                            fn (idx piece)
                              [] idx $ span
                                {} (:class-name css-path-tag)
                                  :inner-text $ str piece
                                  :on-click $ fn (e d!)
                                    set-box-text! (str piece) d!
                    =< nil 8
                    comp-command-tips $ fn (v d!) (set-box-text! v d!)
        |comp-command-tips $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-command-tips (set-text!)
              div ({})
                list->
                  {} (:class-name css/row)
                    :style $ {} (:flex-wrap :wrap) (:gap "\"8px")
                  -> commands $ map-indexed
                    fn (idx info)
                      [] idx $ div
                        {} $ :style ({})
                        span
                          {} $ :on-click
                            fn (e d!)
                              set-text! (:fill info) d!
                          <> (:tip info) css-tip
        |css-command-box $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-command-box $ {}
              "\"$0" $ {} (:font-family ui/font-code) (:line-height "\"40px") (:height "\"40px")
        |css-path-tag $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-path-tag $ {}
              "\"$0" $ {} (:font-family ui/font-code) (:display :inline-block) (:white-space :pre-line) (:padding "\"0 6px") (:margin-right "\"4px") (:margin-bottom "\"4px") (:border-radius "\"6px") (:cursor :pointer) (:color :white)
                :background-color $ hsl 200 50 70
              "\"$0:hover" $ {}
                :background-color $ hsl 200 50 60
        |css-tip $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-tip $ {}
              "\"&" $ {} (:padding "\"2px 8px") (:border-radius "\"4px") (:opacity 0.8)
                :background-color $ hsl 0 0 90
                :cursor :pointer
              "\"&:hover" $ {} (:opacity 1)
        |effect-focus $ %{} :CodeEntry (:doc |)
          :code $ quote
            defeffect effect-focus () (action el at?)
              if (= :mount action)
                .!select $ .!querySelector el "\"input"
        |on-save $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                if mocked? (js/alert "\"Data is mocked, nothing to save.")
                  ->
                    js/fetch (str api-host "\"/compact-inc")
                      js-object (:method "\"PUT") (:body content)
                    .!then $ fn (res)
                      d! $ :: :files-synced
                      d! :ok nil
                    .!catch $ fn (e)
                      d! :warn $ str e
        |run-command $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn run-command (code store d!)
              let
                  p1 $ get code 1
                  p2 $ get code 2
                case-default (first code)
                  d! :warn $ str "\"invalid command: " code
                  "\"add-ns" $ d! :add-ns p1
                  "\"rm-ns" $ d! :rm-ns p1
                  "\"add-def" $ d! :add-def ([] p1 p2)
                  "\"rm-def" $ d! :rm-def ([] p1 p2)
                  "\"mv-ns" $ d! :mv-ns ([] p1 p2)
                  "\"mv-def" $ d! :mv-def ([] p1 p2)
                  "\"load" $ load-files! d!
                  "\"save" $ on-save (:files store) (:saved-files store) d!
                  "\"pick" $ if (= p1 "\"off") (d! :picker-mode false) (d! :picker-mode true)
                  "\"deps-tree" $ do
                    d! :deps-tree $ wo-js-log
                      analyze-deps $ :files store
                    d! :router $ {} (:name :deps-tree)
                  "\"deps-of" $ do
                    d! :deps-tree $ analyze-deps (:files store)
                    d! :router $ {} (:name :deps-of)
                      :data $ if (some? p2) ([] p1 p2)
                        let
                            editor $ :editor store
                            def-path $ get-in editor
                              [] :stack $ :pointer editor
                          [] (nth def-path 0) (nth def-path 2)
                  "\"call-tree" $ do
                    d! :deps-tree $ analyze-deps (:files store)
                    d! :router $ {} (:name :call-tree)
                      :data $ if (some? p2) ([] p1 p2)
                        let
                            editor $ :editor store
                            def-path $ get-in editor
                              [] :stack $ :pointer editor
                          [] (nth def-path 0) (nth def-path 2)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.command $ :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ =<
            app.config :refer $ dev? api-host mocked?
            app.widget :as widget
            app.fetch :refer $ load-files!
            app.style :refer $ css-hover-entry
            app.analyze :refer $ analyze-deps
            respo-ui.css :as css
            respo.css :refer $ defstyle
    |app.comp.deps-of $ %{} :FileEntry
      :defs $ {}
        |comp-curves $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-curves (connections)
              graphics $ {}
                :ops $ concat &
                  -> connections $ map-indexed
                    fn (idx pair)
                      let
                          from $ nth pair 0
                          p1 $ nth pair 1
                          p2 $ nth pair 2
                          to $ nth pair 3
                        []
                          g :line-style $ {} (:width 2) (:alpha 1)
                            :color $ hclx
                              .rem (* 37 idx) 360
                              , 100 60
                          g :move-to from
                          g :bezier-to $ {} (:p1 p1) (:p2 p2) (:to-p to)
        |comp-deps-of $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-deps-of (deps-tree entry pkg) (; js/console.log deps-tree entry)
              if (contains? deps-tree entry)
                let
                    deps $ get deps-tree entry
                    internal-deps $ -> deps
                      filter $ fn (item)
                        .starts-with? (nth item 0) pkg
                    external-deps $ -> deps
                      filter $ fn (item)
                        not $ .starts-with? (nth item 0) pkg
                    dependants $ -> deps-tree
                      .filter-kv $ fn (k v)
                        any? v $ fn (piece)
                          and
                            = (nth entry 0) (nth piece 0)
                            = (nth entry 1) (nth piece 1)
                      keys
                    mid-text $ str (nth entry 0) "\"/" (nth entry 1)
                    button-width $ + 16 (measure-text-width! mid-text 14 "\"Josefin Sans")
                    connections $ concat
                      -> dependants .to-list $ map-indexed
                        fn (idx item)
                          let
                              to $ [] -200
                                + 16 $ * (dec idx) 40
                              p2 $ complex/add to ([] 100 0)
                            [] ([] 0 16) ([] -100 16) p2 to
                      -> internal-deps $ map-indexed
                        fn (idx item)
                          let
                              to $ [] 320
                                + 16 $ * (dec idx) 40
                              p2 $ complex/add to ([] -100 0)
                            [] ([] button-width 16)
                              [] (+ 100 button-width) 16
                              , p2 to
                  container ({}) (comp-curves connections)
                    comp-button $ {} (:text mid-text)
                      :position $ [] 0 0
                      :align-right? false
                    create-list :container
                      {} $ :position ([] -200 -40)
                      -> dependants .to-list $ map-indexed
                        fn (idx item)
                          [] idx $ comp-button
                            {}
                              :text $ str (nth item 0) "\"/" (nth item 1) "\"  "
                                count $ get deps-tree (take item 2)
                              :position $ [] 0 (* idx 40)
                              :align-right? true
                              :on $ {}
                                :pointertap $ fn (e d!)
                                  let
                                      event $ -> e .-data .-originalEvent
                                    if
                                      or (.-metaKey event) (.-ctrlKey event)
                                      do
                                        d! :def-path $ [] (nth item 0) :defs (nth item 1)
                                        d! :router $ {} (:name :editor)
                                      d! :router $ {} (:name :deps-of)
                                        :data $ take item 2
                    create-list :container
                      {} $ :position ([] 320 -40)
                      -> internal-deps $ map-indexed
                        fn (idx item)
                          [] idx $ comp-button
                            {}
                              :text $ if
                                .starts-with? (nth item 0) pkg
                                str (nth item 0) "\"/" (nth item 1) "\"  " $ count
                                  get deps-tree $ take item 2
                                str (nth item 0) "\"/" $ nth item 1
                              :position $ [] 0 (* idx 40)
                              :align-right? false
                              :on $ {}
                                :pointertap $ fn (e d!)
                                  let
                                      event $ -> e .-data .-originalEvent
                                    if
                                      or (.-metaKey event) (.-ctrlKey event)
                                      do
                                        d! :def-path $ [] (nth item 0) :defs (nth item 1)
                                        d! :router $ {} (:name :editor)
                                      d! :router $ {} (:name :deps-of)
                                        :data $ take item 2
                text $ {}
                  :text $ str "\"not found: " entry
                  :position $ [] 1 1
                  :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.deps-of $ :require
            phlox.core :refer $ defcomp >> hslx hclx rect circle text container graphics create-list g polyline
            phlox.comp.button :refer $ comp-button
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            app.comp.deps-tree :refer $ comp-deps-tree
            app.analyze :refer $ lookup-target-def strip-at
            phlox.util :refer $ measure-text-width!
            app.comp.editor :refer $ comp-editor
            memof.once :refer $ memof1-call
    |app.comp.deps-tree $ %{} :FileEntry
      :defs $ {}
        |*defs-layout-stack $ %{} :CodeEntry (:doc |)
          :code $ quote
            defatom *defs-layout-stack $ {}
        |*defs-metrics-states $ %{} :CodeEntry (:doc |)
          :code $ quote
            defatom *defs-metrics-states $ {}
        |build-defs-metrics $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn build-defs-metrics (entry3 deps-tree depth pkg)
              let
                  entry $ take entry3 2
                  target $ get @*defs-metrics-states entry
                if
                  and (some? target)
                    ; >= depth $ :depth target
                  [] target
                  let
                      info $ get deps-tree entry
                      scoped-defs $ &let
                        it $ -> info
                          filter $ fn (item)
                            .starts-with? (first item) pkg
                        if (nil? it)
                          js/console.warn "\"failed building for:" entry3 info $ contains? deps-tree entry
                        or it $ []
                      thirdpart-defs $ -> info
                        filter $ fn (item)
                          .starts-with? (first item) pkg
                      partial-self $ &let
                        it $ {} (:depth depth)
                          :y $ new-def-stack-y-of depth
                            + 2 $ count scoped-defs
                          :scoped-defs scoped-defs
                          :thirdpart-defs thirdpart-defs
                          :entry entry3
                        swap! *defs-metrics-states assoc entry it
                        , it
                      children $ -> scoped-defs
                        filter $ fn (e)
                          not $ contains? @*defs-metrics-states e
                        mapcat $ fn (e)
                          build-defs-metrics e deps-tree (inc depth) pkg
                    concat ([] partial-self) children
        |calcit-def? $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn calcit-def? (item)
              or
                = :def $ nth item 2
                = :ns $ nth item 2
        |comp-deps-tree $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-deps-tree (deps-tree init-fn pkg)
              reset! *defs-layout-stack $ {}
              reset! *defs-metrics-states $ {}
              let
                  defs-metrics $ build-defs-metrics (.split init-fn "\"/") deps-tree 0 pkg
                  ; defs-metrics $ .to-list (.values @*defs-metrics-states)
                  connections $ -> defs-metrics
                    mapcat $ fn (info)
                      let
                          base $ expand-layout-xy info
                        -> (:scoped-defs info)
                          map-indexed $ fn (idx def-entry)
                            let
                                target $ get @*defs-metrics-states (take def-entry 2)
                              if
                                and
                                  empty? $ :scoped-defs target
                                  <= (:depth target) (:depth info)
                                , nil $ []
                                  complex/add base $ []
                                    + 8 $ measure-text-width! (str-def-entry def-entry pkg) 14 "\"Hind"
                                    + 10 $ * 20 (inc idx)
                                  complex/add (expand-layout-xy target) ([] 0 10)
                          filter $ fn (pair)
                            some? $ last pair
                ; js/console.log @*defs-metrics-states
                ; js/console.log "\"connection" connections
                container ({})
                  ; line-segments $ {}
                    :style $ {} (:width 1)
                      :color $ hslx 40 100 20
                      :alpha 1
                    :position $ [] 0 0
                    :segments connections
                  graphics $ {}
                    :ops $ concat &
                      -> connections $ map-indexed
                        fn (idx pair)
                          let
                              from $ nth pair 0
                              to $ nth pair 1
                            []
                              g :line-style $ {} (:width 2) (:alpha 1)
                                :color $ hclx
                                  .rem (* 37 idx) 360
                                  , 100 60
                              g :move-to from
                              g :bezier-to $ {}
                                :p1 $ complex/add from ([] 50 0)
                                :p2 $ complex/minus to ([] 50 0)
                                :to-p to
                  create-list :container ({})
                    -> defs-metrics $ map-indexed
                      fn (idx info)
                        [] idx $ let
                            position $ expand-layout-xy info
                          ; js/console.log $ :scoped-defs info
                          container ({})
                            rect $ {} (:position position)
                              :size $ []
                                measure-text-width!
                                  + 8 $ str-def-entry (:entry info) pkg
                                  , 14 "\"Hind"
                                , 20
                              :fill $ hslx 0 0 20
                            text $ {}
                              :text $ str-def-entry (:entry info) pkg
                              :position $ complex/add position ([] 4 0)
                              :style $ {}
                                :fill $ hslx 0 0 80
                                :font-size 14
                                :font-family |Hind
                            create-list :container ({})
                              -> (:scoped-defs info)
                                map-indexed $ fn (idx def-entry)
                                  [] idx $ container ({})
                                    rect $ {}
                                      :position $ complex/add position
                                        [] 0 $ * 20 (inc idx)
                                      :size $ []
                                        + 8 $ measure-text-width! (str-def-entry def-entry pkg) 14 "\"Hind"
                                        , 20
                                      :fill $ hslx 0 0 20
                                      :alpha 0.3
                                      :on $ {}
                                        :pointertap $ fn (e d!) (js/console.log e)
                                          when (-> e .-data .-originalEvent .-metaKey)
                                            d! :router $ {} (:name :editor)
                                            d! :def-path $ [] (nth def-entry 0) :defs (nth def-entry 1)
                                    text $ {}
                                      :text $ str-def-entry def-entry pkg
                                      :position $ complex/add position
                                        [] 4 $ * 20 (inc idx)
                                      :style $ {}
                                        :fill $ hslx 180 30 40
                                        :font-size 14
                                        :font-family |Hind
        |expand-layout-xy $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn expand-layout-xy (info)
              let
                  max-y $ get-def-stack-y-of (:depth info)
                []
                  * 320 $ :depth info
                  * 20 $ - (:y info) (* 0.4 max-y)
        |get-def-stack-y-of $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn get-def-stack-y-of (depth) (get @*defs-layout-stack depth)
        |new-def-stack-y-of $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn new-def-stack-y-of (depth size)
              let
                  dict @*defs-layout-stack
                if (contains? dict depth)
                  let
                      v $ get dict depth
                    swap! *defs-layout-stack update depth $ fn (x) (+ x size)
                    , v
                  do (swap! *defs-layout-stack assoc depth size) 0
        |str-def-entry $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn str-def-entry (pair pkg)
              let[] (ns def-name) pair $ if (.starts-with? ns pkg)
                str (.strip-prefix ns pkg) "\"/" def-name
                str ns "\"/" def-name
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.deps-tree $ :require
            phlox.core :refer $ defcomp >> hslx hclx rect circle text container graphics create-list g polyline line-segments
            phlox.comp.button :refer $ comp-button
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.comp.slider :refer $ comp-slider
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            phlox.util :refer $ measure-text-width!
    |app.comp.editor $ %{} :FileEntry
      :defs $ {}
        |all-block? $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn all-block? (item) (every? item list?)
        |base-dot $ %{} :CodeEntry (:doc |)
          :code $ quote
            def base-dot $ {} (:radius dot-radius) (:alpha 1)
              :position $ [] 0 0
        |char-keymap $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn char-keymap (key)
              case-default key key ("\":" "\";") ("\";" "\":") ("\"\\" "\"|") ("\"|" "\"\\")
        |comp-editor $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-editor (entry focus def-path pkg)
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
                        and
                          not $ and (:meta? e)
                            = "\"Tab" $ :key e
                          identical? js/document.body $ .-target (:event e)
                        let
                            target $ get-in entry
                              concat ([] :code 1) focus
                          cond
                              list? target
                              handle-expr-event focus def-path (dissoc e :event) d!
                            (string? target)
                              handle-leaf-event focus def-path target (dissoc e :event) d!
                            (nil? nil) nil
                            true $ js/console.error "\"unknown target" target
                :tree $ let
                    item $ nth (:code entry) 1
                  cond
                      nil? item
                      , nil
                    (string? item)
                      wrap-leaf item ([]) focus false
                    (is-linear? item)
                      wrap-linear-expr item ([]) focus false
                    (with-linear? item)
                      wrap-expr-with-linear item ([]) focus true false 0
                    true $ wrap-block-expr item ([]) focus
                ; comp-hint (>> states :hint) focus $ get-in tree focus
        |comp-error $ %{} :CodeEntry (:doc |)
          :code $ quote
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
        |handle-expr-event $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn handle-expr-event (focus def-path e d!)
              let
                  key $ :key e
                  code $ :key-code e
                  meta? $ or (:meta? e) (:ctrl? e)
                  shift? $ :shift? e
                cond
                    = "\"Backspace" key
                    d! :call-cirru-edit $ [] :remove-node focus
                  (= key "\"ArrowUp")
                    d! :call-cirru-edit $ [] :node-up focus
                  (= key "\"ArrowLeft")
                    d! :call-cirru-edit $ [] :node-left focus
                  (= key "\"ArrowRight")
                    d! :call-cirru-edit $ [] :node-right focus
                  (= key "\"ArrowDown")
                    d! :call-cirru-edit $ [] :expression-down focus
                  (= key "\"Enter")
                    if meta?
                      if shift?
                        d! :call-cirru-edit $ [] :append-expression focus
                        d! :call-cirru-edit $ [] :prepend-expression focus
                      if shift?
                        d! :call-cirru-edit $ [] :before-expression focus
                        d! :call-cirru-edit $ [] :after-expression focus
                  (= key "\" ")
                    if shift?
                      d! :call-cirru-edit $ [] :before-token focus
                      d! :call-cirru-edit $ [] :after-token focus
                  (= "\"Tab" key)
                    if shift?
                      d! :call-cirru-edit $ [] :unfold-expression focus
                      d! :call-cirru-edit $ [] :fold-node focus
                  (and meta? (= "\"b" key))
                    d! :call-cirru-edit $ [] :duplicate-expression focus
                  (and meta? (= "\"c" key))
                    d! :call-cirru-edit $ [] :command-copy focus
                  (and meta? (= "\"x" key))
                    d! :call-cirru-edit $ [] :command-cut focus
                  (and meta? (= "\"v" key))
                    d! :call-cirru-edit $ [] :command-paste focus
                  (and meta? (= "\"e" key))
                    d! :def-path $ w-log
                      [] (first def-path) :ns
                  true $ do (;nil js/console.log "\"unknown event:" e)
        |handle-leaf-event $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn handle-leaf-event (focus def-path token e d!)
              let
                  key $ :key e
                  code $ :key-code e
                  meta? $ or (:meta? e) (:ctrl? e)
                  shift? $ :shift? e
                cond
                    = "\"Backspace" key
                    if
                      or meta? $ empty? token
                      d! :call-cirru-edit $ [] :remove-node focus
                      d! :call-cirru-edit $ [] :update-token
                        [] focus $ .!slice token 0
                          dec $ count token
                  (and (>= code 65) (<= code 90) (not meta?))
                    d! :call-cirru-edit $ [] :update-token
                      [] focus $ str token key
                  (= key "\"ArrowUp")
                    d! :call-cirru-edit $ [] :node-up focus
                  (= key "\"ArrowLeft")
                    d! :call-cirru-edit $ [] :node-left focus
                  (= key "\"ArrowRight")
                    d! :call-cirru-edit $ [] :node-right focus
                  (= key "\"ArrowDown") (js/console.warn "\"unknown keydown")
                  (= key "\"Enter")
                    if shift?
                      d! :call-cirru-edit $ [] :before-token focus
                      d! :call-cirru-edit $ [] :after-after focus
                  (= key "\" ")
                    if shift?
                      d! :call-cirru-edit $ [] :update-token
                        [] focus $ str token "\" "
                      d! :call-cirru-edit $ [] :after-token focus
                  (= "\"Tab" key)
                    if shift?
                      d! :call-cirru-edit $ [] :unfold-token focus
                      d! :call-cirru-edit $ [] :fold-node focus
                  (= key "\"d")
                    d! :effect-goto-def $ strip-at token
                  (and meta? (= "\"v" key))
                    d! :call-cirru-edit $ [] :command-paste focus
                  (and meta? (= "\"e" key))
                    d! :def-path $ w-log
                      [] (first def-path) :ns
                  (and (= 1 (count key)) (not meta?))
                    d! :call-cirru-edit $ [] :update-token
                      [] focus $ str token (char-keymap key)
                  true $ do (;nil js/console.warn "\"unknown event:" e)
        |is-linear? $ %{} :CodeEntry (:doc |)
          :code $ quote
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
        |on-expr-click $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn on-expr-click (e code coord d!)
              let
                  event $ -> e .-data .-originalEvent
                if
                  or (.-metaKey event) (.-ctrlKey event)
                  prompt-at!
                    &let
                      pos $ -> e .-data .-global
                      [] (.-x pos) (.-y pos)
                    {} (:textarea? true)
                      :initial $ format-cirru ([] code)
                      :style $ {} (:font-family code-font)
                    fn (content)
                      d! :cirru-edit-node $ [] coord
                        first $ parse-cirru-list content
                  d! :focus-or-pick coord
        |pattern-number $ %{} :CodeEntry (:doc |)
          :code $ quote
            def pattern-number $ new js/RegExp "\"^-?\\d+(\\.\\d+)?$"
        |pick-leaf-color $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn pick-leaf-color (s head?)
              cond
                  or (= s "\"true") (= s "\"false") (= s "\"nil") (= s "\";") (= s "\"&")
                  hslx 300 100 33
                (= "\"" s) (hslx 190 50 50)
                (= "\"\"" (get s 0))
                  hslx 70 50 40
                (= "\"|" (nth s 0))
                  hslx 70 50 40
                (= "\":" (nth s 0))
                  hslx 240 90 74
                (= "\"." (nth s 0))
                  hslx 100 100 70
                (.!test pattern-number s) (hslx 330 100 40)
                head? $ hslx 160 70 76
                true $ hslx 190 50 50
        |shape-focus $ %{} :CodeEntry (:doc |)
          :code $ quote
            def shape-focus $ circle
              {}
                :radius $ + dot-radius 2
                :position $ [] 0 0
                :line-style $ {} (:width 1)
                  :color $ hslx 60 80 80
                  :alpha 0.8
        |style-active-line $ %{} :CodeEntry (:doc |)
          :code $ quote
            def style-active-line $ {} (:width 2) (:alpha 1)
              :color $ hslx 20 100 70
        |style-shadow-line $ %{} :CodeEntry (:doc |)
          :code $ quote
            def style-shadow-line $ {} (:width 1) (:alpha 0.7)
              :color $ hslx 200 70 54
        |with-linear? $ %{} :CodeEntry (:doc |)
          :code $ quote
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
        |wrap-block-expr $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                    :tree $ let
                        focused? $ = coord focus
                      container ({})
                        polyline $ {}
                          :style $ if focused? style-active-line style-shadow-line
                          :position $ [] 0 0
                          :points $ [] ([] 0 0) ([] leaf-gap 0)
                            [] leaf-gap $ * line-height
                              &max 0 $ dec y-stack
                        rect $ {} (:angle 45)
                          :size $ [] (* 2 dot-radius) (* 2 dot-radius)
                          :pivot $ [] dot-radius dot-radius
                          :alpha 1
                          :fill $ hslx 120 100 70
                          :on $ {}
                            :pointertap $ fn (e d!) (on-expr-click e xs coord d!)
                        if focused? shape-focus
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
                              [] (+ leaf-gap offset)
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
                          (is-linear? item) (wrap-linear-expr item next-coord focus false)
                          (and (with-linear? item) (not (all-block? item)))
                            wrap-expr-with-linear item next-coord focus true false 0
                          true $ wrap-block-expr item next-coord focus
                        width $ :width info
                        tree $ :tree info
                        next-y-stack $ if
                          some? $ :winding-x info
                          if
                            >
                              either (:winding-x info) 0
                              + leaf-gap prev-width
                            , y-stack $ inc y-stack
                          , y-stack
                      recur
                        conj acc $ [] idx
                          container
                            {} $ :position
                              [] leaf-gap $ * next-y-stack line-height
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
        |wrap-expr-with-linear $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wrap-expr-with-linear (xs coord focus parent-winding-okay? smaller? acc-x)
              loop
                  acc $ []
                  ys xs
                  x-position leaf-gap
                  y-stack 1
                  y-stack-max 1
                  y-stack-extend-x 0
                  idx 0
                  winding-okay? parent-winding-okay?
                  winding-x nil
                if (empty? ys)
                  {}
                    :tree $ let
                        focused? $ = coord focus
                      container ({})
                        polyline $ {}
                          :style $ if focused? style-active-line style-shadow-line
                          :position $ [] 0 0
                          :points $ [] ([] 0 0) ([] x-position 0)
                        if (not smaller?)
                          circle $ merge base-dot
                            {}
                              :fill $ hslx 10 60 50
                              :on $ {}
                                :pointertap $ fn (e d!) (on-expr-click e xs coord d!)
                        if
                          and focused? $ not smaller?
                          , shape-focus
                        create-list :container ({}) (reverse acc)
                    :width x-position
                    :y-stack y-stack-max
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
                            + x-position width leaf-gap
                            if
                              > (+ x-position width leaf-gap) y-stack-extend-x
                              , 1 y-stack
                            , y-stack-max y-stack-extend-x (inc idx) winding-okay? winding-x
                      (and winding-okay? (is-linear? item) (not= 1 (count ys)))
                        let
                            focused? $ = next-coord focus
                            info $ wrap-linear-expr item next-coord focus true
                            width $ :width info
                          recur
                            conj acc $ [] idx
                              container
                                {} $ :position ([] x-position 0)
                                polyline $ {}
                                  :style $ if focused? style-active-line style-shadow-line
                                  :position $ [] 0 0
                                  :points $ [] ([] 0 0)
                                    [] 0 $ * -1 line-height
                                circle $ merge base-dot
                                  {}
                                    :fill $ hslx 180 60 40
                                    :on $ {}
                                      :pointertap $ fn (e d!) (on-expr-click e item next-coord d!)
                                if focused? shape-focus
                                container
                                  {} $ :position
                                    [] 0 $ * -1 line-height
                                  :tree info
                            rest ys
                            + x-position leaf-gap
                            , y-stack y-stack-max
                              &max y-stack-extend-x $ + x-position (:width info)
                              inc idx
                              , false x-position
                      (and (is-linear? item) (not= 1 (count ys)))
                        let
                            focused? $ = next-coord focus
                            info $ wrap-linear-expr item next-coord focus true
                            width $ :width info
                          recur
                            conj acc $ [] idx
                              container
                                {} $ :position ([] x-position 0)
                                polyline $ {}
                                  :style $ if focused? style-active-line style-shadow-line
                                  :position $ [] 0 0
                                  :points $ [] ([] 0 0)
                                    [] 0 $ * y-stack line-height
                                circle $ merge base-dot
                                  {}
                                    :fill $ hslx 160 100 30
                                    :on $ {}
                                      :pointertap $ fn (e d!) (on-expr-click e item next-coord d!)
                                if (= next-coord focus) shape-focus
                                container
                                  {} $ :position
                                    [] 0 $ * y-stack line-height
                                  :tree info
                            rest ys
                            + x-position leaf-gap
                            inc y-stack
                            &max y-stack-max $ inc y-stack
                            &max y-stack-extend-x $ + x-position leaf-gap (:width info)
                            inc idx
                            , false winding-x
                      (and (= 1 (count ys)) (and (> y-stack 1) (is-linear? item)))
                        let
                            info $ wrap-linear-expr item next-coord focus false
                            width $ :width info
                          recur
                            conj acc $ [] idx
                              container
                                {} $ :position ([] x-position 0)
                                :tree info
                            rest ys
                            + x-position width leaf-gap
                            &max y-stack $ :y-stack info
                            &max y-stack-max $ &max y-stack (:y-stack info)
                            , y-stack-extend-x (inc idx) winding-okay? winding-x
                      (and (= 1 (count ys)) (&= y-stack 1))
                        let
                            info $ cond
                                is-linear? item
                                wrap-linear-expr item next-coord focus false
                              (and (with-linear? item) (not (all-block? item)))
                                wrap-expr-with-linear item next-coord focus winding-okay? false $ + acc-x x-position
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
                            &max y-stack-max $ &max y-stack (:y-stack info)
                            , y-stack-extend-x (inc idx) winding-okay? $ either winding-x
                              if-let
                                x $ :winding-x info
                                + x-position x
                      (and (> acc-x twist-distance) (= 1 (count ys)))
                        let
                            info $ cond
                                and (with-linear? item)
                                  not $ all-block? item
                                wrap-expr-with-linear item next-coord focus winding-okay? true $ + acc-x x-position (negate twist-distance)
                              true $ wrap-block-expr item next-coord focus
                            width $ :width info
                          recur
                            conj acc $ [] idx
                              let
                                  focused? $ = next-coord focus
                                container
                                  {} $ :position ([] x-position 0)
                                  polyline $ {}
                                    :style $ if focused? style-active-line style-shadow-line
                                    :position $ [] 0 0
                                    :points $ [] ([] 0 0)
                                      [] 0 $ * y-stack line-height
                                      [] (negate twist-distance) (* y-stack line-height)
                                      [] (negate twist-distance)
                                        * (inc y-stack) line-height
                                  circle $ merge base-dot
                                    {}
                                      :fill $ hslx 300 100 30
                                      :on $ {}
                                        :pointertap $ fn (e d!) (on-expr-click e item next-coord d!)
                                  if focused? shape-focus
                                  container
                                    {} $ :position
                                      [] (negate twist-distance)
                                        * (inc y-stack) line-height
                                    :tree info
                            rest ys
                            + x-position width leaf-gap
                            + y-stack (:y-stack info) 1
                            &max y-stack-max $ inc
                              + y-stack $ :y-stack info
                            , y-stack-extend-x (inc idx) winding-okay? winding-x
                      (= 1 (count ys))
                        let
                            info $ cond
                                and (with-linear? item)
                                  not $ all-block? item
                                wrap-expr-with-linear item next-coord focus winding-okay? true $ + acc-x x-position
                              true $ assoc (wrap-block-expr item next-coord focus) :width 0
                            width $ :width info
                          recur
                            conj acc $ [] idx
                              let
                                  focused? $ = next-coord focus
                                container
                                  {} $ :position ([] x-position 0)
                                  polyline $ {}
                                    :style $ if focused? style-active-line style-shadow-line
                                    :position $ [] 0 0
                                    :points $ [] ([] 0 0)
                                      [] 0 $ * y-stack line-height
                                  circle $ merge base-dot
                                    {}
                                      :fill $ hslx 300 100 30
                                      :on $ {}
                                        :pointertap $ fn (e d!) (on-expr-click e item next-coord d!)
                                  if focused? shape-focus
                                  container
                                    {} $ :position
                                      [] 0 $ * y-stack line-height
                                    :tree info
                            rest ys
                            + x-position width leaf-gap
                            + y-stack $ :y-stack info
                            &max y-stack-max $ + y-stack (:y-stack info)
                            , y-stack-extend-x (inc idx) winding-okay? winding-x
                      true $ {}
                        :tree $ create-list :container ({})
                          conj acc $ [] idx (comp-error ys)
                        :width x-position
                        :y-stack y-stack
        |wrap-leaf $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wrap-leaf (s coord focus head?)
              let
                  width $ measure-text-width! s 14 "|Roboto Mono"
                  height leaf-height
                {}
                  :tree $ container
                    {} $ :position ([] -4 0)
                    rect $ {} (:alpha 0.8)
                      :position $ [] 0 (* -0.5 height)
                      :size $ [] (+ width 8) height
                      :fill $ hslx 190 70 10
                      :line-style $ {} (:width 1) (:alpha 0.2)
                        :color $ hslx 60 80 100
                      :on $ {}
                        :pointertap $ fn (e d!)
                          let
                              event $ -> e .-data .-originalEvent
                            if
                              or (.-metaKey event) (.-ctrlKey event)
                              prompt-at!
                                &let
                                  pos $ -> e .-data .-global
                                  [] (.-x pos) (.-y pos)
                                {} (:initial s)
                                  :style $ {} (:font-family code-font)
                                fn (content)
                                  d! :cirru-edit-node $ [] coord content
                              d! :focus-or-pick coord
                    if (= coord focus)
                      rect $ {}
                        :position $ [] 0 (* -0.5 height)
                        :size $ [] (+ width 8) height
                        :alpha 0.8
                        :line-style $ {} (:width 1)
                          :color $ hslx 60 80 80
                          :alpha 0.8
                    text $ {} (:text s)
                      :position $ [] 4 -8
                      :style $ {}
                        :fill $ pick-leaf-color s head?
                        :font-size 14
                        :font-family "|Roboto Mono"
                  :width width
                  :y-stack 1
                  :winding-x nil
        |wrap-linear-expr $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn wrap-linear-expr (xs coord focus smaller?)
              loop
                  acc $ []
                  ys xs
                  x-position leaf-gap
                  y-stack 1
                  idx 0
                if (empty? ys)
                  {}
                    :tree $ let
                        focused? $ = coord focus
                      container ({})
                        polyline $ {}
                          :style $ if focused? style-active-line style-shadow-line
                          :position $ [] 0 0
                          :points $ [] ([] 0 0) ([] x-position 0)
                        if (not smaller?)
                          circle $ merge base-dot
                            {}
                              :fill $ hslx 260 80 60
                              :on $ {}
                                :pointertap $ fn (e d!) (on-expr-click e xs coord d!)
                        if
                          and focused? $ not smaller?
                          , shape-focus
                        create-list :container ({}) acc
                    :width x-position
                    :y-stack y-stack
                  let
                      item $ first ys
                      next-coord $ conj coord idx
                      info $ cond
                          string? item
                          wrap-leaf item next-coord focus $ = idx 0
                        (is-linear? item) (wrap-linear-expr item next-coord focus false)
                        true $ comp-error item
                      width $ :width info
                      tree $ :tree info
                    recur
                      conj acc $ [] idx
                        container
                          {} $ :position ([] x-position 0)
                          , tree
                      rest ys
                      + x-position width leaf-gap
                      &max y-stack $ :y-stack info
                      inc idx
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.editor $ :require
            phlox.core :refer $ defcomp >> hslx rect circle text container graphics create-list g polyline
            phlox.comp.button :refer $ comp-button
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.comp.slider :refer $ comp-slider
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            app.comp.deps-tree :refer $ comp-deps-tree
            app.analyze :refer $ lookup-target-def strip-at
            phlox.util :refer $ measure-text-width!
    |app.comp.key-event $ %{} :FileEntry
      :defs $ {}
        |comp-key-event $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-key-event (on-event)
              [] (effect-listen-keyboard)
                span $ {}
                  :on-keydown $ fn (e d!) (on-event e d!)
        |effect-listen-keyboard $ %{} :CodeEntry (:doc |)
          :code $ quote
            defeffect effect-listen-keyboard () (action el at?)
              let
                  handler $ or (aget el "\"_dirtyEventListener")
                    fn (event)
                      if
                        and
                          or
                            = "\"p" $ .-key event
                            = "\"s" $ .-key event
                            = "\"d" $ .-key event
                            = "\"i" $ .-key event
                          or (.-ctrlKey event) (.-metaKey event)
                        .!preventDefault event
                      .!dispatchEvent el $ new js/KeyboardEvent (.-type event) event
                aset el "\"_dirtyEventListener" handler
                case-default action nil
                  :mount $ js/window.addEventListener "\"keydown" handler
                  :unmount $ js/window.removeEventListener "\"keydown" handler
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.key-event $ :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ =<
            app.config :refer $ dev? api-host
    |app.comp.nav $ %{} :FileEntry
      :defs $ {}
        |comp-files-entry $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-files-entry (cursor state files on-close)
              div
                {} $ :class-name (str-spaced css/expand css/row)
                list->
                  {} $ :class-name css/expand
                  -> (keys files) .to-list sort $ map
                    fn (ns)
                      [] ns $ div
                        {} (:class-name css-hover-entry)
                          :style $ merge
                            if
                              = ns $ :ns state
                              {} $ :background-color (hsl 0 0 100 0.3)
                          :on-click $ fn (e d!)
                            d! cursor $ assoc state :ns ns
                        <> ns
                =< 8 nil
                if-let
                  ns $ :ns state
                  if-let
                    file $ get files ns
                    div
                      {} $ :class-name css/expand
                      div
                        {}
                          :style $ {} (:cursor :pointer)
                          :on-click $ fn (e d!)
                            d! :def-path $ [] ns :ns
                        <> ns $ {} (:font-family ui/font-code)
                      =< nil 8
                      list-> ({})
                        -> files (get ns) (get :defs) keys .to-list sort $ map
                          fn (def-name)
                            [] def-name $ div
                              {} (:class-name css-hover-entry)
                                :style $ merge
                                  {} (:font-family ui/font-code) (:cursor :pointer) (:line-height 2) (:padding "\"0 8px")
                                :on-click $ fn (e d!)
                                  d! :def-path $ [] ns :defs def-name
                                  on-close d!
                              <> def-name
        |comp-menu $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-menu (states files def-path on-close)
              let
                  cursor $ :cursor states
                  state $ or (:data states)
                    {} (:ns nil) (:query "\"") (:select-idx 0)
                  queries $ .split (:query state) "\" "
                  all-entries $ -> files .to-list
                    mapcat $ fn (entry)
                      let[] (ns file) entry $ flipped prepend ([] ns :ns)
                        -> (:defs file) keys .to-list $ .map
                          fn (def-name) ([] ns :defs def-name)
                  def-entries $ -> all-entries
                    filter $ fn (entry)
                      and
                        = :defs $ nth entry 1
                        every? queries $ fn (x)
                          .includes? (nth entry 2) x
                  ns-entries $ -> all-entries
                    filter $ fn (entry)
                      and
                        = :ns $ nth entry 1
                        every? queries $ fn (x)
                          .includes? (nth entry 0) x
                  entries $ concat def-entries ns-entries
                [] (effect-focus "\"#query-box")
                  div
                    {} $ :class-name (str-spaced css/column css-menu)
                    div
                      {} $ :class-name css/row-parted
                      input $ {} (:id "\"query-box") (:class-name css-query-box)
                        :value $ :query state
                        :on-input $ fn (e d!)
                          d! cursor $ assoc state :query (:value e) :select-idx 0
                        :autofocus true
                        :autocomplete "\"off"
                        :on-keydown $ fn (e d!)
                          case-default (:key e) (;nil js/console.log e)
                            "\"ArrowDown" $ d! cursor
                              update state :select-idx $ fn (idx)
                                if
                                  >= (inc idx) (count entries)
                                  , idx $ inc idx
                            "\"ArrowUp" $ d! cursor
                              update state :select-idx $ fn (idx)
                                if (> idx 0) (dec idx) 0
                            "\"Enter" $ if-let
                              target $ get entries (:select-idx state)
                              do (d! :def-path target) (on-close d!)
                                d! cursor $ assoc state :query "\""
                            "\"Escape" $ on-close d!
                      a $ {} (:inner-text "\"×")
                        :style $ merge ui/link
                          {} (:font-size 24) (:font-weight 100) (:text-decoration :none)
                            :color $ hsl 0 100 30
                        :on-click $ fn (e d!) (on-close d!)
                    =< nil 8
                    if
                      blank? $ :query state
                      comp-files-entry cursor state files on-close
                      comp-search-entry cursor state entries (:select-idx state)
                        fn (idx d!)
                          d! cursor $ assoc state :select-idx idx
                        , on-close
        |comp-navbar $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-navbar (store states)
              let
                  cursor $ :cursor states
                  state $ or (:data states)
                    {} $ :menu? true
                  ; command-plugin $ use-prompt (>> states :command)
                    {} (:text "\"command")
                      :input-style $ {} (:font-family ui/font-code)
                  command-plugin $ use-modal (>> states :command-modal)
                    {}
                      :style $ {} (:max-width "\"80vw")
                      :container-style $ {}
                      :backdrop-style $ {}
                      :render $ fn (on-close)
                        comp-command (>> states :command) store on-close
                  editor $ :editor store
                  router $ :router store
                  def-path $ get-in editor
                    [] :stack $ :pointer editor
                div ({})
                  div
                    {} $ :class-name (str-spaced css/row-parted css-navbar)
                    span $ {} (:class-name css-hover-entry)
                      :style $ {} (:cursor :pointer) (:padding "\"4px 8px") (:font-family "\"Josefin Sans")
                        :color $ hsl 200 80 70
                      :inner-text "\"Hovernia"
                      :on-click $ fn (e d!)
                        d! cursor $ assoc state :menu? true
                        d! :router $ {} (:name :editor)
                        .!preventDefault $ :event e
                    div ({})
                      if
                        not $ identical? (:files store) (:saved-files store)
                        a $ {} (:inner-text "\"Save")
                          :class-name $ str-spaced css/link css/font-fancy
                          :on-click $ fn (e d!)
                            on-save (:files store) (:saved-files store) d!
                      =< 8 nil
                      a $ {} (:inner-text "\"Command")
                        :class-name $ str-spaced css/link css/font-fancy
                        :on-click $ fn (e d!) (.show command-plugin d!)
                  if (:menu? state)
                    memof1-call comp-menu (>> states :menu) (:files store) def-path $ fn (d!)
                      d! cursor $ assoc state :menu? false
                  if
                    not $ blank? (:warning store)
                    div
                      {} $ :class-name (str-spaced css/row-middle css-notice-area)
                      div
                        {} (:style style-error)
                          :on-click $ fn (e d!) (d! :warn nil)
                        <> $ :warning store
                      =< 16 nil
                      a $ {} (:class-name css/link) (:inner-text "\"Try 6011")
                        :on-click $ fn (e d!) (load-files! d! true)
                  if
                    and
                      = :editor $ :name router
                      not $ :menu? state
                    comp-stack (:stack editor) (:pointer editor) (:package store)
                  if (:picker-mode? editor) (comp-picker-mode)
                  comp-key-event $ fn (e d!)
                    cond
                        and
                          or (:meta? e) (:ctrl? e)
                          = "\"p" $ :key e
                        if (:shift? e) (.show command-plugin d!)
                          d! cursor $ update state :menu? not
                      (and (or (:meta? e) (:ctrl? e)) (= "\"s" (:key e)))
                        on-save (:files store) (:saved-files store) d!
                      true nil
                  .render command-plugin
        |comp-picker-mode $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-picker-mode () $ div
              {} (:title "\"Click to disable")
                :style $ {} (:position :absolute) (:top 16) (:left 16) (:font-size 20) (:padding "\"8px 16px") (:font-family ui/font-fancy) (:border-radius "\"8px") (:cursor :pointer)
                  :border $ str "\"2px solid " (hsl 180 30 60)
                  :background-color $ hsl 120 80 80 0.8
                :on-click $ fn (e d!) (d! :picker-mode false)
              <> "\"Picker Mode"
              comp-key-event $ fn (e d!)
                if
                  = "\"Escape" $ :key e
                  d! :picker-mode false
        |comp-search-entry $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-search-entry (cursor state entries selected-idx on-select on-close)
              let () $ list->
                {} $ :style (merge ui/expand)
                -> entries $ map-indexed
                  fn (idx entry)
                    [] (str entry)
                      div
                        {} (:class-name css-hover-entry)
                          :style $ merge
                            {} (:line-height 2) (:font-family ui/font-code) (:cursor :pointer) (:padding "\"0 8px")
                            if (= idx selected-idx)
                              {} $ :background-color (hsl 0 0 100 0.3)
                          :on-click $ fn (e d!) (d! :def-path entry) (on-close d!)
                            d! cursor $ assoc state :query "\""
                        if
                          = 2 $ count entry
                          <> $ str (first entry) "\" :ns"
                          div ({})
                            <> $ last entry
                            =< 8 nil
                            <> (first entry)
                              {} (:font-size 10)
                                :color $ hsl 0 0 70
        |css-menu $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-menu $ {}
              "\"&" $ {} (:position :absolute) (:top 0) (:left 0) (:width 480) (:height "\"88vh") ("\"×" 100) (:backdrop-filter "\"blur(1.5px)") (:border-radius "\"6px") (:padding 8) (:border-width "\"0 1px 1px 0") (:z-index 100)
                :border $ str "\"1px solid " (hsl 0 0 30)
                :background-color $ hsl 0 0 20 0.4
        |css-navbar $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-navbar $ {}
              "\"&" $ {} (:padding "\"0px 8px") (:position :absolute) (:top 16) (:left 0) (:width "\"100%") (:height 0)
        |css-notice-area $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-notice-area $ {}
              "\"&" $ {} (:position :fixed) (:bottom 0) (:left 0) (:font-size 14) (:font-family ui/font-code) (:padding "\"8px 16px")
                :background-color $ hsl 0 0 0 0.7
        |css-query-box $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-query-box $ {}
              "\"&" $ merge ui/input
                {} (:background-color :transparent) (:font-family ui/font-code) (:color :white)
        |effect-focus $ %{} :CodeEntry (:doc |)
          :code $ quote
            defeffect effect-focus (query) (action el at?)
              .!select $ js/document.querySelector query
        |style-error $ %{} :CodeEntry (:doc |)
          :code $ quote
            def style-error $ {}
              :color $ hsl 0 90 70
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.nav $ :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ =<
            app.config :refer $ dev? api-host
            app.widget :as widget
            respo-alerts.core :refer $ use-prompt use-modal
            app.comp.key-event :refer $ comp-key-event
            app.fetch :refer $ load-files!
            app.comp.stack :refer $ comp-stack
            app.style :refer $ css-hover-entry
            app.comp.command :refer $ comp-command on-save run-command
            memof.once :refer $ memof1-call
            respo.css :refer $ defstyle
            respo-ui.css :as css
    |app.comp.stack $ %{} :FileEntry
      :defs $ {}
        |comp-stack $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-stack (stack pointer pkg)
              div ({})
                list->
                  {} $ :style
                    merge ui/column $ {} (:position :absolute) (:opacity 0.8) (:top 32) (:left 8) (:z-index 0) (:align-items :flex-start) (:user-select :none)
                  -> stack $ map-indexed
                    fn (idx frame)
                      [] idx $ div
                        {} (:class-name css-hover-entry)
                          :on-click $ fn (e d!) (d! :stack-pointer idx)
                          :style $ merge
                            {} (:cursor :pointer) (:padding "\"4px 8px") (:border-radius "\"6px")
                            if (= idx pointer)
                              {} $ :background-color (hsl 0 0 30)
                        case-default (nth frame 1)
                          <> (str "\"Err: " frame)
                            {} $ :color :red
                          :ns $ <>
                            str $ nth frame 0
                          :defs $ div
                            {} $ :style (merge ui/column)
                            <>
                              str (nth frame 0) "\"/"
                              {} (:font-size 10) (:line-height 1)
                                :color $ hsl 0 0 60
                            div ({})
                              <> (nth frame 2)
                                {} $ :color (hsl 0 0 100)
                comp-key-event $ fn (e d!)
                  cond
                      and
                        or (:meta? e) (:ctrl? e)
                        = "\"k" $ :key e
                      d! :pointer-shrink pointer
                    (and (or (:meta? e) (:ctrl? e)) (= "\"j" (:key e)))
                      d! :pointer-down pointer
                    (and (or (:meta? e) (:ctrl? e)) (= "\"i" (:key e)))
                      d! :pointer-up pointer
                    true nil
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.comp.stack $ :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ =<
            app.widget :as widget
            app.comp.key-event :refer $ comp-key-event
            app.analyze :refer $ analyze-deps
            app.style :refer $ css-hover-entry
    |app.config $ %{} :FileEntry
      :defs $ {}
        |api-host $ %{} :CodeEntry (:doc |)
          :code $ quote
            def api-host $ str "\"http://" (get-env "\"host" "\"localhost") "\":" (get-env "\"port" "\"6101")
        |api-host-6011 $ %{} :CodeEntry (:doc |)
          :code $ quote
            def api-host-6011 $ str "\"http://" (get-env "\"host" "\"localhost") "\":" (get-env "\"port" "\"6011")
        |code-font $ %{} :CodeEntry (:doc |)
          :code $ quote (def code-font "\"Roboto Mono, monospace")
        |cors-headers $ %{} :CodeEntry (:doc |)
          :code $ quote
            def cors-headers $ {} (:Content-Type "\"data/cirru-edn") (:Access-Control-Allow-Origin "\"*") (:Access-Control-Allow-Methods "\"*")
        |dot-radius $ %{} :CodeEntry (:doc |)
          :code $ quote (def dot-radius 4)
        |leaf-gap $ %{} :CodeEntry (:doc |)
          :code $ quote (def leaf-gap 16)
        |leaf-height $ %{} :CodeEntry (:doc |)
          :code $ quote (def leaf-height 24)
        |line-height $ %{} :CodeEntry (:doc |)
          :code $ quote (def line-height 32)
        |mocked? $ %{} :CodeEntry (:doc |)
          :code $ quote
            def mocked? $ &= "\"true" (get-env "\"mocked" "\"false")
        |site $ %{} :CodeEntry (:doc |)
          :code $ quote
            def site $ {} (:title "\"Phlox") (:icon "\"http://cdn.tiye.me/logo/quamolit.png") (:storage-key "\"phlox-workflow")
        |twist-distance $ %{} :CodeEntry (:doc |)
          :code $ quote
            def twist-distance $ * 0.8 js/window.innerWidth
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.config $ :require ("\"mobile-detect" :default mobile-detect)
    |app.container $ %{} :FileEntry
      :defs $ {}
        |comp-container $ %{} :CodeEntry (:doc |)
          :code $ quote
            defcomp comp-container (store)
              let
                  states $ :states store
                  cursor $ []
                  state $ or (:data states)
                    {} (:selected-ns nil) (:def-target nil)
                  editor $ :editor store
                  focus $ :focus editor
                  files $ :files store
                  router $ :router store
                case-default (:name router)
                  text $ {}
                    :text $ str "\"Unknown router: " router
                    :position $ [] 1 1
                    :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                  :editor $ let
                      def-path $ either
                        get-in editor $ [] :stack (:pointer editor)
                        []
                      entry $ if-not (empty? def-path) (get-in files def-path)
                    if (nil? entry)
                      text $ {} (:text "\"No code selected")
                        :position $ [] -60 0
                        :style $ {} (:fill 0x66aaaa) (:font-size 20) (:font-family "|Josefin Sans")
                      memof1-call comp-editor entry focus def-path $ :package store
                  :deps-tree $ if
                    nil? $ :deps-tree store
                    text $ {} (:text "\"tree is empty")
                      :position $ [] 1 1
                      :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                    comp-deps-tree (:deps-tree store) (-> store :configs :init-fn) (:package store)
                  :deps-of $ if
                    nil? $ :deps-tree store
                    text $ {} (:text "\"tree is empty")
                      :position $ [] 1 1
                      :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                    comp-deps-of (:deps-tree store) (:data router) (:package store)
                  :call-tree $ if
                    nil? $ :deps-tree store
                    text $ {} (:text "\"tree is empty")
                      :position $ [] 1 1
                      :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                    comp-call-tree (>> states :call-tree) (:deps-tree store) (:data router) (:package store)
        |comp-hint $ %{} :CodeEntry (:doc |)
          :code $ quote
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
        |turn-quoted $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn turn-quoted (target)
              if (string? target) (turn-symbol target) (map target turn-quoted)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.container $ :require
            phlox.core :refer $ defcomp >> hslx rect circle text container graphics create-list g polyline
            phlox.comp.button :refer $ comp-button
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.comp.slider :refer $ comp-slider
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            app.comp.deps-tree :refer $ comp-deps-tree
            app.analyze :refer $ lookup-target-def strip-at
            phlox.util :refer $ measure-text-width!
            app.comp.editor :refer $ comp-editor
            memof.once :refer $ memof1-call
            app.comp.deps-of :refer $ comp-deps-of
            app.comp.call-tree :refer $ comp-call-tree
    |app.fetch $ %{} :FileEntry
      :defs $ {}
        |load-files! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn load-files! (d! ? shared-editor?)
              ->
                if mocked? "\"//cors.cirru.org/compact.cirru" $ str (if shared-editor? api-host-6011 api-host) "\"/compact-data"
                js/fetch
                .!then $ fn (res) (.!text res)
                .!then $ fn (text)
                  let
                      compact-files $ parse-cirru-edn text
                        {} (:CodeEntry schema/CodeEntry) (:FileEntry schema/FileEntry)
                    if (some? compact-files)
                      do
                        d! $ :: :load-files (transform-cirru-quoted compact-files)
                        d! $ :: :ok
                      do (js/console.log "\"unknown data:" compact-files)
                        d! $ :: :warn "\"unknown data"
                .!catch $ fn (err)
                  d! $ :: :warn (str err)
        |transform-cirru-quoted $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn transform-cirru-quoted (compact-files)
              update compact-files :files $ fn (files)
                map-kv files $ fn (k v)
                  [] k $ -> v
                    update-in ([] :ns :code)
                      fn (q)
                        :: 'quote $ &cirru-quote:to-list q
                    update :defs $ fn (d)
                      map-kv d $ fn (k v)
                        [] k $ update v :code
                          fn (q)
                            :: 'quote $ &cirru-quote:to-list q
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.fetch $ :require
            app.config :refer $ api-host api-host-6011 mocked?
            app.schema :as schema
    |app.main $ %{} :FileEntry
      :defs $ {}
        |*store $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *store schema/store)
        |dispatch! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn dispatch! (op ? data)
              if (tag? op)
                recur $ :: op data
                tag-match op
                    :effect-goto-def data
                    let
                        files $ :files @*store
                        editor $ :editor @*store
                      if-let
                        next-def-path $ lookup-target-def data files
                          get-in editor $ [] :stack (:pointer editor)
                          :package @*store
                        dispatch! :def-path next-def-path
                        dispatch! :warn $ str "\"not found: " data
                  _ $ do
                    when
                      and dev? $ not= (nth op 0) :states
                      js/console.log "\"dispatch!" op
                    let
                        op-id $ nanoid
                        op-time $ js/Date.now
                      reset! *store $ updater @*store op op-id op-time
        |handle-global-keys $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn handle-global-keys () $ js/window.addEventListener "\"keydown"
              fn (event)
                cond $ true
                  do $ js/console.log event
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (; js/console.log PIXI)
              if dev? $ load-console-formatter!
              -> (new FontFaceObserver "\"Roboto Mono") (.!load)
                .!then $ fn (event) (render-app!) (js/window._phloxTree.renderer.plugins.accessibility.destroy)
              add-watch *store :change $ fn (store prev) (render-app!)
              when mobile? (render-control!) (start-control-loop! 8 on-control-event)
              load-files! dispatch!
              ; handle-global-keys
              println "\"App Started"
        |mount-target $ %{} :CodeEntry (:doc |)
          :code $ quote
            def mount-target $ js/document.querySelector "\".app"
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ if (nil? build-errors)
              do (clear-phlox-caches!) (respo/clear-cache!) (remove-watch *store :change)
                add-watch *store :change $ fn (store prev) (render-app!)
                render-app!
                when mobile? $ replace-control-loop! 8 on-control-event
                hud! "\"ok~" "\"Ok"
                ; load-files! dispatch!
              hud! "\"error" build-errors
        |render-app! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-app! ()
              render! (comp-container @*store) dispatch! $ {}
              respo/render! mount-target
                comp-navbar @*store $ >> (:states @*store) :dom
                , dispatch!
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.main $ :require ("\"pixi.js" :as PIXI)
            "\"nanoid" :refer $ nanoid
            phlox.core :refer $ render! clear-phlox-caches! on-control-event
            app.container :refer $ comp-container
            app.schema :as schema
            phlox.config :refer $ dev? mobile?
            app.updater :refer $ updater
            "\"fontfaceobserver-es" :default FontFaceObserver
            "\"./calcit.build-errors" :default build-errors
            "\"bottom-tip" :default hud!
            touch-control.core :refer $ render-control! start-control-loop! replace-control-loop!
            app.comp.nav :refer $ comp-navbar on-save
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input
            respo.core :as respo
            respo.comp.space :refer $ =<
            app.fetch :refer $ load-files!
            app.analyze :refer $ lookup-target-def
    |app.math $ %{} :FileEntry
      :defs $ {}
        |add-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn add-path
                [] a b
                [] x y
              [] (+ a x) (+ b y)
        |divide-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn divide-path
                [] x y
                [] a b
              let
                  inverted $ / 1
                    + (* a a) (* b b)
                []
                  * inverted $ + (* x a) (* y b)
                  * inverted $ - (* y a) (* x b)
        |divide-x $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn divide-x (point x)
              []
                / (first point) x
                / (peek point) x
        |invert-y $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn invert-y
                [] x y
              [] x $ unchecked-negate y
        |multiply-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn multiply-path
                [] a b
                [] x y
              []
                - (* a x) (* b y)
                + (* a y) (* b x)
        |rand-color $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rand-color () $ rand-int 0xffffff
        |rand-point $ %{} :CodeEntry (:doc |)
          :code $ quote
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
        |rough-size $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rough-size
                [] x y
              + (js/Math.abs x) (js/Math.abs y)
        |subtract-path $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn subtract-path
                [] a b
                [] x y
              [] (- a x) (- b y)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns app.math)
    |app.schema $ %{} :FileEntry
      :defs $ {}
        |CodeEntry $ %{} :CodeEntry (:doc |)
          :code $ quote
            def CodeEntry $ new-record :CodeEntry :doc :code
        |FileEntry $ %{} :CodeEntry (:doc |)
          :code $ quote
            def FileEntry $ new-record :FileEntry :ns :defs
        |inline $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro inline (path)
              read-file $ str "\"data/" path
        |store $ %{} :CodeEntry (:doc |)
          :code $ quote
            def store $ {}
              :states $ {}
              :dom-states $ {}
                :cursor $ [] :dom
              :saved-files $ {}
              :package nil
              :files $ {}
              :configs nil
              :warning nil
              :editor $ {}
                :focus $ []
                :clipboard $ []
                :def-path $ []
                :pointer 0
                :stack $ []
                :picker-mode? false
              :router $ {} (:name :editor)
              :deps-tree nil
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns app.schema)
    |app.server $ %{} :FileEntry
      :defs $ {}
        |*app-server $ %{} :CodeEntry (:doc |)
          :code $ quote (defatom *app-server nil)
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (println "\"start web server") (start-server!)
        |on-request $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                    println "\"wrote to" "\".compact-inc.cirru" "\"and" "\"compact.cirru"
                    ; println "\"data" $ :body req
                    {} (:code 200) (:headers cors-headers)
                      :body $ format-cirru-edn
                        {} (:ok? true) (:data "\"wrote")
                  :OPTIONS $ {} (:code 200) (:headers cors-headers) (:body "\"OK")
        |patch-compact-data $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                      list-match changes
                        () files-data
                        (c0 xs)
                          let
                              target-ns $ nth c0 0
                              target $ nth c0 1
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
                            recur next xs
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ println "\"reload..."
        |start-server! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn start-server! () $ reset! *app-server
              serve-http!
                {} (:port 6101) (:host "\"0.0.0.0")
                fn (req) (on-request req)
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.server $ :require
            http.core :refer $ serve-http!
            app.config :refer $ cors-headers
    |app.style $ %{} :FileEntry
      :defs $ {}
        |button $ %{} :CodeEntry (:doc |)
          :code $ quote
            def button $ merge ui/button
              {} $ :background :black
        |css-hover-entry $ %{} :CodeEntry (:doc |)
          :code $ quote
            defstyle css-hover-entry $ {}
              "\"$0" $ {} (:cursor :pointer) (:font-family ui/font-code) (:cursor :pointer) (:line-height "\"2") (:padding "\"0 8px")
              "\"$0:hover" $ {}
                :background-color $ hsl 0 0 100 0.2
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.style $ :require
            respo.css :refer $ defstyle
            respo-ui.core :refer $ hsl
            respo-ui.core :as ui
    |app.updater $ %{} :FileEntry
      :defs $ {}
        |splice-after $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn splice-after (xs i ys)
              loop
                  acc xs
                  data $ reverse ys
                list-match data
                  () acc
                  (d0 ds)
                    recur (&list:assoc-after acc i d0) ds
        |updater $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn updater (store op op-id op-time)
              tag-match op
                  :states cursor s
                  update-states store cursor s
                (:load-files data)
                  -> store
                    assoc :package $ :package data
                    assoc :configs $ :configs data
                    assoc :files $ :files data
                    assoc :saved-files $ :files data
                (:files-synced)
                  -> store $ assoc :saved-files (:files store)
                (:router r) (assoc store :router r)
                (:stack-pointer p)
                  assoc-in store ([] :editor :pointer) p
                (:pointer-down idx)
                  update store :editor $ fn (editor)
                    let
                        size $ count (:stack editor)
                      if
                        >= idx $ dec size
                        , editor $ update editor :pointer inc
                (:pointer-up idx)
                  update store :editor $ fn (editor)
                    let
                        size $ count (:stack editor)
                      if (= 0 idx) editor $ update editor :pointer dec
                (:pointer-shrink idx)
                  update store :editor $ fn (editor)
                    if
                      contains? (:stack editor) (:pointer editor)
                      -> editor
                        update :pointer $ fn (idx)
                          if (= 0 idx) 0 $ dec idx
                        update :stack $ fn (xs) (dissoc xs idx)
                      , editor
                (:call-cirru-edit op-data)
                  let
                      editor $ :editor store
                      def-path $ prepend
                        get-in editor $ [] :stack (:pointer editor)
                        , :files
                      def-entry $ -> store (get-in def-path)
                    if (record? def-entry)
                      let
                          result $ cirru-edit
                            {}
                              :tree $ get-in def-entry ([] :code 1)
                              :clipboard $ :clipboard editor
                            :: & op-data
                        ; js/console.log op-data result
                        if-let
                          warning $ :warning result
                          js/console.warn warning
                        -> store
                          assoc-in def-path $ assoc def-entry :code
                            :: 'quote $ :tree result
                          assoc-in ([] :editor :focus)
                            or (:focus result) (:focus editor)
                          assoc-in ([] :editor :clipboard) (:clipboard result)
                          assoc :warning $ :warning result
                      assoc store :warning $ str "\"target not found at:" def-path
                (:cirru-edit-node op-data)
                  let-sugar
                        [] focus code
                        , op-data
                      editor $ :editor store
                      def-path $ prepend
                        get-in editor $ [] :stack (:pointer editor)
                        , :files
                      def-entry $ -> store (get-in def-path)
                    if (record? def-entry)
                      assoc-in store (conj def-path :code)
                        :: 'quote $ assoc-in
                          get-in def-entry $ [] :code 1
                          , focus code
                      assoc store :warning $ str "\"target not found at:" def-path
                (:def-path op-data)
                  -> store
                    assoc :router $ {} (:name :editor)
                    update :editor $ fn (editor)
                      let
                          pointer $ :pointer editor
                          stack $ :stack editor
                          next-pointer $ inc pointer
                        if
                          and (contains? stack next-pointer)
                            = op-data $ get stack next-pointer
                          update editor :pointer inc
                          merge editor $ if (empty? stack)
                            {} (:pointer 0)
                              :stack $ [] op-data
                            {}
                              :stack $ .assoc-after stack pointer op-data
                              :pointer next-pointer
                (:focus op-data)
                  assoc-in store ([] :editor :focus) op-data
                (:warn op-data) (assoc store :warning op-data)
                (:ok) (assoc store :warning nil)
                (:add-ns op-data)
                  let
                      ns $ or op-data "\"TODO_NS"
                    assoc-in store ([] :files ns)
                      %{} schema/FileEntry
                        :ns $ %{} schema/CodeEntry (:doc "\"")
                          :code $ :: 'quote ([] "\"ns" ns)
                        :defs $ {}
                (:rm-ns op-data)
                  if (some? op-data)
                    dissoc-in store $ [] :files op-data
                    , store
                (:add-def op-data)
                  let[] (ns def-name)
                    or op-data $ [] "\"TODO_NS" "\"TODO_DEF"
                    update store :files $ fn (files)
                      if (contains? files ns)
                        update-in files ([] ns :defs)
                          fn (defs)
                            if (contains? defs def-name) defs $ assoc defs def-name
                              %{} schema/CodeEntry (:doc "\"")
                                :code $ :: 'quote
                                  [] "\"defn" def-name $ []
                        , files
                (:rm-def op-data)
                  let[] (ns def-name)
                    or op-data $ [] "\"TODO_NS" "\"TODO_DEF"
                    update store :files $ fn (files)
                      if (contains? files ns)
                        update-in files ([] ns :defs)
                          fn (defs)
                            if (contains? defs def-name) (dissoc defs def-name) defs
                        , files
                (:mv-ns op-data)
                  let[] (from to) op-data $ if
                    contains-in? store $ [] :files from
                    update store :files $ fn (files)
                      -> files (dissoc from)
                        assoc to $ -> (get files from)
                          update-in ([] :ns 1)
                            fn (code)
                              if
                                string? $ get code 1
                                assoc code 1 to
                                do (js/console.warn "\"ns name not found in:" code) code
                    assoc store :warning $ str "\"unknown ns: " from
                (:mv-def op-data)
                  let-sugar
                        [] from to
                        , op-data
                      ([] from-ns from-def) (.split from "\"/")
                      ([] to-ns to-def) (.split to "\"/")
                    if
                      and
                        contains-in? store $ [] :files from-ns :defs from-def
                        contains-in? store $ [] :files to-ns
                        not $ blank? to-def
                      -> store
                        update :files $ fn (files)
                          -> files
                            dissoc-in $ [] from-ns :defs from-def
                            assoc-in ([] to-ns :defs to-def)
                              ->
                                get-in files $ [] from-ns :defs from-def
                                update 1 $ fn (code)
                                  if
                                    string? $ get code 1
                                    assoc code 1 to-def
                                    do (js/console.warn "\"def not found in:" code) code
                        assoc :warning nil
                      assoc store :warning $ str "\"unknown ns/def: " from
                (:picker-mode op-data)
                  assoc-in store ([] :editor :picker-mode?) op-data
                (:focus-or-pick op-data)
                  if
                    :picker-mode? $ :editor store
                    let
                        editor $ :editor store
                        def-path $ get-in editor
                          [] :stack $ :pointer editor
                        item $ get-in store
                          concat ([] :files) def-path ([] :code 1) op-data
                      -> store
                        update-in
                          concat ([] :files) def-path $ [] :code
                          fn (pair)
                            :: 'quote $ assoc-in (nth pair 1) (-> store :editor :focus) item
                        assoc-in ([] :editor :picker-mode?) false
                    assoc-in store ([] :editor :focus) op-data
                (:deps-tree op-data) (assoc store :deps-tree op-data)
                (:hydrate-storage op-data) op-data
                _ $ do (eprintln "\"unknown op" op) store
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns app.updater $ :require
            phlox.cursor :refer $ update-states
            cirru-editor.core :refer $ cirru-edit
            app.schema :as schema
