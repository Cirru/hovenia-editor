
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {}
    :default $ {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |memof/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/ |pointed-prompt/ |alerts.calcit/ |respo-cirru-editor/ |js-ffi/
      :type-slots $ {} $ :dispatch-op 'app.schema/Op
    :server $ {} (:description |) (:init-fn 'app.server/main!) (:mode :native) (:reload-fn 'app.server/reload!) (:target :node)
      :feature-policy $ {}
      :modules $ [] |calcit-http/
      :type-slots $ {}
  :files $ {}
    'app.analyze $ %{} 'FileEntry
      :defs $ {}
        'analyze-deps $ %{} 'CodeEntry
          :doc "|对已载入的 Struct 文件/定义检查代码 List，按文件与定义键直接累积依赖图；保留原依赖三元组的类别 Tag，不将异构三元组伪装为 List<String>。"
          :code $ quote $ defn analyze-deps (files)
            let
                imports $ filter-map-kv files $ fn (ns file)
                  hint-fn $ Fn String Dynamic $ ->
                    MapEntryDecision String $ Map Tag $ Map String String
                  let
                      form $ schema/entry-tree $ .unwrap
                        get (schema/entry-fields file) :ns
                    MapEntryDecision :keep ns $ parse-import-dict form
                initial $ decode-map-as ({})
                  Map (List String)
                    List $ Tuple String String Tag
              &map:fold-kv files initial $ fn (all ns file)
                hint-fn $ Fn
                  Map (List String)
                    List $ Tuple String String Tag
                  , String Dynamic $ ->
                    Map (List String)
                      List $ Tuple String String Tag
                let
                    defs $ decode-map-as
                      .unwrap-or
                        get (schema/entry-fields file) :defs
                        {}
                      Map String Dynamic
                    ns-imports $ .unwrap $ get imports ns
                  &map:fold-kv defs all $ fn (acc def-name entry)
                    hint-fn $ Fn
                      Map (List String)
                        List $ Tuple String String Tag
                      , String Dynamic $ ->
                        Map (List String)
                          List $ Tuple String String Tag
                    let
                        code $ schema/entry-tree entry
                      assoc acc ([] ns def-name)
                        lookup-body-deps (slice code 2) ns-imports ns def-name $ keys defs
          :examples $ []
          :schema $ quote $ Fn (Map String Dynamic)
            -> $ Map (List String)
              List $ Tuple String String Tag
          :tests $ [] $ %{} 'TestEntry (:name |loaded-snapshot-dependencies-and-navigation)
            :code $ quote $ let
                raw $ decode-map-as
                  parse-cirru-edn "|{} $ :files $ {}\n  |app.demo $ %{} :FileEntry\n    :ns $ %{} :CodeEntry\n      :code $ quote $ ns app.demo $ :require (app.other :as other) (lib.core :refer $ external)\n    :defs $ {}\n      |main $ %{} :CodeEntry\n        :code $ quote $ defn main () (helper) (external)\n      |helper $ %{} :CodeEntry\n        :code $ quote $ defn helper () |ok"
                  Map Tag Dynamic
                loaded $ app.fetch/transform-cirru-quoted raw
                files $ decode-map-as
                  .unwrap $ get loaded :files
                  Map String Dynamic
                graph $ analyze-deps files
                deps $ .unwrap $ get graph ([] |app.demo |main)
              assert= true $ includes? deps $ [] |app.demo |helper :file
              assert= true $ includes? deps $ [] |lib.core |external :def
              assert=
                Some $ [] |app.demo :defs |helper
                lookup-target-def |helper files ([] |app.demo :defs |main) |app
              assert=
                Some $ [] |app.other :defs |entry
                lookup-target-def |other/entry files ([] |app.demo :defs |main) |app
              assert= None $ lookup-target-def |missing files ([] |app.demo :defs |main) |app
        'dependency-key $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dependency-key (dependency)
            let
                parts $ decode-map-as dependency $ List Dynamic
              []
                decode-map-as
                  .unwrap $ get parts 0
                  , 'String
                decode-map-as
                  .unwrap $ get parts 1
                  , 'String
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ List String
        'digit-pattern $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn digit-pattern () (new js/RegExp |^\d$)
          :examples $ []
          :schema $ quote $ Fn (-> Dynamic) (:features :js-ffi)
        'flatten $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn flatten (xs)
            match xs
              (String token) ([] token)
              (List children) (mapcat children flatten)
          :examples $ []
          :schema $ quote $ Fn CirruNode
            -> $ List String
        'lookup-body-deps $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn lookup-body-deps (body imports-dict ns def-name def-names)
            let
                defs-imports $
                  get imports-dict :defs
                  , .unwrap-or $ {}
                npm-defs $
                  get imports-dict :npm-defs
                  , .unwrap-or $ {}
                npm-defaults $
                  get imports-dict :npm-defaults
                  , .unwrap-or $ {}
                namespaces $
                  get imports-dict :namespaces
                  , .unwrap-or $ {}
                npm-namespaces $
                  get imports-dict :npm-namespaces
                  , .unwrap-or $ {}
              -> body flatten
                filter $ fn (token)
                  if (= token |) false $ let
                      c $
                        nth token 0
                        , .unwrap-or |
                    not $ or (= |: c) (= "|\"" c) (= |' c) (= |. c) (= |; c) (= token def-name) (= token |true) (= token |false) (= token |nil) (includes? |0123456789| token)
                map strip-at
                , distinct $ mapcat $ fn (token)
                  hint-fn $ Fn String $ ->
                    List $ Tuple String String Tag
                  cond
                      = token def-name
                      []
                    (contains? def-names token)
                      [] $ [] ns token :file
                    (contains? defs-imports token)
                      [] $ []
                          get defs-imports token
                          , .unwrap-or |
                        , token :def
                    (contains? npm-defs token)
                      [] $ []
                          get npm-defs token
                          , .unwrap-or |
                        , token :npm-def
                    (contains? npm-defaults token)
                      [] $ []
                          get npm-defaults token
                          , .unwrap-or |
                        , token :npm-default
                    (and (not= ((get token 0) .unwrap-or |) |/) (includes? token |/))
                      let
                          pieces $ split token |/
                          ns-alias $
                            first pieces
                            , .unwrap-or |
                          def-part $
                            nth pieces 1
                            , .unwrap-or |
                        cond
                            contains? namespaces ns-alias
                            [] $ []
                                get namespaces ns-alias
                                , .unwrap-or |
                              , def-part :ns-def
                          (contains? npm-namespaces ns-alias)
                            [] $ []
                                get npm-namespaces ns-alias
                                , .unwrap-or |
                              , def-part :npm-ns-def
                          true $ []
                    true $ []
          :examples $ []
          :schema $ quote $ Fn (List CirruNode)
            Map Tag $ Map String String
            , String String (Set String)
              -> $ List $ Tuple String String Tag
        'lookup-dependants $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn lookup-dependants (deps-dict)
            -> deps-dict keys &set:to-list
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
          :examples $ []
          :schema $ quote $ Fn
            Map (List String)
              List $ List String
            -> Dynamic
        'lookup-target-def $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn lookup-target-def (token files def-path pkg)
            let
                ns $ decode-map-as
                  .unwrap-or (first def-path) |
                  , 'String
                file-fields $ schema/entry-fields $ .unwrap (get files ns)
                file-defs $ decode-map-as
                  .unwrap-or (get file-fields :defs) ({})
                  Map String Dynamic
                imports-form $ schema/entry-tree $ .unwrap (get file-fields :ns)
                dict $ parse-import-dict imports-form
                namespaces $ .unwrap $ get dict :namespaces
                referred $ .unwrap $ get dict :defs
              if (contains? file-defs token)
                Some $ decode-map-as ([] ns :defs token) (List app.schema/DefinitionPathPart)
                match (get referred token)
                  (:some target-ns)
                    if (starts-with? target-ns pkg)
                      Some $ decode-map-as ([] target-ns :defs token) (List app.schema/DefinitionPathPart)
                      , None
                  (:none)
                    if
                      and
                        not= |/ $ .unwrap-or (get token 0) |
                        includes? token |/
                      let
                          pieces $ split token |/
                          ns-part $ .unwrap-or (get pieces 0) |
                          def-part $ .unwrap-or (get pieces 1) |
                        match (get namespaces ns-part)
                          (:some target-ns)
                            if (starts-with? target-ns pkg)
                              Some $ decode-map-as ([] target-ns :defs def-part) (List app.schema/DefinitionPathPart)
                              , None
                          (:none) None
                      , None
          :examples $ []
          :schema $ quote $ Fn String (Map String Dynamic) (List Dynamic) String
            -> $ Option $ List schema/DefinitionPathPart
        'parse-import-dict $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn parse-import-dict (ns-form)
            let
                rules $ rest $ decode-map-as
                  .unwrap-or (nth ns-form 2) ([])
                  List Dynamic
                initial $ decode-map-as
                  {}
                    :namespaces $ {}
                    :defs $ {}
                    :npm-defaults $ {}
                    :npm-defs $ {}
                    :npm-namespaces $ {}
                  Map Tag $ Map String String
              foldl rules initial $ fn (dict raw-rule)
                hint-fn $ Fn
                  Map Tag $ Map String String
                  , Dynamic $ ->
                    Map Tag $ Map String String
                let
                    rule $ regularize-rule $ decode-map-as raw-rule (List Dynamic)
                    target $ decode-map-as
                      .unwrap $ get rule 0
                      , 'String
                    method $ decode-map-as
                      .unwrap $ get rule 1
                      , 'String
                    npm? $ starts-with? target "|\""
                  match method
                    |:as $ assoc-in dict
                      [] (if npm? :npm-namespaces :namespaces)
                        decode-map-as
                          .unwrap $ get rule 2
                          , 'String
                      , target
                    |:refer $ let
                        names $ decode-map-as
                          .unwrap $ get rule 2
                          List String
                        category $ if npm? :npm-defs :defs
                        previous $ .unwrap $ get dict category
                      assoc dict category $ foldl names previous $ fn (entries name)
                        hint-fn $ Fn (Map String String) String $ -> (Map String String)
                        assoc entries name target
                    |:default $ assoc-in dict
                      [] :npm-defaults $ decode-map-as
                        .unwrap $ get rule 2
                        , 'String
                      , target
                    _ $ raise $ str "|unknown rule: " method
          :examples $ []
          :schema $ quote $ Fn (List Dynamic)
            -> $ Map Tag $ Map String String
          :tests $ [] $ %{} 'TestEntry (:name |preserves-namespace-and-npm-imports)
            :code $ quote $ let
                imports $ parse-import-dict $ [] |ns |app.main
                  [] |:require
                    [] |[] |respo.core |:refer $ [] |[] |render!
                    [] |respo.cursor |:as |cursor
                    [] "|\"bottom-tip" |:default |hud!
              assert= (Some |respo.core)
                app.schema/path-value imports $ [] :defs |render!
              assert= (Some |respo.cursor)
                app.schema/path-value imports $ [] :namespaces |cursor
              assert= (Some "|\"bottom-tip")
                app.schema/path-value imports $ [] :npm-defaults |hud!
        'regularize-rule $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn regularize-rule (rule)
            -> rule
              filter $ fn (item) (not= item |[])
              map $ fn (item)
                if (list? item) (regularize-rule item) item
          :examples $ []
          :schema $ quote $ Fn (List Dynamic)
            -> $ List Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |drops-only-legacy-list-markers)
            :code $ quote $ assert=
              [] |respo.core :refer $ [] |render!
              regularize-rule $ [] |[] |respo.core :refer $ [] |[] |render!
        'strip-at $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn strip-at (token)
            if
              = |@ $
                nth token 0
                , .unwrap-or |
              &str:slice token 1
              , token
          :examples $ []
          :schema $ quote $ Fn String (-> String)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.analyze
          :require $ app.schema :as schema
    'app.comp.call-tree $ %{} 'FileEntry
      :defs $ {}
        'build-call-tree $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn build-call-tree (deps-tree entry parents)
            let
                looped? $ contains? parents entry
                children $ if looped? ([])
                  foldl
                    .unwrap-or (get deps-tree entry) ([])
                    decode-map-as ([])
                      List $ Map Tag Dynamic
                    fn (acc dependency)
                      hint-fn $ Fn
                        List $ Map Tag Dynamic
                        Tuple String String Tag
                        -> $ List $ Map Tag Dynamic
                      let
                          child-entry $ dependency-key dependency
                        if (contains? deps-tree child-entry)
                          conj acc $ build-call-tree deps-tree child-entry $ include parents entry
                          , acc
                result $ {} (:entry entry) (:looped? looped?) (:children children)
              assoc result :size $ count-tree result
          :examples $ []
          :schema $ quote $ Fn
            Map (List String)
              List $ Tuple String String Tag
            List String
            Set $ List String
            -> $ Map Tag Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |keeps-cycle-marker-and-skips-external-nodes)
            :code $ quote $ let
                graph $ decode-map-as
                  {}
                      [] |app.main |a
                      [] ([] |app.main |b :file) ([] |external.lib |x :def)
                    ([] |app.main |b)
                      [] $ [] |app.main |a :file
                  Map (List String)
                    List $ Tuple String String Tag
                tree $ build-call-tree graph ([] |app.main |a) (#{})
              assert= (Some 3) (get tree :size)
              assert= (Some true)
                app.schema/path-value tree $ [] :children 0 :children 0 :looped?
              assert=
                Some $ []
                app.schema/path-value tree $ [] :children 0 :children 0 :children
        'comp-call-tree $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-call-tree (states deps-tree router pkg)
            let
                cursor $
                  get states :cursor
                  , .unwrap-or $ []
                state $
                  get states :data
                  , .unwrap-or $ {}
                    :spin-pos $ [] 600 200
                    :spin 0
                call-tree $ build-call-tree deps-tree router $ #{}
              container ({})
                ; w-js-log $ comp-curve 200 0.1 0.7 (hsluvx 20 100 60) 40
                comp-sector call-tree 40
                  decode-map-as
                      get state :spin
                      , .unwrap-or 0
                    , 'Number
                  * 2 &PI
                  , 0
                comp-spin-slider (>> states :c)
                  {} (:unit 0.4) (:label |spin) (:fraction 1)
                    :position $
                      get state :spin-pos
                      , .unwrap-or $ [] 600 200
                    :value $ decode-map-as
                        get state :spin
                        , .unwrap-or 0
                      , 'Number
                    :on-change $ fn (value d!)
                      d! $ :: :states cursor $ assoc state :spin value
                    :on-move $ fn (pos d!)
                      d! $ :: :states cursor $ assoc state :spin-pos pos
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic)
            Map (List String)
              List $ Tuple String String Tag
            List String
            , String (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-sector $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-sector (call-tree radius start-radian radian-size idx)
            let
                children $ decode-map-as
                    get call-tree :children
                    , .unwrap-or $ []
                  List $ Map Tag Dynamic
                tree-size $ decode-map-as
                    get call-tree :size
                    , .unwrap-or 1
                  , 'Number
                entry $ decode-map-as
                    get call-tree :entry
                    , .unwrap-or $ []
                  List String
                thickness $ + 10 (pow radius 0.7)
                  * 2 $ count children
              container ({})
                create-list :container ({})
                  loop
                      acc $ decode-map-as ([]) (List Dynamic)
                      xs children
                      a0 start-radian
                    match (destruct-list xs)
                      (:none) acc
                      (:some x0 xss)
                        let
                            delta $ * (- radian-size 0.01)
                              /
                                decode-map-as
                                    get x0 :size
                                    , .unwrap-or 0
                                  , 'Number
                                , tree-size
                          recur
                            conj acc $ let
                                index $ count acc
                              [] index $ comp-sector x0 (+ radius thickness 20) a0 delta index
                            , xss $ + a0 delta
                comp-sector-curve radius start-radian radian-size
                  hslx
                    &number:rem
                      + radius $ * idx 77
                      , 360
                    , 100 50
                  , thickness
                text $ {}
                  :text $
                    nth entry 1
                    , .unwrap-or |
                  :position $ []
                    * radius $ cos start-radian
                    * radius $ sin start-radian
                  :style $ {} (:fill 0xffffff) (:font-size 10) (:font-family |Hind)
                  :rotation start-radian
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) Number Number Number Number (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-sector-curve $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-sector-curve (radius start-radian radian-size color thickness)
            let
                r-extend $ + radius thickness
                start $ []
                  * radius $ cos start-radian
                  * radius $ sin start-radian
                end $ []
                  * radius $ cos $ + start-radian radian-size
                  * radius $ sin $ + start-radian radian-size
                start-extend $ []
                  * r-extend $ cos start-radian
                  * r-extend $ sin start-radian
                end-extend $ []
                  * r-extend $ cos $ + start-radian radian-size
                  * r-extend $ sin $ + start-radian radian-size
              graphics $ {} $ :ops
                []
                  g :begin-fill $ {} (:color color) (:alpha 0.8)
                  ; g :line-style $ {} (:color color) (:width 1) (:alpha 0.6)
                  g :move-to start
                  g :line-to start-extend
                  ; g :arc-to $ {} (:p1 start-extend) (:p2 end-extend) (:radius r-extend)
                  g :arc $ {}
                    :center $ [] 0 0
                    :radian $ [] start-radian $ + start-radian radian-size
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
          :examples $ []
          :schema $ quote $ Fn Number Number Number Number Number (-> Dynamic) (:features :js-ffi)
        'count-tree $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn count-tree (tree)
            let
                children $ decode-map-as
                  .unwrap-or (get tree :children) ([])
                  List $ Map Tag Dynamic
              inc $ foldl (map children count-tree) 0 &+
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (-> Number)
          :tests $ [] $ %{} 'TestEntry (:name |counts-nested-call-nodes)
            :code $ quote $ assert= 4
              count-tree $ {} $ :children
                [] ({})
                  {} $ :children $ [] ({})
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.call-tree
          :require
            phlox.core :refer $ defcomp >> hslx hclx hsluvx rect circle text container graphics create-list g polyline
            phlox.comp.button :refer $ comp-button
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            app.comp.deps-tree :refer $ comp-deps-tree
            app.analyze :refer $ lookup-target-def strip-at dependency-key
            phlox.util :refer $ measure-text-width!
            app.comp.editor :refer $ comp-editor
            memof.once :refer $ memof1-call
            phlox.comp.slider :refer $ comp-spin-slider
    'app.comp.command $ %{} 'FileEntry
      :defs $ {}
        'commands $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def commands
            []
              {} (:tip "|add-ns <ns>") (:fill "|add-ns ")
              {} (:tip "|rm-ns <ns>") (:fill "|rm-ns ")
              {} (:tip "|add-def <ns> <def>") (:fill "|add-def ")
              {} (:tip "|rm-def <ns> <def>") (:fill "|rm-def ")
              {} (:tip |load) (:comment "|load data") (:fill |load)
              {} (:tip |save) (:comment "|save all files") (:fill |save)
              {} (:tip "|mv-ns <from> <to>") (:fill "|mv-ns ")
              {} (:tip "|mv-def <from>/<a> <to>/<b>") (:fill "|mv-def ")
              {} (:tip "|pick [off]") (:fill |pick) (:comment "|pick mode on/off")
              {} (:tip |deps-tree) (:fill |deps-tree) (:comment |call)
              {} (:tip |deps-of) (:fill |deps-of) (:comment "|current dependency")
              {} (:tip |call-tree) (:fill |call-tree) (:comment "|sunburst graph of current function")
          :examples $ []
          :schema $ quote $ List (Map Tag String)
        'comp-command $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-command (states store on-close)
            let
                cursor $ decode-map-as
                    get states :cursor
                    , .unwrap-or $ []
                  List Dynamic
                state $ decode-map-as
                    get states :data
                    , .unwrap-or $ {} $ :content |
                  Map Tag Dynamic
                content $ decode-map-as
                    get state :content
                    , .unwrap-or |
                  , 'String
                editor $ decode-map-as
                    get store :editor
                    , .unwrap-or $ {}
                  Map Tag Dynamic
                def-path $ decode-map-as
                  .unwrap-or
                    app.schema/path-value editor $ [] :stack $ .unwrap-or (get editor :pointer) 0
                    []
                  List Dynamic
                set-box-text! $ fn (v d!)
                  hint-fn $ Fn String
                    Fn app.schema/Op $ -> Unit
                    -> Unit
                    :features :js-ffi
                  let
                      box $ .unwrap $ browser/query-selector |#command-box
                      next $ str (browser/element-value box) v
                    browser/element-set-value! box next
                    browser/element-focus! box
                    d! $ :: :states cursor $ assoc state :content next
                  , &unit &unit
              [] (effect-focus)
                div
                  {} (:class-name css/column)
                    :style $ {} $ :padding 16
                  div ({})
                    input $ {} (:placeholder |Command...) (:autofocus true) (:id |command-box) (:spellcheck false)
                      :class-name $ str-spaced css/input css-command-box
                      :style $ {} $ :width |100%
                      :value content
                      :on-input $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn app.schema/Op $ -> Unit
                          -> Unit
                        d! $ :: :states cursor $ assoc state :content
                          str $
                            app.schema/event-field e :value
                            , .unwrap-or |
                        , &unit
                      :on-keydown $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn app.schema/Op $ -> Unit
                          -> Unit
                        cond
                            = 13 $
                              app.schema/event-field e :keycode
                              , .unwrap-or 0
                            let
                                code $ decode-map-as
                                  .unwrap-or
                                    nth (parse-cirru-list content) 0
                                    , |
                                  , 'Dynamic
                              if (list? code) (run-command code store d!)
                                d! $ app.schema/Op :warn $ str "|invalid command:" code
                              on-close d!
                          (= |Escape ((app.schema/event-field e :key) .unwrap-or |))
                            on-close d!
                          true nil
                        , &unit
                  space-y 16
                  div
                    {} $ :style ui/row-middle
                    button $ {} (:class-name css/button) (:inner-text |Run)
                      :on-click $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn app.schema/Op $ -> Unit
                          -> Unit
                        let
                            code $ decode-map-as
                              .unwrap-or
                                nth (parse-cirru-list content) 0
                                , |
                              , 'Dynamic
                          if (list? code) (run-command code store d!)
                            d! $ app.schema/Op :warn $ str "|invalid command:" code
                          on-close d!
                        , &unit
                    space-x 16
                    if (list? def-path)
                      list->
                        {} $ :style $ {} (:line-height |20px)
                        -> def-path $ map-indexed $ fn (idx piece)
                          [] idx $ span $ {} (:class-name css-path-tag)
                            :inner-text $ str piece
                            :on-click $ fn (e d!)
                              hint-fn $ Fn respo.schema/RespoEvent
                                Fn app.schema/Op $ -> Unit
                                -> Unit
                              set-box-text! (str piece) d!
                              , &unit
                  space-y 8
                  comp-command-tips $ fn (v d!)
                    hint-fn $ Fn String
                      Fn app.schema/Op $ -> Unit
                      -> Unit
                    set-box-text! v d!
                    , &unit
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) (Map Tag Dynamic)
            Fn
              Fn app.schema/Op $ -> Unit
              -> Unit
            -> respo.schema/Component
            :features :js-ffi
        'comp-command-tips $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-command-tips (set-text!)
            div ({})
              list->
                {} (:class-name css/row)
                  :style $ {} (:flex-wrap :wrap) (:gap |8px)
                -> commands $ map-indexed $ fn (idx info)
                  [] idx $ div
                    {} $ :style $ {}
                    span
                      {} $ :on-click $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn app.schema/Op $ -> Unit
                          -> Unit
                        set-text!
                            get info :fill
                            , .unwrap-or |
                          , d!
                        , &unit
                      <>
                        .unwrap-or (get info :tip) |
                        decode-map-as css-tip 'String
          :examples $ []
          :schema $ quote $ Fn
            Fn String
              Fn app.schema/Op $ -> Unit
              -> Unit
            -> respo.schema/Component
        'css-command-box $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-command-box
            {} $ |$0 $ {} (:font-family ui/font-code) (:line-height |40px) (:height |40px)
          :examples $ []
          :schema $ quote String
        'css-path-tag $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-path-tag
            {}
              |$0 $ {} (:font-family ui/font-code) (:display :inline-block) (:white-space :pre-line) (:padding "|0 6px") (:margin-right |4px) (:margin-bottom |4px) (:border-radius |6px) (:cursor :pointer) (:color :white)
                :background-color $ hsl 200 50 70
              |$0:hover $ {} $ :background-color (hsl 200 50 60)
          :examples $ []
          :schema $ quote String
        'css-tip $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-tip
            {}
              |& $ {} (:padding "|2px 8px") (:border-radius |4px) (:opacity 0.8)
                :background-color $ hsl 0 0 90
                :cursor :pointer
              |&:hover $ {} $ :opacity 1
          :examples $ []
          :schema $ quote String
        'effect-focus $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defeffect effect-focus () (action el at?)
            if (= :mount action)
              .?!select $ .!querySelector el |input
          :examples $ []
          :schema $ quote $ Fn (-> respo.schema/Effect) (:features :js-ffi)
        'on-save $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-save (files saved-files d!)
            if mocked? (js/alert "|Data is mocked, nothing to save.")
              let
                  content $ format-cirru-edn $ persistence/build-patch files saved-files
                ->
                  js/fetch (str api-host |/compact-inc)
                    js-object (:method |PUT) (:body content)
                  .?!then $ fn (response)
                    hint-fn $ Fn Dynamic (-> Unit) (:features :js-ffi)
                    if
                      decode-map-as (.-ok response) 'Bool
                      do
                        d! $ app.schema/Op :files-synced files
                        d! $ app.schema/Op :ok
                      raise $ str "|Save failed: HTTP " $ decode-map-as (.-status response) 'Number
                    , &unit
                  .?!catch $ fn (error)
                    d! $ app.schema/Op :warn $ decode-map-as (js/String error) 'String
                    , &unit
            , &unit
          :examples $ []
          :schema $ quote $ Fn (Map String Dynamic) (Map String Dynamic)
            Fn app.schema/Op $ -> Unit
            -> Unit
            :features :js-ffi
        'run-command $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn run-command (code store d!)
            let
                p1 $ decode-map-as
                    get code 1
                    , .unwrap-or |
                  , 'String
                maybe-p2 $ get code 2
                p2 $ .unwrap-or maybe-p2 |
                files $ decode-map-as
                    get store :files
                    , .unwrap-or $ {}
                  Map String Dynamic
              match
                  first code
                  , .unwrap-or |
                |add-ns $ d! $ app.schema/Op :add-ns p1
                |rm-ns $ d! $ app.schema/Op :rm-ns p1
                |add-def $ d! $ app.schema/Op :add-def
                  [] p1 $ decode-map-as p2 String
                |rm-def $ d! $ app.schema/Op :rm-def
                  [] p1 $ decode-map-as p2 String
                |mv-ns $ d! $ app.schema/Op :mv-ns
                  [] p1 $ decode-map-as p2 String
                |mv-def $ d! $ app.schema/Op :mv-def
                  [] p1 $ decode-map-as p2 String
                |load $ load-files! d! false
                |save $ on-save files
                  decode-map-as
                      get store :saved-files
                      , .unwrap-or $ {}
                    Map String Dynamic
                  , d!
                |pick $ if (= p1 |off)
                  d! $ app.schema/Op :picker-mode false
                  d! $ app.schema/Op :picker-mode true
                |deps-tree $ do
                  d! $ app.schema/Op :deps-tree $ analyze-deps files
                  d! $ app.schema/Op :router $ {} (:name :deps-tree)
                |deps-of $ do
                  d! $ app.schema/Op :deps-tree $ analyze-deps files
                  d! $ app.schema/Op :router $ {} (:name :deps-of)
                    :data $ if (.some? maybe-p2) ([] p1 p2)
                      let
                          editor $
                            get store :editor
                            , .unwrap-or $ {}
                          def-path $ .unwrap-or
                            app.schema/path-value editor $ [] :stack $ .unwrap-or (get editor :pointer) 0
                            []
                        []
                            nth def-path 0
                            , .unwrap-or |
                          (nth def-path 2) .unwrap-or |
                |call-tree $ do
                  d! $ app.schema/Op :deps-tree $ analyze-deps files
                  d! $ app.schema/Op :router $ {} (:name :call-tree)
                    :data $ if (.some? maybe-p2) ([] p1 p2)
                      let
                          editor $
                            get store :editor
                            , .unwrap-or $ {}
                          def-path $ .unwrap-or
                            app.schema/path-value editor $ [] :stack $ .unwrap-or (get editor :pointer) 0
                            []
                        []
                            nth def-path 0
                            , .unwrap-or |
                          (nth def-path 2) .unwrap-or |
                _ $ d! $ app.schema/Op :warn (str "|invalid command: " code)
            , &unit
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (Map Tag Dynamic)
            Fn app.schema/Op $ -> Unit
            -> Unit
            :features :js-ffi
          :tests $ [] $ %{} 'TestEntry
            :name |commands-dispatch-current-enums-and-selected-target
            :code $ quote $ let
                ops $ ref $ decode-map-as ([]) (List app.schema/Op)
                capture $ fn (op)
                  hint-fn $ Fn app.schema/Op $ -> Unit
                  swap! ops conj op
                  , &unit
                store $ {}
                  :files $ {}
                  :editor $ {}
                    :stack $ [] $ [] |app.demo :defs |beta
                    :pointer 0
              assert= &unit $ run-command ([] |add-ns |new.ns) store capture
              run-command ([] |mv-def |app.demo/alpha |app.other/beta) store capture
              run-command ([] |pick |off) store capture
              run-command ([] |deps-of |app.demo |alpha) store capture
              run-command ([] |call-tree) store capture
              run-command ([] |unknown) store capture
              assert=
                [] (app.schema/Op :add-ns |new.ns)
                  app.schema/Op :mv-def $ [] |app.demo/alpha |app.other/beta
                  app.schema/Op :picker-mode false
                  app.schema/Op :deps-tree $ {}
                  app.schema/Op :router $ {} (:name :deps-of)
                    :data $ [] |app.demo |alpha
                  app.schema/Op :deps-tree $ {}
                  app.schema/Op :router $ {} (:name :call-tree)
                    :data $ [] |app.demo |beta
                  app.schema/Op :warn $ str "|invalid command: " $ [] |unknown
                , @ops
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.command
          :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ space-x space-y
            app.config :refer $ dev? api-host mocked?
            app.widget :as widget
            app.fetch :refer $ load-files!
            app.style :refer $ css-hover-entry
            app.analyze :refer $ analyze-deps
            respo-ui.css :as css
            respo.css :refer $ defstyle
            app.persistence :as persistence
            js-ffi.browser :as browser
    'app.comp.deps-of $ %{} 'FileEntry
      :defs $ {}
        'comp-curves $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-curves (connections)
            graphics $ {} $ :ops
              concat & $ -> connections $ map-indexed
                fn (idx pair)
                  let
                      from $ nth pair 0
                      p1 $ nth pair 1
                      p2 $ nth pair 2
                      to $ nth pair 3
                    []
                      g :line-style $ {} (:width 2) (:alpha 1)
                        :color $ hclx
                          &number:rem (* 37 idx) 360
                          , 100 60
                      g :move-to from
                      g :bezier-to $ {} (:p1 p1) (:p2 p2) (:to-p to)
          :examples $ []
          :schema $ quote $ Fn
            List $ List Dynamic
            -> Dynamic
        'comp-deps-of $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-deps-of (deps-tree entry pkg) (; js/console.log deps-tree entry)
            if (contains? deps-tree entry)
              let
                  deps $ .unwrap-or (get deps-tree entry) ([])
                  internal-deps $ -> deps $ filter
                    fn (item)
                      starts-with?
                        .unwrap-or
                          nth (dependency-key item) 0
                          , |
                        , pkg
                  external-deps $ -> deps $ filter
                    fn (item)
                      not $ starts-with?
                        .unwrap-or
                          nth (dependency-key item) 0
                          , |
                        , pkg
                  dependants $ -> deps-tree
                    &map:filter-kv $ fn (k v)
                      hint-fn $ Fn (List String)
                        List $ Tuple String String Tag
                        -> Bool
                      any? v $ fn (piece)
                        = (dependency-key piece) entry
                    keys
                  mid-text $ str
                    .unwrap-or (nth entry 0) |
                    , |/ $ .unwrap-or (nth entry 1) |
                  button-width $ + 16 $ measure-text-width! mid-text 14 "|Josefin Sans"
                  connections $ concat
                    -> dependants &set:to-list $ map-indexed $ fn (idx item)
                      let
                          to $ [] -200 $ + 16
                            * (dec idx) 40
                          p2 $ complex/add to $ [] 100 0
                        [] ([] 0 16) ([] -100 16) p2 to
                    -> internal-deps $ map-indexed $ fn (idx item)
                      let
                          to $ [] 320 $ + 16
                            * (dec idx) 40
                          p2 $ complex/add to $ [] -100 0
                        [] ([] button-width 16)
                          [] (+ 100 button-width) 16
                          , p2 to
                container ({}) (comp-curves connections)
                  comp-button $ {} (:text mid-text)
                    :position $ [] 0 0
                    :align-right? false
                  create-list :container
                    {} $ :position $ [] -200 -40
                    -> dependants &set:to-list $ map-indexed $ fn (idx item)
                      [] idx $ comp-button $ {}
                        :text $ str
                          .unwrap-or
                            nth (dependency-key item) 0
                            , |
                          , |/
                            .unwrap-or
                              nth (dependency-key item) 1
                              , |
                            , "|  " $ count
                              .unwrap-or
                                get deps-tree $ dependency-key item
                                []
                        :position $ [] 0 $ * idx 40
                        :align-right? true
                        :on $ {} $ :pointertap
                          fn (e d!)
                            hint-fn $ Fn Dynamic
                              Fn app.schema/Op $ -> Unit
                              -> Unit
                              :features :js-ffi
                            if
                              or
                                decode-map-as (.-metaKey e) 'Bool
                                decode-map-as (.-ctrlKey e) 'Bool
                              do
                                d! $ app.schema/Op :def-path $ []
                                  .unwrap $ get (dependency-key item) 0
                                  , :defs
                                    .unwrap $ get (dependency-key item) 1
                                d! $ app.schema/Op :router $ {} (:name :editor)
                              d! $ app.schema/Op :router $ {} (:name :deps-of)
                                :data $ dependency-key item
                            , &unit
                  create-list :container
                    {} $ :position $ [] 320 -40
                    -> internal-deps $ map-indexed $ fn (idx item)
                      [] idx $ comp-button $ {}
                        :text $ let
                            item-ns $ .unwrap-or
                              nth (dependency-key item) 0
                              , |
                            item-def $ .unwrap-or
                              nth (dependency-key item) 1
                              , |
                          if (starts-with? item-ns pkg)
                            str item-ns |/ item-def "|  " $ count $ .unwrap-or
                              get deps-tree $ dependency-key item
                              []
                            str item-ns |/ item-def
                        :position $ [] 0 $ * idx 40
                        :align-right? false
                        :on $ {} $ :pointertap
                          fn (e d!)
                            hint-fn $ Fn Dynamic
                              Fn app.schema/Op $ -> Unit
                              -> Unit
                              :features :js-ffi
                            if
                              or
                                decode-map-as (.-metaKey e) 'Bool
                                decode-map-as (.-ctrlKey e) 'Bool
                              do
                                d! $ app.schema/Op :def-path $ []
                                  .unwrap $ get (dependency-key item) 0
                                  , :defs
                                    .unwrap $ get (dependency-key item) 1
                                d! $ app.schema/Op :router $ {} (:name :editor)
                              d! $ app.schema/Op :router $ {} (:name :deps-of)
                                :data $ dependency-key item
                            , &unit
              text $ {}
                :text $ str "|not found: " entry
                :position $ [] 1 1
                :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
          :examples $ []
          :schema $ quote $ Fn
            Map (List String)
              List $ Tuple String String Tag
            List String
            , String (-> phlox.schema/PhloxElement) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.deps-of
          :require
            phlox.core :refer $ defcomp >> hslx hclx rect circle text container graphics create-list g polyline
            phlox.comp.button :refer $ comp-button
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            app.comp.deps-tree :refer $ comp-deps-tree
            app.analyze :refer $ lookup-target-def strip-at dependency-key
            phlox.util :refer $ measure-text-width!
            app.comp.editor :refer $ comp-editor
            memof.once :refer $ memof1-call
    'app.comp.deps-tree $ %{} 'FileEntry
      :defs $ {}
        '*defs-layout-stack $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *defs-layout-stack ({})
          :examples $ []
          :schema $ quote $ Ref (Map Number Number)
        '*defs-metrics-states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *defs-metrics-states ({})
          :examples $ []
          :schema $ quote $ Ref
            Map (List String) DefMetrics
        'DefMetrics $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct DefMetrics (:depth Number) (:y Number)
            :entry $ List String
            :scoped-defs $ List $ Tuple String String Tag
            :thirdpart-defs $ List $ Tuple String String Tag
          :examples $ []
          :schema $ quote StructDef
        'build-connections $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn build-connections (metrics cached pkg)
            mapcat metrics $ fn (info)
              let
                  base $ expand-layout-xy info
                  scoped $ info :scoped-defs
                mapcat
                  range 0 (count scoped) 1
                  fn (idx)
                    let
                        entry $ .unwrap $ nth scoped idx
                      match
                        get cached $ dependency-key entry
                        (:none) ([])
                        (:some target)
                          if
                            and
                              empty? $ target :scoped-defs
                              <= (target :depth) (info :depth)
                            []
                            [] $ []
                              complex/add base $ []
                                + 8 $ measure-text-width!
                                  str-def-entry (dependency-key entry) pkg
                                  , 14 |Hind
                                + 10 $ * 20 $ inc idx
                              complex/add (expand-layout-xy target) ([] 0 10)
          :examples $ []
          :schema $ quote $ Fn (List DefMetrics)
            Map (List String) DefMetrics
            , String
              -> $ List $ List (List Number)
              :features :js-ffi
        'build-defs-metrics $ %{} 'CodeEntry
          :doc "|只以依赖记录的前两个 String 构成缓存键；先缓存节点再递归，循环及共享节点不重复布局。内部和第三方依赖互斥分组，保留原三元组类别。"
          :code $ quote $ defn build-defs-metrics (entry3 deps-tree depth pkg)
            let
                entry $ dependency-key entry3
              if
                .some? $ get @*defs-metrics-states entry
                []
                let
                    info $ .unwrap-or (get deps-tree entry) ([])
                    scoped-defs $ filter info $ fn (item)
                      starts-with?
                        .unwrap $ first $ dependency-key item
                        , pkg
                    thirdpart-defs $ filter info $ fn (item)
                      not $ starts-with?
                        .unwrap $ first $ dependency-key item
                        , pkg
                    partial-self $ DefMetrics :depth depth :y
                      new-def-stack-y-of depth $ + 2 $ count scoped-defs
                      , :scoped-defs scoped-defs :thirdpart-defs thirdpart-defs :entry entry
                  swap! *defs-metrics-states assoc entry partial-self
                  prepend
                    mapcat scoped-defs $ fn (child)
                      build-defs-metrics (dependency-key child) deps-tree (inc depth) pkg
                    , partial-self
          :examples $ []
          :schema $ quote $ Fn (List String)
            Map (List String)
              List $ Tuple String String Tag
            , Number String
              -> $ List DefMetrics
          :tests $ [] $ %{} 'TestEntry
            :name |cycles-share-layout-and-separate-external-dependencies
            :code $ quote $ let
                a $ [] |app.main |a
                b $ [] |app.main |b
                graph $ decode-map-as
                  {}
                      [] |app.main |a
                      [] ([] |app.main |b :file) ([] |external.lib |x :def) ([] |app.main |b :file)
                    ([] |app.main |b)
                      [] $ [] |app.main |a :file
                  Map (List String)
                    List $ Tuple String String Tag
              reset! *defs-layout-stack $ {}
              reset! *defs-metrics-states $ {}
              let
                  nodes $ build-defs-metrics a graph 0 |app
                  root $ .unwrap $ get @*defs-metrics-states a
                  scoped $ root :scoped-defs
                  external $ root :thirdpart-defs
                assert= 2 $ count nodes
                assert= 2 $ count @*defs-metrics-states
                assert= 2 $ count scoped
                assert=
                  [] $ [] |external.lib |x :def
                  , external
                assert= ([] |app.main |b)
                  dependency-key $ .unwrap $ first scoped
              reset! *defs-layout-stack $ {}
              reset! *defs-metrics-states $ {}
        'calcit-def? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn calcit-def? (item)
            let
                kind $ .unwrap-or (nth item 2) :unknown
              or (= :def kind) (= :ns kind)
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Bool)
        'comp-deps-tree $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-deps-tree (deps-tree init-fn pkg)
            reset! *defs-layout-stack $ {}
            reset! *defs-metrics-states $ {}
            let
                metrics $ build-defs-metrics (split init-fn |/) deps-tree 0 pkg
                connections $ build-connections metrics @*defs-metrics-states pkg
              container ({})
                graphics $ {} $ :ops
                  mapcat
                    range 0 (count connections) 1
                    fn (idx)
                      let
                          pair $ .unwrap $ nth connections idx
                          from $ .unwrap $ nth pair 0
                          to $ .unwrap $ nth pair 1
                        []
                          g :line-style $ {} (:width 2) (:alpha 1)
                            :color $ hclx
                              &number:rem (* 37 idx) 360
                              , 100 60
                          g :move-to from
                          g :bezier-to $ {}
                            :p1 $ complex/add from $ [] 50 0
                            :p2 $ complex/minus to $ [] 50 0
                            :to-p to
                create-list :container ({})
                  map-indexed metrics $ fn (idx info)
                    let
                        position $ expand-layout-xy info
                        label $ str-def-entry
                          dependency-key $ info :entry
                          , pkg
                      [] idx $ container ({})
                        rect $ {} (:position position)
                          :size $ [] (measure-text-width! label 14 |Hind) 20
                          :fill $ hslx 0 0 20
                        text $ {} (:text label)
                          :position $ complex/add position $ [] 4 0
                          :style $ {} (:font-size 14) (:font-family |Hind)
                            :fill $ hslx 0 0 80
                        create-list :container ({})
                          map-indexed (info :scoped-defs)
                            fn (idx entry)
                              let
                                  key $ dependency-key entry
                                  label $ str-def-entry key pkg
                                  offset $ [] 0 $ * 20 (inc idx)
                                [] idx $ container ({})
                                  rect $ {} (:alpha 0.3)
                                    :position $ complex/add position offset
                                    :size $ []
                                      + 8 $ measure-text-width! label 14 |Hind
                                      , 20
                                    :fill $ hslx 0 0 20
                                    :on $ {} $ :pointertap
                                      fn (event d!)
                                        hint-fn $ Fn Dynamic
                                          Fn app.schema/Op $ -> Unit
                                          -> Unit
                                          :features :js-ffi
                                        when
                                          decode-map-as (.-metaKey event) 'Bool
                                          d! $ app.schema/Op :router $ {} (:name :editor)
                                          d! $ app.schema/Op :def-path $ []
                                            .unwrap $ nth key 0
                                            , :defs
                                              .unwrap $ nth key 1
                                        , &unit
                                  text $ {} (:text label)
                                    :position $ complex/add position $ [] 4
                                      * 20 $ inc idx
                                    :style $ {} (:font-size 14) (:font-family |Hind)
                                      :fill $ hslx 180 30 40
          :examples $ []
          :schema $ quote $ Fn
            Map (List String)
              List $ Tuple String String Tag
            , String String (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'expand-layout-xy $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn expand-layout-xy (info)
            let
                depth $ info :depth
                y $ info :y
                max-y $ get-def-stack-y-of depth
              [] (* 320 depth)
                * 20 $ - y $ * 0.4 max-y
          :examples $ []
          :schema $ quote $ Fn DefMetrics
            -> $ List Number
        'get-def-stack-y-of $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn get-def-stack-y-of (depth)
            .unwrap-or (get @*defs-layout-stack depth) 0
          :examples $ []
          :schema $ quote $ Fn Number (-> Number)
        'new-def-stack-y-of $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn new-def-stack-y-of (depth size)
            let
                previous $ .unwrap-or (get @*defs-layout-stack depth) 0
              swap! *defs-layout-stack assoc depth $ + previous size
              , previous
          :examples $ []
          :schema $ quote $ Fn Number Number (-> Number)
          :tests $ [] $ %{} 'TestEntry (:name |accumulates-layout-with-numeric-default)
            :code $ quote $ do
              reset! *defs-layout-stack $ {}
              assert= 0 $ get-def-stack-y-of 2
              assert= 0 $ new-def-stack-y-of 2 3
              assert= 3 $ new-def-stack-y-of 2 4
              assert= 7 $ get-def-stack-y-of 2
              assert= ([] 320 60)
                expand-layout-xy $ %{} DefMetrics (:depth 1) (:y 3)
                  :entry $ [] |app.main |a
                  :scoped-defs $ []
                  :thirdpart-defs $ []
              reset! *defs-layout-stack $ {}
        'str-def-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn str-def-entry (pair pkg)
            let[] (ns def-name) pair $ if (starts-with? ns pkg)
              str (strip-prefix ns pkg) |/ def-name
              str ns |/ def-name
          :examples $ []
          :schema $ quote $ Fn (List String) String (-> String)
          :tests $ [] $ %{} 'TestEntry (:name |preserves-external-namespace)
            :code $ quote $ do
              assert= |.main/start $ str-def-entry ([] |app.main |start) |app
              assert= |respo.core/render! $ str-def-entry ([] |respo.core |render!) |app
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.deps-tree
          :require
            phlox.core :refer $ defcomp >> hslx hclx rect circle text container graphics create-list g polyline line-segments
            phlox.comp.button :refer $ comp-button
            phlox.comp.drag-point :refer $ comp-drag-point
            phlox.comp.slider :refer $ comp-slider
            app.math :refer $ divide-path multiply-path
            app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius twist-distance
            phlox.complex :as complex
            pointed-prompt.core :refer $ prompt-at!
            phlox.util :refer $ measure-text-width!
            app.analyze :refer $ dependency-key
    'app.comp.editor $ %{} 'FileEntry
      :defs $ {}
        'LayoutInfo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct LayoutInfo (:tree phlox.schema/PhloxElement) (:width Number) (:y-stack Number)
            :winding-x $ Option Number
          :examples $ []
          :schema $ quote StructDef
        'RegexHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait RegexHost
            .test $ Fn RegexHost String $ -> Bool
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object)
          :schema $ quote Trait
        'all-block? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn all-block? (item) (every? item list?)
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (-> Bool)
        'as-list $ %{} 'CodeEntry
          :doc "|Treat one syntax tree item as a list after its leaf case has been ruled out."
          :code $ quote $ defn as-list (item)
            decode-map-as item $ List Dynamic
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ List Dynamic
        'base-dot $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def base-dot
            {} (:radius dot-radius) (:alpha 1)
              :position $ [] 0 0
          :examples $ []
          :schema $ quote $ Map Tag Dynamic
        'char-keymap $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn char-keymap (key)
            match key (|: |;) (|; |:) (|\ ||) (|| |\) (_ key)
          :examples $ []
          :schema $ quote $ Fn String (-> String)
        'comp-editor $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-editor (entry focus def-path pkg)
            let
                item $ schema/entry-tree entry
                info $ cond
                    is-linear? $ as-list item
                    wrap-linear-expr (as-list item) ([]) focus false
                  (with-linear? (as-list item))
                    wrap-expr-with-linear (as-list item) ([]) focus true false 0
                  true $ wrap-block-expr (as-list item) ([]) focus
              container
                {} $ :on-keyboard $ {}
                  :down $ fn (e d!)
                    hint-fn $ Fn (Map Tag Dynamic)
                      Fn schema/Op $ -> Unit
                      -> Unit
                      :features :js-ffi
                    let
                        key $ decode-map-as
                          .unwrap-or (app.schema/event-field e :key) |
                          , 'String
                        event $ browser/keyboard-event-host $ .unwrap (app.schema/event-field e :event)
                        meta? $ decode-map-as
                          .unwrap-or (app.schema/event-field e :meta?) false
                          , 'Bool
                        body $ .unwrap $ browser/document-body
                        target-is-body? $ match
                          js-nullish->option $ event :target
                          (:some target) (identical? body target)
                          (:none) false
                      when (= |Tab key) (event .prevent-default!) (event .stop-propagation!) (browser/element-focus! body)
                      when
                        and
                          not $ and meta? $ = |Tab key
                          , target-is-body?
                        match (app.schema/path-value item focus)
                          (:none) &unit
                          (:some target)
                            cond
                                list? target
                                handle-expr-event focus def-path (dissoc e :event) d!
                              (string? target)
                                handle-leaf-event focus def-path target (dissoc e :event) d!
                              true $ js/console.error "|unknown target" target
                    , &unit
                info :tree
          :examples $ []
          :schema $ quote $ Fn Dynamic (List Number) (List Dynamic) String (-> phlox.schema/PhloxElement) (:features :js-ffi)
        'comp-error $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-error (ys)
            circle
              {}
                :position $ [] 0 0
                :radius 10
                :fill 0xff0000
              text $ {}
                :text $ format-cirru-edn ys
                :position $ [] 0 0
                :style $ {} (:fill |red) (:font-size 10) (:font-family "|Roboto Mono")
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> phlox.schema/PhloxElement)
        'event-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn event-position (event)
            let
                raw $ .-global event
              if (js-present? raw)
                let
                    point $ unsafe-coerce raw 'phlox.core/PixiVectorHost
                  []
                    decode-map-as (point :x) 'Number
                    decode-map-as (point :y) 'Number
                raise "|Expected a Pixi global point"
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ List Number
            :features :js-ffi
        'handle-expr-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-expr-event (focus def-path e d!)
            let
                key $ decode-map-as
                    app.schema/event-field e :key
                    , .unwrap-or |
                  , 'String
                meta? $ decode-map-as
                  or
                      app.schema/event-field e :meta?
                      , .unwrap-or false
                    (app.schema/event-field e :ctrl?) .unwrap-or false
                  , 'Bool
                shift? $ decode-map-as
                    app.schema/event-field e :shift?
                    , .unwrap-or false
                  , 'Bool
              cond
                  = |Backspace key
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :remove-node focus
                (= key |ArrowUp)
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :node-up focus
                (= key |ArrowLeft)
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :node-left focus
                (= key |ArrowRight)
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :node-right focus
                (= key |ArrowDown)
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :expression-down focus
                (= key |Enter)
                  if meta?
                    if shift?
                      d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :append-expression focus
                      d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :prepend-expression focus
                    if shift?
                      d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :before-expression focus
                      d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :after-expression focus
                (= key "| ")
                  if shift?
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :before-token focus
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :after-token focus
                (= |Tab key)
                  if shift?
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :unfold-expression focus
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :fold-node focus
                (and meta? (= |b key))
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :duplicate-expression focus
                (and meta? (= |c key))
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :command-copy focus
                (and meta? (= |x key))
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :command-cut focus
                (and meta? (= |v key))
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :command-paste focus
                (and meta? (= |e key))
                  d! $ app.schema/Op :def-path $ []
                    decode-map-as
                      .unwrap $ first def-path
                      , 'String
                    , :ns
                true $ ;nil js/console.log "|unknown event:" e
            , &unit
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Dynamic) (Map Tag Dynamic)
            Fn schema/Op $ -> Unit
            -> Unit
            :features :js-ffi
        'handle-leaf-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-leaf-event (focus def-path token e d!)
            let
                key $ decode-map-as
                    app.schema/event-field e :key
                    , .unwrap-or |
                  , 'String
                code $ decode-map-as
                    app.schema/event-field e :key-code
                    , .unwrap-or 0
                  , 'Number
                meta? $ decode-map-as
                  or
                      app.schema/event-field e :meta?
                      , .unwrap-or false
                    (app.schema/event-field e :ctrl?) .unwrap-or false
                  , 'Bool
                shift? $ decode-map-as
                    app.schema/event-field e :shift?
                    , .unwrap-or false
                  , 'Bool
              cond
                  = |Backspace key
                  if
                    or meta? $ empty? token
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :remove-node focus
                    d! $ app.schema/Op :call-cirru-edit $ app.schema/update-token-op focus
                      &str:slice token 0 $ dec $ count token
                (and (>= code 65) (<= code 90) (not meta?))
                  d! $ app.schema/Op :call-cirru-edit $ app.schema/update-token-op focus (str token key)
                (= key |ArrowUp)
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :node-up focus
                (= key |ArrowLeft)
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :node-left focus
                (= key |ArrowRight)
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :node-right focus
                (= key |ArrowDown) (js/console.warn "|unknown keydown")
                (= key |Enter)
                  if shift?
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :before-token focus
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :after-token focus
                (= key "| ")
                  if shift?
                    d! $ app.schema/Op :call-cirru-edit $ app.schema/update-token-op focus (str token "| ")
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :after-token focus
                (= |Tab key)
                  if shift?
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :unfold-token focus
                    d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :fold-node focus
                (= key |d)
                  d! $ app.schema/Op :effect-goto-def $ strip-at token
                (and meta? (= |v key))
                  d! $ app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :command-paste focus
                (and meta? (= |e key))
                  d! $ app.schema/Op :def-path $ []
                    decode-map-as
                      .unwrap $ first def-path
                      , 'String
                    , :ns
                (and (= 1 (count key)) (not meta?))
                  d! $ app.schema/Op :call-cirru-edit $ app.schema/update-token-op focus
                    str token $ char-keymap key
                true $ ;nil js/console.warn "|unknown event:" e
            , &unit
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Dynamic) String (Map Tag Dynamic)
            Fn schema/Op $ -> Unit
            -> Unit
            :features :js-ffi
          :tests $ [] $ %{} 'TestEntry (:name |keyboard-produces-current-enum-operations)
            :code $ quote $ let
                events $ ref $ decode-map-as ([]) (List app.schema/Op)
                capture $ fn (operation)
                  hint-fn $ Fn schema/Op $ -> Unit
                  swap! events conj operation
                  , &unit
                focus $ [] 1
                path $ [] |app.demo :defs |main
              handle-leaf-event focus path |abc
                {} (:key |Enter) (:key-code 13)
                , capture
              handle-expr-event focus path
                {} (:key |Enter) (:meta? true) (:shift? true)
                , capture
              handle-leaf-event focus path |abc
                {} (:key |Backspace) (:key-code 8)
                , capture
              handle-leaf-event focus path |abc
                {} (:key |e) (:key-code 69) (:meta? true)
                , capture
              assert=
                []
                  app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :after-token focus
                  app.schema/Op :call-cirru-edit $ cirru-editor.schema/EditOp :append-expression focus
                  app.schema/Op :call-cirru-edit $ app.schema/update-token-op focus |ab
                  app.schema/Op :def-path $ [] |app.demo :ns
                , @events
        'is-linear? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn is-linear? (xs)
            cond
                empty? xs
                , true
              (= 1 (count xs))
                let
                    x0 $ .unwrap $ first xs
                  if (string? x0) true $ recur $ decode-map-as x0 (List Dynamic)
              true $ let
                  x0 $ .unwrap $ first xs
                if (string? x0)
                  recur $ rest xs
                  , false
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (-> Bool)
          :tests $ [] $ %{} 'TestEntry (:name |keeps-nested-linear-and-block-layout)
            :code $ quote $ do
              assert= true $ is-linear? $ [] |a |b
              assert= true $ is-linear? $ [] ([] |a |b)
              assert= false $ is-linear? $ [] ([] |a) |b
              assert= true $ with-linear? $ [] ([] |a) |b
              assert= true $ all-block? $ [] ([] |a) ([] |b)
        'on-expr-click $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-expr-click (e code coord d!)
            if
              or
                decode-map-as (.-metaKey e) 'Bool
                decode-map-as (.-ctrlKey e) 'Bool
              prompt-at! (event-position e)
                {} (:textarea? true)
                  :initial $ format-cirru $ [] code
                  :style $ {} $ :font-family code-font
                fn (content)
                  hint-fn $ Fn String $ -> Unit
                  match
                    first $ parse-cirru-list content
                    (:some tree)
                      d! $ app.schema/replace-node-op coord tree
                    (:none)
                      d! $ app.schema/Op :warn "|Empty expression; existing code was not changed"
                  , &unit
              d! $ app.schema/Op :focus-or-pick coord
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic (List Dynamic) (List Number)
            Fn schema/Op $ -> Unit
            -> Unit
            :features :js-ffi
        'pattern-number $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn pattern-number () (new js/RegExp "|^-?\\d+(\\.\\d+)?$")
          :examples $ []
          :schema $ quote $ Fn (-> JsObject) (:features :js-ffi)
        'pick-leaf-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn pick-leaf-color (s head?)
            let
                first-char $
                  get s 0
                  , .unwrap-or |
              cond
                  or (= s |true) (= s |false) (= s |nil) (= s |;) (= s |&)
                  hslx 300 100 33
                (= | s) (hslx 190 50 50)
                (= "|\"" first-char) (hslx 70 50 40)
                (= || first-char) (hslx 70 50 40)
                (= |: first-char) (hslx 240 90 74)
                (= |. first-char) (hslx 100 100 70)
                (.!test (unsafe-coerce (pattern-number) RegexHost) s)
                  hslx 330 100 40
                head? $ hslx 160 70 76
                true $ hslx 190 50 50
          :examples $ []
          :schema $ quote $ Fn String Bool (-> Number) (:features :js-ffi)
        'shape-focus $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def shape-focus
            circle $ {}
              :radius $ + dot-radius 2
              :position $ [] 0 0
              :line-style $ {} (:width 1)
                :color $ hslx 60 80 80
                :alpha 0.8
          :examples $ []
          :schema $ quote phlox.schema/PhloxElement
        'style-active-line $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-active-line
            {} (:width 2) (:alpha 1)
              :color $ hslx 20 100 70
          :examples $ []
          :schema $ quote $ Map Tag Number
        'style-shadow-line $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-shadow-line
            {} (:width 1) (:alpha 0.7)
              :color $ hslx 200 70 54
          :examples $ []
          :schema $ quote $ Map Tag Number
        'with-linear? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn with-linear? (xs)
            cond
                empty? xs
                , true
              (= 1 (count xs))
                , true
              true $ let
                  x0 $ .unwrap $ first xs
                if (string? x0)
                  recur $ rest xs
                  if
                    is-linear? $ decode-map-as x0 $ List Dynamic
                    recur $ rest xs
                    , false
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (-> Bool)
        'wrap-block-expr $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn wrap-block-expr (xs coord focus)
            loop
                acc $ []
                ys xs
                x-position 0
                y-stack 0
                idx 0
                prev-width 0
                winding-x None
                prev-leaf? false
              hint-fn $ Fn
                List $ List Dynamic
                List Dynamic
                , Number Number Number Number (Option Number) Bool (-> LayoutInfo) (:features :js-ffi)
              if (empty? ys)
                LayoutInfo :tree
                  let
                      focused? $ = coord focus
                    container ({})
                      polyline $ {}
                        :style $ if focused? style-active-line style-shadow-line
                        :position $ [] 0 0
                        :points $ [] ([] 0 0) ([] leaf-gap 0)
                          [] leaf-gap $ * line-height $ &max 0 (dec y-stack)
                      rect $ {} (:angle 45)
                        :size $ [] (* 2 dot-radius) (* 2 dot-radius)
                        :pivot $ [] dot-radius dot-radius
                        :alpha 1
                        :fill $ hslx 120 100 70
                        :on $ {} $ :pointertap
                          fn (e d!)
                            hint-fn $ Fn Dynamic
                              Fn schema/Op $ -> Unit
                              -> Unit
                            on-expr-click e xs coord d!
                      if focused? shape-focus $ container $ {}
                      create-list :container ({}) acc
                  , :width x-position :y-stack y-stack :winding-x winding-x
                if
                  and prev-leaf? $ match (first ys)
                    (:some head) (string? head)
                    (:none) false
                  let
                      item $ .unwrap $ first ys
                      next-coord $ conj coord idx
                      info $ wrap-leaf (decode-map-as item 'String) next-coord focus $ = idx 0
                      width $ info :width
                      tree $ info :tree
                      offset $ + x-position leaf-gap
                    recur
                      conj acc $ [] idx $ container
                        {} $ :position $ [] offset
                          * (dec y-stack) line-height
                        , tree
                      rest ys
                      + width offset
                      , y-stack (inc idx) (+ width offset)
                        if (= 0 idx) (info :winding-x) winding-x
                        , true
                  let
                      item $ .unwrap $ first ys
                      next-coord $ conj coord idx
                      info $ cond
                          string? item
                          wrap-leaf (decode-map-as item 'String) next-coord focus $ = idx 0
                        (is-linear? (as-list item))
                          wrap-linear-expr (as-list item) next-coord focus false
                        (and (with-linear? (as-list item)) (not (all-block? (as-list item))))
                          wrap-expr-with-linear (as-list item) next-coord focus true false 0
                        true $ wrap-block-expr (as-list item) next-coord focus
                      width $ info :width
                      tree $ info :tree
                      next-y-stack $ if
                        match (info :winding-x)
                          (:some _) true
                          (:none) false
                        if
                          >
                            .unwrap-or (info :winding-x) 0
                            + leaf-gap prev-width
                          , y-stack $ inc y-stack
                        , y-stack
                    recur
                      conj acc $ [] idx $ container
                        {} $ :position $ [] leaf-gap (* next-y-stack line-height)
                        , tree
                          ; text $ {}
                            :text $ str $ [] prev-width (info :winding-x) width
                            :position $ [] 0 -8
                            :rotation -0.4
                            :style $ {} (:fill |red) (:font-size 8) (:font-family "|Source Code Pro, monospace")
                      rest ys
                      + leaf-gap width
                      + next-y-stack $ info :y-stack
                      inc idx
                      , width
                        if (= 0 idx) (info :winding-x) winding-x
                        string? item
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (List Number) (List Number) (-> LayoutInfo) (:features :js-ffi)
        'wrap-expr-with-linear $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn wrap-expr-with-linear (xs coord focus parent-winding-okay? smaller? acc-x)
            loop
                acc $ []
                ys xs
                x-position leaf-gap
                y-stack 1
                y-stack-max 1
                y-stack-extend-x 0
                idx 0
                winding-okay? parent-winding-okay?
                winding-x None
              hint-fn $ Fn
                List $ List Dynamic
                List Dynamic
                , Number Number Number Number Number Bool (Option Number) (-> LayoutInfo) (:features :js-ffi)
              if (empty? ys)
                LayoutInfo :tree
                  let
                      focused? $ = coord focus
                    container ({})
                      polyline $ {}
                        :style $ if focused? style-active-line style-shadow-line
                        :position $ [] 0 0
                        :points $ [] ([] 0 0) ([] x-position 0)
                      if smaller?
                        container $ {}
                        circle $ merge base-dot $ {}
                          :fill $ hslx 10 60 50
                          :on $ {} $ :pointertap
                            fn (e d!)
                              hint-fn $ Fn Dynamic
                                Fn schema/Op $ -> Unit
                                -> Unit
                              on-expr-click e xs coord d!
                      if
                        and focused? $ not smaller?
                        , shape-focus $ container $ {}
                      create-list :container ({}) (reverse acc)
                  , :width x-position :y-stack y-stack-max :winding-x winding-x
                let
                    item $ .unwrap $ first ys
                    next-coord $ conj coord idx
                  cond
                      string? item
                      let
                          info $ wrap-leaf item next-coord focus $ = idx 0
                          width $ info :width
                          tree $ info :tree
                        recur
                          conj acc $ [] idx $ container
                            {} $ :position $ [] x-position 0
                            , tree
                          rest ys
                          + x-position width leaf-gap
                          if
                            > (+ x-position width leaf-gap) y-stack-extend-x
                            , 1 y-stack
                          , y-stack-max y-stack-extend-x (inc idx) winding-okay? winding-x
                    (and winding-okay? (is-linear? (as-list item)) (not= 1 (count ys)))
                      let
                          focused? $ = next-coord focus
                          info $ wrap-linear-expr (as-list item) next-coord focus true
                          width $ info :width
                        recur
                          conj acc $ [] idx $ container
                            {} $ :position $ [] x-position 0
                            polyline $ {}
                              :style $ if focused? style-active-line style-shadow-line
                              :position $ [] 0 0
                              :points $ [] ([] 0 0)
                                [] 0 $ * -1 line-height
                            circle $ merge base-dot $ {}
                              :fill $ hslx 180 60 40
                              :on $ {} $ :pointertap
                                fn (e d!)
                                  hint-fn $ Fn Dynamic
                                    Fn schema/Op $ -> Unit
                                    -> Unit
                                  on-expr-click e (as-list item) next-coord d!
                            if focused? shape-focus $ container $ {}
                            container
                              {} $ :position $ [] 0 (* -1 line-height)
                              info :tree
                          rest ys
                          + x-position leaf-gap
                          , y-stack y-stack-max
                            &max y-stack-extend-x $ + x-position $ info :width
                            inc idx
                            , false $ Some x-position
                    (and (is-linear? (as-list item)) (not= 1 (count ys)))
                      let
                          focused? $ = next-coord focus
                          info $ wrap-linear-expr (as-list item) next-coord focus true
                          width $ info :width
                        recur
                          conj acc $ [] idx $ container
                            {} $ :position $ [] x-position 0
                            polyline $ {}
                              :style $ if focused? style-active-line style-shadow-line
                              :position $ [] 0 0
                              :points $ [] ([] 0 0)
                                [] 0 $ * y-stack line-height
                            circle $ merge base-dot $ {}
                              :fill $ hslx 160 100 30
                              :on $ {} $ :pointertap
                                fn (e d!)
                                  hint-fn $ Fn Dynamic
                                    Fn schema/Op $ -> Unit
                                    -> Unit
                                  on-expr-click e (as-list item) next-coord d!
                            if (= next-coord focus) shape-focus $ container $ {}
                            container
                              {} $ :position $ [] 0 (* y-stack line-height)
                              info :tree
                          rest ys
                          + x-position leaf-gap
                          inc y-stack
                          &max y-stack-max $ inc y-stack
                          &max y-stack-extend-x $ + x-position leaf-gap $ info :width
                          inc idx
                          , false winding-x
                    (and (= 1 (count ys)) (and (> y-stack 1) (is-linear? (as-list item))))
                      let
                          info $ wrap-linear-expr (as-list item) next-coord focus false
                          width $ info :width
                        recur
                          conj acc $ [] idx $ container
                            {} $ :position $ [] x-position 0
                            info :tree
                          rest ys
                          + x-position width leaf-gap
                          &max y-stack $ info :y-stack
                          &max y-stack-max $ &max y-stack $ info :y-stack
                          , y-stack-extend-x (inc idx) winding-okay? winding-x
                    (and (= 1 (count ys)) (&= y-stack 1))
                      let
                          info $ cond
                              is-linear? $ as-list item
                              wrap-linear-expr (as-list item) next-coord focus false
                            (and (with-linear? (as-list item)) (not (all-block? (as-list item))))
                              wrap-expr-with-linear (as-list item) next-coord focus winding-okay? false $ + acc-x x-position
                            true $ wrap-block-expr (as-list item) next-coord focus
                          width $ info :width
                        recur
                          conj acc $ [] idx $ container
                            {} $ :position $ [] x-position 0
                            info :tree
                          rest ys
                          + x-position width leaf-gap
                          &max y-stack $ info :y-stack
                          &max y-stack-max $ &max y-stack $ info :y-stack
                          , y-stack-extend-x (inc idx) winding-okay? $ match winding-x
                            (:some _) winding-x
                            (:none)
                              match (info :winding-x)
                                (:some x)
                                  Some $ + x-position x
                                (:none) None
                    (and (> acc-x twist-distance) (= 1 (count ys)))
                      let
                          info $ cond
                              and
                                with-linear? $ as-list item
                                not $ all-block? $ as-list item
                              wrap-expr-with-linear (as-list item) next-coord focus winding-okay? true $ + acc-x x-position $ negate twist-distance
                            true $ wrap-block-expr (as-list item) next-coord focus
                          width $ info :width
                        recur
                          conj acc $ [] idx $ let
                              focused? $ = next-coord focus
                            container
                              {} $ :position $ [] x-position 0
                              polyline $ {}
                                :style $ if focused? style-active-line style-shadow-line
                                :position $ [] 0 0
                                :points $ [] ([] 0 0)
                                  [] 0 $ * y-stack line-height
                                  [] (negate twist-distance) (* y-stack line-height)
                                  [] (negate twist-distance)
                                    * (inc y-stack) line-height
                              circle $ merge base-dot $ {}
                                :fill $ hslx 300 100 30
                                :on $ {} $ :pointertap
                                  fn (e d!)
                                    hint-fn $ Fn Dynamic
                                      Fn schema/Op $ -> Unit
                                      -> Unit
                                    on-expr-click e (as-list item) next-coord d!
                              if focused? shape-focus $ container $ {}
                              container
                                {} $ :position $ [] (negate twist-distance)
                                  * (inc y-stack) line-height
                                info :tree
                          rest ys
                          + x-position width leaf-gap
                          + y-stack (info :y-stack) 1
                          &max y-stack-max $ inc $ + y-stack (info :y-stack)
                          , y-stack-extend-x (inc idx) winding-okay? winding-x
                    (= 1 (count ys))
                      let
                          info $ cond
                              and
                                with-linear? $ as-list item
                                not $ all-block? $ as-list item
                              wrap-expr-with-linear (as-list item) next-coord focus winding-okay? true $ + acc-x x-position
                            true $ assoc
                              wrap-block-expr (as-list item) next-coord focus
                              , :width 0
                          width $ info :width
                        recur
                          conj acc $ [] idx $ let
                              focused? $ = next-coord focus
                            container
                              {} $ :position $ [] x-position 0
                              polyline $ {}
                                :style $ if focused? style-active-line style-shadow-line
                                :position $ [] 0 0
                                :points $ [] ([] 0 0)
                                  [] 0 $ * y-stack line-height
                              circle $ merge base-dot $ {}
                                :fill $ hslx 300 100 30
                                :on $ {} $ :pointertap
                                  fn (e d!)
                                    hint-fn $ Fn Dynamic
                                      Fn schema/Op $ -> Unit
                                      -> Unit
                                    on-expr-click e (as-list item) next-coord d!
                              if focused? shape-focus $ container $ {}
                              container
                                {} $ :position $ [] 0 (* y-stack line-height)
                                info :tree
                          rest ys
                          + x-position width leaf-gap
                          + y-stack $ info :y-stack
                          &max y-stack-max $ + y-stack $ info :y-stack
                          , y-stack-extend-x (inc idx) winding-okay? winding-x
                    true $ LayoutInfo :tree
                      create-list :container ({})
                        conj acc $ [] idx $ comp-error ys
                      , :width x-position :y-stack y-stack :winding-x None
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (List Number) (List Number) Bool Bool Number (-> LayoutInfo) (:features :js-ffi)
        'wrap-leaf $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn wrap-leaf (s coord focus head?)
            let
                width $ measure-text-width! s 14 "|Roboto Mono"
                height leaf-height
              LayoutInfo :tree
                container
                  {} $ :position $ [] -4 0
                  rect $ {} (:alpha 0.8)
                    :position $ [] 0 $ * -0.5 height
                    :size $ [] (+ width 8) height
                    :fill $ hslx 190 70 10
                    :line-style $ {} (:width 1) (:alpha 0.2)
                      :color $ hslx 60 80 100
                    :on $ {} $ :pointertap
                      fn (e d!)
                        hint-fn $ Fn Dynamic
                          Fn schema/Op $ -> Unit
                          -> Unit
                          :features :js-ffi
                        if
                          or
                            decode-map-as (.-metaKey e) 'Bool
                            decode-map-as (.-ctrlKey e) 'Bool
                          prompt-at! (event-position e)
                            {} (:initial s)
                              :style $ {} $ :font-family code-font
                            fn (content)
                              d! $ app.schema/replace-node-op coord content
                          d! $ app.schema/Op :focus-or-pick coord
                        , &unit
                  if (= coord focus)
                    rect $ {}
                      :position $ [] 0 $ * -0.5 height
                      :size $ [] (+ width 8) height
                      :alpha 0.8
                      :line-style $ {} (:width 1)
                        :color $ hslx 60 80 80
                        :alpha 0.8
                    container $ {}
                  text $ {} (:text s)
                    :position $ [] 4 -8
                    :style $ {}
                      :fill $ pick-leaf-color s head?
                      :font-size 14
                      :font-family "|Roboto Mono"
                , :width width :y-stack 1 :winding-x None
          :examples $ []
          :schema $ quote $ Fn String (List Number) (List Number) Bool (-> LayoutInfo) (:features :js-ffi)
        'wrap-linear-expr $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn wrap-linear-expr (xs coord focus smaller?)
            loop
                acc $ []
                ys xs
                x-position leaf-gap
                y-stack 1
                idx 0
              if (empty? ys)
                LayoutInfo :tree
                  let
                      focused? $ = coord focus
                    container ({})
                      polyline $ {}
                        :style $ if focused? style-active-line style-shadow-line
                        :position $ [] 0 0
                        :points $ [] ([] 0 0) ([] x-position 0)
                      if smaller?
                        container $ {}
                        circle $ merge base-dot $ {}
                          :fill $ hslx 260 80 60
                          :on $ {} $ :pointertap
                            fn (e d!)
                              hint-fn $ Fn Dynamic
                                Fn schema/Op $ -> Unit
                                -> Unit
                              on-expr-click e xs coord d!
                      if
                        and focused? $ not smaller?
                        , shape-focus $ container $ {}
                      create-list :container ({}) acc
                  , :width x-position :y-stack y-stack :winding-x None
                let
                    item $ .unwrap $ first ys
                    next-coord $ conj coord idx
                    info $ cond
                        string? item
                        wrap-leaf item next-coord focus $ = idx 0
                      (is-linear? (as-list item))
                        wrap-linear-expr (as-list item) next-coord focus false
                      true $ LayoutInfo :tree (comp-error item) :width 20 :y-stack 1 :winding-x None
                    width $ info :width
                    tree $ info :tree
                  recur
                    conj acc $ [] idx $ container
                      {} $ :position $ [] x-position 0
                      , tree
                    rest ys
                    + x-position width leaf-gap
                    &max y-stack $ info :y-stack
                    inc idx
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (List Number) (List Number) Bool (-> LayoutInfo) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.editor
          :require
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
            app.schema :as schema
            js-ffi.browser :as browser
    'app.comp.key-event $ %{} 'FileEntry
      :defs $ {}
        'comp-key-event $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-key-event (on-event)
            [] (effect-listen-keyboard)
              span $ {} $ :on-keydown
                fn (e d!)
                  hint-fn $ Fn respo.schema/RespoEvent
                    Fn app.schema/Op $ -> Unit
                    -> Unit
                  on-event e d!
          :examples $ []
          :schema $ quote $ Fn
            Fn respo.schema/RespoEvent
              Fn app.schema/Op $ -> Unit
              -> Unit
            -> respo.schema/Component
        'effect-listen-keyboard $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defeffect effect-listen-keyboard () (action el at?)
            let
                element $ browser/element-host el
                stored $ aget el |_dirtyEventListener
                handler $ if (js-present? stored) (browser/event-listener-host stored)
                  fn (event)
                    hint-fn $ Fn browser/EventHost (-> Unit) (:features :js-ffi)
                    let
                        keyboard $ browser/keyboard-event-host event
                        key $ keyboard :key
                      when
                        and
                          or (= |p key) (= |s key) (= |d key) (= |i key)
                          or (keyboard :ctrl-key?) (keyboard :meta-key?)
                        event .prevent-default!
                      browser/element-dispatch-event! element $ browser/event-host $ new js/KeyboardEvent (keyboard :event-type) keyboard
                    , &unit
              aset el |_dirtyEventListener handler
              match action
                :mount $ browser/add-event-listener! |keydown handler
                :unmount $ browser/remove-event-listener! |keydown handler
                _ &unit
          :examples $ []
          :schema $ quote $ Fn (-> respo.schema/Effect) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.key-event
          :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ space-x space-y
            app.config :refer $ dev? api-host
            js-ffi.browser :as browser
    'app.comp.nav $ %{} 'FileEntry
      :defs $ {}
        'comp-files-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-files-entry (cursor state files on-close)
            let
                typed-files files
                selected-ns $ get state :ns
              div
                {} $ :class-name $ str-spaced css/expand css/row
                list->
                  {} $ :class-name css/expand
                  -> (keys typed-files) &set:to-list sort $ map $ fn (ns)
                    [] ns $ div
                      {} (:class-name css-hover-entry)
                        :style $ merge $ if
                          = selected-ns $ Some ns
                          {} $ :background-color $ hsl 0 0 100
                          {}
                        :on-click $ fn (e d!)
                          d! $ :: :states cursor $ assoc state :ns ns
                      <> $ str ns
                space-x 8
                if-let
                  ns $ get state :ns
                  if-let
                    file $ get typed-files $ str ns
                    let
                        defs0 $
                          get (schema/entry-fields file) :defs
                          , .unwrap-or $ {}
                        defs $ decode-map-as defs0 $ Map String Dynamic
                      div
                        {} $ :class-name css/expand
                        div
                          {}
                            :style $ {} $ :cursor :pointer
                            :on-click $ fn (e d!)
                              d! $ app.schema/Op :def-path $ decode-map-as ([] ns :ns) (List app.schema/DefinitionPathPart)
                          <> (str ns)
                            {} $ :font-family ui/font-code
                        space-y 8
                        list-> ({})
                          -> defs keys &set:to-list sort $ map $ fn (def-name)
                            [] def-name $ div
                              {} (:class-name css-hover-entry)
                                :style $ merge $ {} (:font-family ui/font-code) (:cursor :pointer) (:line-height 2) (:padding "|0 8px")
                                :on-click $ fn (e d!)
                                  hint-fn $ Fn respo.schema/RespoEvent
                                    Fn schema/Op $ -> Unit
                                    -> Unit
                                  d! $ app.schema/Op :def-path $ decode-map-as ([] ns :defs def-name) (List app.schema/DefinitionPathPart)
                                  on-close d!
                              <> $ str def-name
                    <> |
                  <> |
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (Map Tag Dynamic) (Map String Dynamic)
            Fn
              Fn schema/Op $ -> Unit
              -> Unit
            -> respo.schema/Component
        'comp-menu $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-menu (states files on-close)
            let
                cursor $ decode-map-as
                  .unwrap-or (get states :cursor) ([])
                  List Dynamic
                state $ decode-map-as
                  .unwrap-or (get states :data)
                    {} (:ns nil) (:query |) (:select-idx 0)
                  Map Tag Dynamic
                query $ decode-map-as
                  .unwrap-or (get state :query) |
                  , 'String
                select-idx $ decode-map-as
                  .unwrap-or (get state :select-idx) 0
                  , 'Number
                entries $ search-entries files query
              [] (effect-focus |#query-box)
                div
                  {} $ :class-name $ str-spaced css/column css-menu
                  div
                    {} $ :class-name css/row-parted
                    input $ {} (:id |query-box) (:class-name css-query-box) (:value query)
                      :on-input $ fn (e d!)
                        d! $ :: :states cursor $ merge state
                          {}
                            :query $ str $
                              app.schema/event-field e :value
                              , .unwrap-or |
                            :select-idx 0
                      :autofocus true
                      :on-keydown $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn schema/Op $ -> Unit
                          -> Unit
                        match
                            app.schema/event-field e :key
                            , .unwrap-or |
                          |ArrowDown $ d! $ :: :states cursor
                            assoc state :select-idx $ if
                              >= (inc select-idx) (count entries)
                              , select-idx $ inc select-idx
                          |ArrowUp $ d! $ :: :states cursor
                            assoc state :select-idx $ if (> select-idx 0) (dec select-idx) 0
                          |Enter $ if-let
                            target $ get entries select-idx
                            do
                              d! $ app.schema/Op :def-path $ decode-map-as target (List app.schema/DefinitionPathPart)
                              on-close d!
                              d! $ :: :states cursor $ assoc state :query |
                          |Escape $ on-close d!
                          _ &unit
                        , &unit
                    a $ {} (:inner-text "|×")
                      :style $ merge ui/link $ {} (:font-size 24) (:font-weight 100) (:text-decoration :none)
                        :color $ hsl 0 100 30
                      :on-click $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn schema/Op $ -> Unit
                          -> Unit
                        on-close d!
                  space-y 8
                  if (blank? query) (comp-files-entry cursor state files on-close) (comp-search-entry cursor state entries select-idx on-close)
          :examples $ []
          :schema $ quote $ Fn (Map Dynamic Dynamic) (Map String Dynamic)
            Fn
              Fn schema/Op $ -> Unit
              -> Unit
            -> respo.schema/Component
        'comp-navbar $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-navbar (store states)
            let
                cursor $ decode-map-as
                    get states :cursor
                    , .unwrap-or $ []
                  List Dynamic
                state $ decode-map-as
                    get states :data
                    , .unwrap-or $ {} $ :menu? true
                  Map Tag Dynamic
                command-plugin $ use-modal (>> states :command-modal)
                  {}
                    :style $ {} $ :max-width |80vw
                    :container-style $ {}
                    :backdrop-style $ {}
                    :render $ fn (on-close)
                      hint-fn $ Fn
                        Fn
                          Fn schema/Op $ -> Unit
                          -> Unit
                        -> respo.schema/Component
                      comp-command (>> states :command) store on-close
                editor $ decode-map-as
                    get store :editor
                    , .unwrap-or $ {}
                  Map Tag Dynamic
                router $ decode-map-as
                    get store :router
                    , .unwrap-or $ {}
                  Map Tag Dynamic
                warning $ match (get store :warning)
                  (:some value)
                    if (nil? value) | $ decode-map-as value 'String
                  (:none) |
              div ({})
                div
                  {} $ :class-name $ str-spaced css/row-parted css-navbar
                  span $ {} (:class-name css-hover-entry)
                    :style $ {} (:cursor :pointer) (:padding "|4px 8px") (:font-family "|Josefin Sans")
                      :color $ hsl 200 80 70
                    :inner-text |Hovernia
                    :on-click $ fn (e d!)
                      hint-fn $ Fn respo.schema/RespoEvent
                        Fn schema/Op $ -> Unit
                        -> Unit
                      d! $ :: :states cursor $ assoc state :menu? true
                      d! $ app.schema/Op :router $ {} (:name :editor)
                      match (app.schema/event-field e :event)
                        (:some event) (.!preventDefault event)
                        (:none) &unit
                      , &unit
                  div ({})
                    if
                      not $ identical?
                          get store :files
                          , .unwrap-or $ {}
                        (get store :saved-files) .unwrap-or $ {}
                      Some $ a $ {} (:inner-text |Save)
                        :class-name $ str-spaced css/link css/font-fancy
                        :on-click $ fn (e d!)
                          hint-fn $ Fn respo.schema/RespoEvent
                            Fn schema/Op $ -> Unit
                            -> Unit
                          on-save
                            decode-map-as
                                get store :files
                                , .unwrap-or $ {}
                              Map String Dynamic
                            decode-map-as
                                get store :saved-files
                                , .unwrap-or $ {}
                              Map String Dynamic
                            , d!
                      , None
                    space-x 8
                    a $ {} (:inner-text |Command)
                      :class-name $ str-spaced css/link css/font-fancy
                      :on-click $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn schema/Op $ -> Unit
                          -> Unit
                        .show command-plugin d!
                        , &unit
                if
                    get state :menu?
                    , .unwrap-or false
                  Some $ memof1-call comp-menu (>> states :menu)
                    decode-map-as
                        get store :files
                        , .unwrap-or $ {}
                      Map String Dynamic
                    fn (d!)
                      d! $ :: :states cursor $ assoc state :menu? false
                  , None
                if
                  not $ blank? warning
                  Some $ div
                    {} $ :class-name $ str-spaced css/row-middle css-notice-area
                    div
                      {} (:style style-error)
                        :on-click $ fn (e d!)
                          hint-fn $ Fn respo.schema/RespoEvent
                            Fn schema/Op $ -> Unit
                            -> Unit
                          d! $ app.schema/Op :ok
                      <> warning
                    space-x 16
                    a $ {} (:class-name css/link) (:inner-text "|Try 6011")
                      :on-click $ fn (e d!)
                        hint-fn $ Fn respo.schema/RespoEvent
                          Fn schema/Op $ -> Unit
                          -> Unit
                        load-files! d! true
                        , &unit
                  , None
                if
                  and
                    = :editor $
                      get router :name
                      , .unwrap-or :editor
                    not $
                      get state :menu?
                      , .unwrap-or false
                  Some $ comp-stack
                    decode-map-as
                        get editor :stack
                        , .unwrap-or $ []
                      List $ List Dynamic
                    decode-map-as
                        get editor :pointer
                        , .unwrap-or 0
                      , 'Number
                  , None
                if
                    get editor :picker-mode?
                    , .unwrap-or false
                  Some $ comp-picker-mode
                  , None
                comp-key-event $ fn (e d!)
                  hint-fn $ Fn respo.schema/RespoEvent
                    Fn schema/Op $ -> Unit
                    -> Unit
                  cond
                      and
                        or
                            app.schema/event-field e :meta?
                            , .unwrap-or false
                          (app.schema/event-field e :ctrl?) .unwrap-or false
                        = |p $
                          app.schema/event-field e :key
                          , .unwrap-or |
                      if
                          app.schema/event-field e :shift?
                          , .unwrap-or false
                        .show command-plugin d!
                        d! $ :: :states cursor $ update state :menu? not
                    (and (or ((app.schema/event-field e :meta?) .unwrap-or false) ((app.schema/event-field e :ctrl?) .unwrap-or false)) (= |s ((app.schema/event-field e :key) .unwrap-or |)))
                      on-save
                        decode-map-as
                            get store :files
                            , .unwrap-or $ {}
                          Map String Dynamic
                        decode-map-as
                            get store :saved-files
                            , .unwrap-or $ {}
                          Map String Dynamic
                        , d!
                    true &unit
                  , &unit
                .render command-plugin
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (Map Dynamic Dynamic) (-> respo.schema/Component) (:features :js-ffi)
        'comp-picker-mode $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-picker-mode ()
            div
              {} (:title "|Click to disable")
                :style $ {} (:position :absolute) (:top 16) (:left 16) (:font-size 20) (:padding "|8px 16px") (:font-family ui/font-fancy) (:border-radius |8px) (:cursor :pointer)
                  :border $ str "|2px solid " $ hsl 180 30 60
                  :background-color $ hsl 120 80 80
                :on-click $ fn (e d!)
                  d! $ app.schema/Op :picker-mode false
              <> "|Picker Mode"
              comp-key-event $ fn (e d!)
                if
                  = |Escape $
                    app.schema/event-field e :key
                    , .unwrap-or |
                  d! $ app.schema/Op :picker-mode false
                  , &unit
          :examples $ []
          :schema $ quote $ Fn (-> respo.schema/Component)
        'comp-search-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-search-entry (cursor state entries selected-idx on-close)
            let
                style-base $ assert-type ui/expand $ Map Tag Dynamic
                typed-entries entries
              list->
                {} $ :style $ merge style-base
                -> typed-entries $ map-indexed $ fn (idx entry)
                  let
                      style-selected $ assert-type
                        if (= idx selected-idx)
                          {} $ :background-color $ hsl 0 0 100
                          {}
                        Map Tag Dynamic
                    [] (str entry)
                      div
                        {} (:class-name css-hover-entry)
                          :style $ merge
                            {} (:line-height 2) (:font-family ui/font-code) (:cursor :pointer) (:padding "|0 8px")
                            , style-selected
                          :on-click $ fn (e d!)
                            hint-fn $ Fn respo.schema/RespoEvent
                              Fn schema/Op $ -> Unit
                              -> Unit
                            d! $ app.schema/Op :def-path $ decode-map-as entry (List app.schema/DefinitionPathPart)
                            on-close d!
                            d! $ :: :states cursor $ assoc state :query |
                        if
                          = 2 $ count entry
                          <> $ str
                              first entry
                              , .unwrap-or |
                            , "| :ns"
                          div ({})
                            <> $ str $ .unwrap-or (last entry) |
                            space-x 8
                            <>
                              str $ .unwrap-or (first entry) |
                              {} (:font-size 10)
                                :color $ hsl 0 0 70
          :examples $ []
          :schema $ quote $ Fn (List Dynamic) (Map Tag Dynamic)
            List $ List Dynamic
            , Number
              Fn
                Fn schema/Op $ -> Unit
                -> Unit
              -> respo.schema/Component
        'css-menu $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-menu
            {} $ |& $ {} (:position :absolute) (:top 0) (:left 0) (:width 480) (:height |88vh) ("|×" 100) (:backdrop-filter "|blur(1.5px)") (:border-radius |6px) (:padding 8) (:border-width "|0 1px 1px 0") (:z-index 100)
              :border $ str "|1px solid " $ hsl 0 0 30
              :background-color $ hsl 0 0 20
          :examples $ []
          :schema $ quote String
        'css-navbar $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-navbar
            {} $ |& $ {} (:padding "|0px 8px") (:position :absolute) (:top 16) (:left 0) (:width |100%) (:height 0)
          :examples $ []
          :schema $ quote String
        'css-notice-area $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-notice-area
            {} $ |& $ {} (:position :fixed) (:bottom 0) (:left 0) (:font-size 14) (:font-family ui/font-code) (:padding "|8px 16px")
              :background-color $ hsl 0 0 0
          :examples $ []
          :schema $ quote String
        'css-query-box $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-query-box
            {} $ |& $ merge ui/input
              {} (:background-color :transparent) (:font-family ui/font-code) (:color :white)
          :examples $ []
          :schema $ quote String
        'effect-focus $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defeffect effect-focus (query) (action el at?)
            .?!select $ js/document.querySelector query
          :examples $ []
          :schema $ quote $ Fn String (-> respo.schema/Effect) (:features :js-ffi)
        'search-entries $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn search-entries (files query)
            let
                queries $ split query "| "
                entries $ mapcat (&map:to-list files)
                  fn (pair)
                    hint-fn $ Fn (Tuple String Dynamic)
                      -> $ List $ List Dynamic
                    let
                        ns $ decode-map-as (nth pair 0) 'String
                        file $ nth pair 1
                        defs $ decode-map-as
                          .unwrap-or
                            get (schema/entry-fields file) :defs
                            {}
                          Map String Dynamic
                      concat
                        [] $ [] ns :ns
                        map
                          sort $ &set:to-list $ keys defs
                          fn (name) ([] ns :defs name)
              concat
                filter entries $ fn (path)
                  and
                    = 3 $ count path
                    every? queries $ fn (part)
                      includes?
                        decode-map-as
                          .unwrap $ nth path 2
                          , 'String
                        , part
                filter entries $ fn (path)
                  and
                    = 2 $ count path
                    every? queries $ fn (part)
                      includes?
                        decode-map-as
                          .unwrap $ nth path 0
                          , 'String
                        , part
          :examples $ []
          :schema $ quote $ Fn (Map String Dynamic) String
            -> $ List $ List Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |snapshot-struct-paths-and-search)
            :code $ quote $ let
                files $ {} $ |app.demo
                  schema/FileEntry :ns
                    schema/CodeEntry :doc | :code $ :: 'quote $ [] |ns |app.demo
                    , :defs $ {}
                      |beta $ schema/CodeEntry :doc | :code $ :: 'quote ([] |def |beta |1)
                      |alpha $ schema/CodeEntry :doc | :code $ :: 'quote ([] |def |alpha |1)
              assert=
                [] ([] |app.demo :defs |alpha) ([] |app.demo :defs |beta) ([] |app.demo :ns)
                search-entries files |
              assert=
                [] $ [] |app.demo :defs |alpha
                search-entries files "|al ph"
              assert=
                [] $ [] |app.demo :ns
                search-entries files |app
              assert= ([])
                search-entries ({}) |
        'style-error $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-error
            {} $ :color $ hsl 0 90 70
          :examples $ []
          :schema $ quote $ Map Tag String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.nav
          :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ space-x space-y
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
            app.schema :as schema
    'app.comp.stack $ %{} 'FileEntry
      :defs $ {} $ 'comp-stack
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-stack (stack pointer)
            let
                column-style $ assert-type ui/column $ Map Tag Dynamic
                typed-stack stack
              div ({})
                list->
                  {} $ :style $ merge column-style
                    {} (:position :absolute) (:opacity 0.8) (:top 32) (:left 8) (:z-index 0) (:align-items :flex-start) (:user-select :none)
                  -> typed-stack $ map-indexed $ fn (idx frame)
                    let
                        selected-style $ assert-type
                          if (= idx pointer)
                            {} $ :background-color $ hsl 0 0 30
                            {}
                          Map Tag Dynamic
                      [] idx $ div
                        {} (:class-name css-hover-entry)
                          :on-click $ fn (e d!)
                            d! $ app.schema/Op :stack-pointer idx
                          :style $ merge
                            {} (:cursor :pointer) (:padding "|4px 8px") (:border-radius |6px)
                            , selected-style
                        match
                            nth frame 1
                            , .unwrap-or :unknown
                          :ns $ <> $ str
                              nth frame 0
                              , .unwrap-or |
                          :defs $ div
                            {} $ :style $ merge column-style
                            <>
                              str
                                  nth frame 0
                                  , .unwrap-or |
                                , |/
                              {} (:font-size 10) (:line-height 1)
                                :color $ hsl 0 0 60
                            div ({})
                              <>
                                decode-map-as
                                    nth frame 2
                                    , .unwrap-or |
                                  , 'String
                                {} $ :color $ hsl 0 0 100
                          _ $ <> (str "|Err: " frame)
                            {} $ :color :red
                comp-key-event $ fn (e d!)
                  let
                      meta? $ or
                          app.schema/event-field e :meta?
                          , .unwrap-or false
                        (app.schema/event-field e :ctrl?) .unwrap-or false
                      key $
                        app.schema/event-field e :key
                        , .unwrap-or |
                    cond
                        and meta? $ = |k key
                        d! $ app.schema/Op :pointer-shrink pointer
                      (and meta? (= |j key))
                        d! $ app.schema/Op :pointer-down pointer
                      (and meta? (= |i key))
                        d! $ app.schema/Op :pointer-up pointer
                      true &unit
          :examples $ []
          :schema $ quote $ Fn
            List $ List Dynamic
            , Number (-> respo.schema/Component)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.stack
          :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
            respo.comp.space :refer $ space-x space-y
            app.widget :as widget
            app.comp.key-event :refer $ comp-key-event
            app.analyze :refer $ analyze-deps
            app.style :refer $ css-hover-entry
    'app.config $ %{} 'FileEntry
      :defs $ {}
        'api-host $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def api-host
            str |http://
              .unwrap-or (get-env |host) |localhost
              , |: $ .unwrap-or (get-env |port) |6101
          :examples $ []
          :schema $ quote String
        'api-host-6011 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def api-host-6011
            str |http://
              .unwrap-or (get-env |host) |localhost
              , |: $ .unwrap-or (get-env |port) |6011
          :examples $ []
          :schema $ quote String
        'code-font $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def code-font "|Roboto Mono, monospace"
          :examples $ []
          :schema $ quote String
        'cors-headers $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def cors-headers
            {} (:Content-Type |data/cirru-edn) (:Access-Control-Allow-Origin |*) (:Access-Control-Allow-Methods |*)
          :examples $ []
          :schema $ quote $ Map Tag String
        'dot-radius $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dot-radius 4
          :examples $ []
          :schema $ quote Number
        'leaf-gap $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def leaf-gap 16
          :examples $ []
          :schema $ quote Number
        'leaf-height $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def leaf-height 24
          :examples $ []
          :schema $ quote Number
        'line-height $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def line-height 32
          :examples $ []
          :schema $ quote Number
        'mocked? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mocked?
            &= |true $ .unwrap-or (get-env |mocked) |false
          :examples $ []
          :schema $ quote Bool
        'read-window-width $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-window-width () (decode-map-as js/window.innerWidth 'Number)
          :examples $ []
          :schema $ quote $ Fn (-> Number) (:features :js-ffi)
        'site $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def site
            {} (:title |Phlox) (:icon |http://cdn.tiye.me/logo/quamolit.png) (:storage-key |phlox-workflow)
          :examples $ []
          :schema $ quote $ Map Tag String
        'twist-distance $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def twist-distance
            * 0.8 $ read-window-width
          :examples $ []
          :schema $ quote Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.config
          :require $ |mobile-detect :default mobile-detect
    'app.container $ %{} 'FileEntry
      :defs $ {}
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container (store)
            let
                states $ decode-map-as
                    get store :states
                    , .unwrap-or $ {}
                  Map Dynamic Dynamic
                editor $ decode-map-as
                    get store :editor
                    , .unwrap-or $ {}
                  Map Tag Dynamic
                focus $ decode-map-as
                    get editor :focus
                    , .unwrap-or $ []
                  List Number
                files $ decode-map-as
                    get store :files
                    , .unwrap-or $ {}
                  Map String Dynamic
                router $ decode-map-as
                    get store :router
                    , .unwrap-or $ {}
                  Map Tag Dynamic
                package-name $ decode-map-as
                    get store :package
                    , .unwrap-or |
                  , 'String
                deps-tree $ .unwrap-or (get store :deps-tree) ({})
              match
                  get router :name
                  , .unwrap-or :editor
                :editor $ let
                    def-path $ either
                      .unwrap-or
                        app.schema/path-value editor $ [] :stack $ decode-map-as
                          .unwrap-or (get editor :pointer) 0
                          , 'Number
                        []
                      []
                    selected-entry $ if (empty? def-path) None $ definition-at files
                      decode-map-as def-path $ List app.schema/DefinitionPathPart
                  match selected-entry
                    (:none)
                      text $ {} (:text "|No code selected")
                        :position $ [] -60 0
                        :style $ {} (:fill 0x66aaaa) (:font-size 20) (:font-family "|Josefin Sans")
                    (:some entry)
                      decode-map-as
                        memof1-call comp-editor entry focus
                          decode-map-as def-path $ List Dynamic
                          , package-name
                        , phlox.schema/PhloxElement
                :deps-tree $ if (nil? deps-tree)
                  text $ {} (:text "|tree is empty")
                    :position $ [] 1 1
                    :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                  comp-deps-tree
                    decode-map-as deps-tree $ Map (List String)
                      List $ Tuple String String Tag
                    decode-map-as
                        app.schema/path-value store $ [] :configs :init-fn
                        , .unwrap-or |
                      , 'String
                    , package-name
                :deps-of $ if (nil? deps-tree)
                  text $ {} (:text "|tree is empty")
                    :position $ [] 1 1
                    :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                  comp-deps-of
                    decode-map-as deps-tree $ Map (List String)
                      List $ Tuple String String Tag
                    decode-map-as
                        .unwrap-or (get router :data) ([])
                      List String
                    , package-name
                :call-tree $ if (nil? deps-tree)
                  text $ {} (:text "|tree is empty")
                    :position $ [] 1 1
                    :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                  comp-call-tree (>> states :call-tree)
                    decode-map-as deps-tree $ Map (List String)
                      List $ Tuple String String Tag
                    decode-map-as
                        .unwrap-or (get router :data) ([])
                      List String
                    , package-name
                _ $ text $ {}
                  :text $ str "|Unknown router: " router
                  :position $ [] 1 1
                  :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (-> phlox.schema/PhloxElement)
        'comp-hint $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-hint (states focus target)
            let
                typed-states $ decode-map-as states $ Map Tag Dynamic
                cursor $ .unwrap-or (get typed-states :cursor) ([])
                state0 $ .unwrap-or (get typed-states :data)
                  {} $ :p1 $ [] 400 -100
                state $ decode-map-as state0 $ Map Tag Dynamic
                position $ decode-map-as
                  .unwrap-or (get state :p1) ([] 400 -100)
                  List Number
              container ({})
                comp-drag-point (>> typed-states :p1)
                  {} (:hide-text? true) (:position position) (:radius 8)
                    :fill $ hslx 60 90 44
                    :on-change $ fn (next-position d!)
                      d! $ :: :states cursor $ assoc state :p1 next-position
                text $ {}
                  :text $ slice
                    format-to-lisp $ turn-quoted target
                    , 0 $ Some 200
                  :position $ complex/add position $ [] 12 -6
                  :style $ {}
                    :fill $ hslx 200 40 50
                    :font-size 10
                    :font-family "|Roboto Mono, manospace"
          :examples $ []
          :schema $ quote $ Fn Dynamic Dynamic Dynamic (-> phlox.schema/PhloxElement)
        'turn-quoted $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn turn-quoted (target)
            if (string? target) (to-symbol target)
              if (list? target) (map target turn-quoted)
                raise "|Expected a Cirru String token or expression List"
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Dynamic)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.container
          :require
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
            app.schema :refer $ definition-at
    'app.fetch $ %{} 'FileEntry
      :defs $ {}
        'load-files! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-files! (d! shared-editor?)
            ->
              if mocked? |//cors.cirru.org/compact.cirru $ str (if shared-editor? api-host-6011 api-host) |/compact-data
              js/fetch
              .?!then $ fn (res) (.!text res)
              .?!then $ fn (text)
                let
                    compact-files $ parse-cirru-edn (decode-map-as text 'String)
                      {} (:CodeEntry schema/CodeEntry) (:FileEntry schema/FileEntry)
                  if (non-nil? compact-files)
                    do
                      d! $ app.schema/Op :load-files $ transform-cirru-quoted
                        decode-map-as compact-files $ Map Tag Dynamic
                      d! $ app.schema/Op :ok
                    do (js/console.log "|unknown data:" compact-files)
                      d! $ app.schema/Op :warn "|unknown data"
              .?!catch $ fn (err)
                d! $ app.schema/Op :warn $ decode-map-as (js/String err) 'String
          :examples $ []
          :schema $ quote $ Fn
            Fn schema/Op $ -> Unit
            , Bool (-> Dynamic) (:features :js-ffi)
        'snapshot-key $ %{} 'CodeEntry
          :doc "|Current snapshots key files and definitions by symbol, older ones by string. The editor addresses them by string."
          :code $ quote $ defn snapshot-key (key)
            if (string? key) key $ let
                text $ str key
              if (starts-with? text |') (slice text 1) text
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> String)
        'transform-cirru-quoted $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn transform-cirru-quoted (snapshot)
            let
                files $ decode-map-as
                  .unwrap-or (get snapshot :files) ({})
                  Map Dynamic Dynamic
              assoc snapshot :files $ filter-map-kv files $ fn (raw-name file)
                hint-fn $ Fn Dynamic Dynamic $ -> (MapEntryDecision String AnyStruct)
                if (struct? file)
                  let
                      name $ snapshot-key raw-name
                      fields $ &struct:to-map file
                      ns-entry $ .unwrap $ get fields :ns
                      defs $ decode-map-as
                        .unwrap-or (get fields :defs) ({})
                        Map Dynamic Dynamic
                      transformed-defs $ filter-map-kv defs $ fn (raw-def entry)
                        hint-fn $ Fn Dynamic Dynamic $ -> (MapEntryDecision String AnyStruct)
                        MapEntryDecision :keep (snapshot-key raw-def) (transform-code-entry entry)
                    MapEntryDecision :keep name $ -> file
                      &struct:assoc :ns $ transform-code-entry ns-entry
                      &struct:assoc :defs transformed-defs
                  raise "|Expected a Snapshot FileEntry Struct"
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic)
            -> $ Map Tag Dynamic
          :tests $ [] $ %{} 'TestEntry (:name |preserves-snapshot-metadata-and-map-values)
            :code $ quote $ let
                input $ decode-map-as
                  parse-cirru-edn "|{} (:package |app)\n  :files $ {}\n    |app.demo $ %{} :FileEntry (:extra |kept-file)\n      :ns $ %{} :CodeEntry (:doc |namespace) (:schema 'String) (:tests $ [] |kept-test)\n        :code $ quote $ ns app.demo\n      :defs $ {}\n        |demo $ %{} :CodeEntry (:doc |definition) (:schema 'String) (:tests $ [] |kept-test)\n          :code $ quote $ defn demo () |ok"
                  Map Tag Dynamic
                loaded $ transform-cirru-quoted input
                file $ .unwrap $ app.schema/path-value loaded ([] :files |app.demo)
                fields $ if (struct? file) (&struct:to-map file) (raise "|Expected loaded file Struct")
                defs $ decode-map-as
                  .unwrap $ get fields :defs
                  Map String Dynamic
                entry $ .unwrap $ get defs |demo
                data $ if (struct? entry) (&struct:to-map entry) (raise "|Expected loaded definition Struct")
              assert= (Some |app) (get loaded :package)
              assert= (Some |kept-file) (get fields :extra)
              assert= (Some |definition) (get data :doc)
              assert= (Some 'String) (get data :schema)
              assert=
                Some $ [] |kept-test
                get data :tests
              assert=
                Some $ :: 'quote $ [] |defn |demo ([]) ||ok
                get data :code
        'transform-code-entry $ %{} 'CodeEntry
          :doc "|保留解码得到的原 Struct 及其全部字段，只将 CirruQuote :code 转为编辑器使用的 quote Enum；不伪造完整 Snapshot schema。"
          :code $ quote $ defn transform-code-entry (entry)
            if (struct? entry)
              let
                  fields $ &struct:to-map entry
                  quoted $ decode-map-as
                    .unwrap $ get fields :code
                    , 'CirruQuote
                &struct:assoc entry :code $ :: 'quote $ &cirru-quote:to-list quoted
              raise "|Expected a Snapshot CodeEntry Struct"
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> AnyStruct) (:open :reflect)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.fetch
          :require
            app.config :refer $ api-host api-host-6011 mocked?
            app.schema :as schema
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store schema/store
          :examples $ []
          :schema $ quote $ Ref (Map Tag Dynamic)
        'dispatch! $ %{} 'CodeEntry
          :doc "|真实框架边界接受一个输入并检查 Enum；Phlox/Respo 已负责 Tag 与游标转换，内部 updater 只接收 Enum。不生成未使用的 ID/时间戳或重复转换层。"
          :code $ quote $ defn dispatch! (operation)
            if (enum? operation)
              match operation
                (:effect-goto-def payload)
                  let
                      token $ decode-map-as payload 'String
                      files $ decode-map-as
                        .unwrap-or (get @*store :files) ({})
                        Map String Dynamic
                      editor $ decode-map-as
                        .unwrap-or (get @*store :editor) ({})
                        Map Tag Dynamic
                      pointer $ decode-map-as
                        .unwrap-or (get editor :pointer) 0
                        , 'Number
                      path $ decode-map-as
                        .unwrap-or
                          app.schema/path-value editor $ [] :stack pointer
                          []
                        List Dynamic
                      package-name $ decode-map-as
                        .unwrap-or (get @*store :package) |
                        , 'String
                    match (lookup-target-def token files path package-name)
                      (:some target)
                        dispatch! $ app.schema/Op :def-path target
                      (:none)
                        dispatch! $ app.schema/Op :warn $ str "|not found: " token
                _ $ reset! *store $ updater @*store operation
              raise "|Expected one application operation Enum"
            , &unit
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> Unit)
          :tests $ [] $ %{} 'TestEntry (:name |single-operation-navigation-and-mixed-state)
            :code $ quote $ let
                before @*store
                raw $ decode-map-as
                  parse-cirru-edn "|{} (:package |app)\n  :files $ {}\n    |app.demo $ %{} :FileEntry\n      :ns $ %{} :CodeEntry\n        :code $ quote $ ns app.demo\n      :defs $ {}\n        |main $ %{} :CodeEntry\n          :code $ quote $ defn main () (helper)\n        |helper $ %{} :CodeEntry\n          :code $ quote $ defn helper () |ok"
                  Map Tag Dynamic
                loaded $ app.fetch/transform-cirru-quoted raw
              reset! *store schema/store
              try
                do
                  dispatch! $ :: :load-files loaded
                  dispatch! $ :: :def-path $ [] |app.demo :defs |main
                  dispatch! $ app.schema/Op :effect-goto-def |helper
                  assert=
                    Some $ [] |app.demo :defs |helper
                    app.schema/path-value @*store $ [] :editor :stack 1
                  assert= &unit $ dispatch! $ :: :states ([] :demo 0 :drag)
                    {} $ :ready? true
                  assert= (Some true)
                    app.schema/path-value @*store $ [] :states :demo 0 :drag :data :ready?
                  reset! *store before
                  , &unit
                fn (error) (reset! *store before) (raise error)
        'handle-global-keys $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-global-keys ()
            js/window.addEventListener |keydown $ fn (event)
              cond $ true $ js/console.log event
          :examples $ []
          :schema $ quote $ Fn (-> Dynamic) (:features :js-ffi)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (; js/console.log PIXI)
            if dev? $ load-console-formatter!
            ->
              ffi-load-font $ new FontFaceObserver "|Roboto Mono"
              .?!then $ fn (event) (render-app!)
            add-watch! *store :change $ fn (store prev) (render-app!)
            when mobile? (render-control!) (start-control-loop! 8 on-control-event)
            load-files! dispatch! false
            ; handle-global-keys
            println "|App Started"
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn mount-target ()
            match (respo-browser/query-selector |.app)
              (:some element) element
              (:none) (raise "|Missing .app mount element")
          :examples $ []
          :schema $ quote $ Fn (-> respo.dom/DomElement) (:features :js-ffi)
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (nil? build-errors)
              do (clear-phlox-caches!) (respo/clear-cache!) (remove-watch! *store :change)
                add-watch! *store :change $ fn (store prev) (render-app!)
                render-app!
                when mobile? $ replace-control-loop! 8 on-control-event
                hud! |ok~ |Ok
                ; load-files! dispatch!
              hud! |error build-errors
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            render! (comp-container @*store) dispatch! $ {}
            render-navbar!
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
        'render-navbar! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-navbar! ()
            let
                states $ decode-map-as
                  .unwrap-or (get @*store :states) ({})
                  Map Dynamic Dynamic
              respo/render! (mount-target)
                comp-navbar @*store $ >> states :dom
                , dispatch!
          :examples $ []
          :schema $ quote $ Fn (-> Unit) (:features :js-ffi)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require (|pixi.js :as PIXI)
            phlox.core :refer $ render! clear-phlox-caches! on-control-event ffi-load-font
            app.container :refer $ comp-container
            app.schema :as schema
            phlox.config :refer $ dev? mobile?
            app.updater :refer $ updater
            |fontfaceobserver-es :default FontFaceObserver
            |./calcit.build-errors.mjs :default build-errors
            |bottom-tip :default hud!
            touch-control.core :refer $ render-control! start-control-loop! replace-control-loop!
            app.comp.nav :refer $ comp-navbar on-save
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input
            respo.core :as respo
            respo.comp.space :refer $ space-x space-y
            app.fetch :refer $ load-files!
            app.analyze :refer $ lookup-target-def
            respo.ffi.browser :as respo-browser
    'app.math $ %{} 'FileEntry
      :defs $ {}
        'add-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn add-path (p q)
            let[] (a b) p $ let[] (x y) q $ [] (+ a x) (+ b y)
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
        'divide-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn divide-path (p q)
            let[] (x y) p $ let[] (a b) q $ let
                inverted $ / 1 $ + (* a a) (* b b)
              []
                * inverted $ + (* x a) (* y b)
                * inverted $ - (* y a) (* x b)
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
        'divide-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn divide-x (point x)
            []
              /
                .unwrap-or (first point) 0
                , x
              /
                .unwrap-or (last point) 0
                , x
          :examples $ []
          :schema $ quote $ Fn (List Number) Number
            -> $ List Number
        'invert-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn invert-y (point)
            let[] (x y) point $ [] x $ negate y
          :examples $ []
          :schema $ quote $ Fn (List Number)
            -> $ List Number
        'multiply-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn multiply-path (p q)
            let[] (a b) p $ let[] (x y) q $ []
              - (* a x) (* b y)
              + (* a y) (* b x)
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
        'rand-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand-color ()
            floor $ * (random) 0xffffff
          :examples $ []
          :schema $ quote $ Fn (-> Number) (:features :js-ffi)
        'rand-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand-point (n & xs)
            let
                m0 $ .unwrap-or (first xs) n
              []
                -
                  round $ * 0.2 n
                  floor $ * (random) n
                -
                  round $ * 0.2 m0
                  floor $ * (random) m0
          :examples $ []
          :schema $ quote $ Fn Number (& Number)
            -> $ List Number
            :features :js-ffi
        'rough-size $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rough-size (point)
            let[] (x y) point $ + (abs x) (abs y)
          :examples $ []
          :schema $ quote $ Fn (List Number) (-> Number)
        'subtract-path $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn subtract-path (p q)
            let[] (a b) p $ let[] (x y) q $ [] (- a x) (- b y)
          :examples $ []
          :schema $ quote $ Fn (List Number) (List Number)
            -> $ List Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.math
          :require $ js-ffi.browser :refer $ random
    'app.persistence $ %{} 'FileEntry
      :defs $ {}
        'apply-patch $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn apply-patch (snapshot changes)
            let
                files $ decode-map-as
                  .unwrap-or (get snapshot :files) ({})
                  Map String Dynamic
                removed $ decode-map-as
                  .unwrap-or (get changes :removed) (#{})
                  Set String
                added $ decode-map-as
                  .unwrap-or (get changes :added) ({})
                  Map String Dynamic
                changed $ decode-map-as
                  .unwrap-or (get changes :changed) ({})
                  Map String Dynamic
                next-files $ foldl (&map:to-list changed)
                  merge
                    unselect-keys files $ &set:to-list removed
                    , added
                  fn (acc pair)
                    hint-fn $ Fn (Map String Dynamic) (Tuple String Dynamic)
                      -> $ Map String Dynamic
                    let
                        name $ decode-map-as (nth pair 0) 'String
                        change $ decode-map-as (nth pair 1) (Map Tag Dynamic)
                        file $ .unwrap $ get acc name
                        fields $ schema/entry-fields file
                        defs $ decode-map-as
                          .unwrap $ get fields :defs
                          Map String Dynamic
                        removed-defs $ decode-map-as
                          .unwrap-or (get change :removed-defs) (#{})
                          Set String
                        added-defs $ decode-map-as
                          .unwrap-or (get change :added-defs) ({})
                          Map String Dynamic
                        changed-defs $ decode-map-as
                          .unwrap-or (get change :changed-defs) ({})
                          Map String Dynamic
                        with-ns $ fn (entry)
                          hint-fn $ Fn AnyStruct $ -> AnyStruct
                          match (get change :ns)
                            (:some ns-entry)
                              if (nil? ns-entry) entry $ &struct:assoc entry :ns ns-entry
                            (:none) entry
                        next-defs $ merge
                          unselect-keys defs $ &set:to-list removed-defs
                          , added-defs changed-defs
                      if (struct? file)
                        assoc acc name $ -> (with-ns file) (&struct:assoc :defs next-defs)
                        raise "|Expected a Snapshot FileEntry Struct"
              assoc snapshot :files next-files
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (Map Tag Dynamic)
            -> $ Map Tag Dynamic
        'build-patch $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn build-patch (files saved-files)
            let
                replaced $ keys $ filter-map-kv files
                  fn (name file)
                    hint-fn $ Fn String Dynamic $ -> (MapEntryDecision String Bool)
                    match (get saved-files name)
                      (:none) (MapEntryDecision :drop)
                      (:some previous)
                        if
                          =
                            -> (schema/entry-fields file) (dissoc :ns) (dissoc :defs)
                            -> (schema/entry-fields previous) (dissoc :ns) (dissoc :defs)
                          MapEntryDecision :drop
                          MapEntryDecision :keep name true
                removed $ union
                  difference (keys saved-files) (keys files)
                  , replaced
                added $ filter-map-kv files $ fn (name file)
                  hint-fn $ Fn String Dynamic $ -> (MapEntryDecision String AnyStruct)
                  if
                    and
                      .some? $ get saved-files name
                      not $ contains? replaced name
                    MapEntryDecision :drop
                    MapEntryDecision :keep name $ serialize-file file
                changed $ filter-map-kv files $ fn (name file)
                  hint-fn $ Fn String Dynamic $ ->
                    MapEntryDecision String $ Map Tag Dynamic
                  if (contains? replaced name) (MapEntryDecision :drop)
                    match (get saved-files name)
                      (:none) (MapEntryDecision :drop)
                      (:some previous)
                        if (= file previous) (MapEntryDecision :drop)
                          let
                              fields $ schema/entry-fields file
                              old-fields $ schema/entry-fields previous
                              defs $ decode-map-as
                                .unwrap $ get fields :defs
                                Map String Dynamic
                              old-defs $ decode-map-as
                                .unwrap $ get old-fields :defs
                                Map String Dynamic
                              ns-entry $ .unwrap $ get fields :ns
                              old-ns $ .unwrap $ get old-fields :ns
                              added-defs $ select-keys defs $ &set:to-list
                                difference (keys defs) (keys old-defs)
                              changed-defs $ filter-map-kv defs $ fn (def-name entry)
                                hint-fn $ Fn String Dynamic $ -> (MapEntryDecision String AnyStruct)
                                match (get old-defs def-name)
                                  (:none) (MapEntryDecision :drop)
                                  (:some old-entry)
                                    if (= entry old-entry) (MapEntryDecision :drop)
                                      MapEntryDecision :keep def-name $ serialize-entry entry
                            MapEntryDecision :keep name $ let
                                base $ {}
                                  :added-defs $ serialize-defs added-defs
                                  :removed-defs $ difference (keys old-defs) (keys defs)
                                  :changed-defs changed-defs
                              if (= ns-entry old-ns) base $ assoc base :ns $ serialize-entry ns-entry
              {} (:added added) (:removed removed) (:changed changed)
          :examples $ []
          :schema $ quote $ Fn (Map String Dynamic) (Map String Dynamic)
            -> $ Map Tag Dynamic
          :tests $ [] $ %{} 'TestEntry
            :name |serialized-save-roundtrip-preserves-snapshot-metadata
            :code $ quote $ let
                raw $ decode-map-as
                  parse-cirru-edn "|{} (:package |app) (:extra-root |kept-root)\n  :configs $ {} (:init-fn |app.keep/main)\n  :files $ {}\n    |app.keep $ %{} :FileEntry (:extra |kept-file)\n      :ns $ %{} :CodeEntry (:doc |namespace)\n        :code $ quote $ ns app.keep\n      :defs $ {}\n        |main $ %{} :CodeEntry (:doc |kept-doc) (:schema 'String)\n          :tests $ []\n            {} (:name |returns-label) (:tags $ #{} :unit)\n              :code $ quote $ assert= |old main\n          :code $ quote $ def main |old\n        |gone $ %{} :CodeEntry (:doc |remove-me)\n          :code $ quote $ def gone 1\n        |same $ %{} :CodeEntry (:doc |untouched)\n          :code $ quote $ def same 2\n    |app.meta $ %{} :FileEntry (:extra |old-meta)\n      :ns $ %{} :CodeEntry (:doc |metadata)\n        :code $ quote $ ns app.meta\n      :defs $ {}\n    |app.removed $ %{} :FileEntry\n      :ns $ %{} :CodeEntry (:doc |removed)\n        :code $ quote $ ns app.removed\n      :defs $ {}\n"
                  Map Tag Dynamic
                loaded $ app.fetch/transform-cirru-quoted raw
                before $ decode-map-as
                  .unwrap $ get loaded :files
                  Map String Dynamic
                path $ [] |app.keep :defs |main
                original $ .unwrap $ schema/definition-at before path
                changed $ &struct:assoc original :code $ :: 'quote ([] |def |main ||new)
                base1 $ schema/assoc-definition before path changed
                base2 $ schema/assoc-definition base1 ([] |app.keep :defs |added) (schema/rename-entry changed |added)
                base3 $ schema/dissoc-definition base2 $ [] |app.keep :defs |gone
                ns-entry $ .unwrap $ schema/definition-at base3 ([] |app.keep :ns)
                base4 $ schema/assoc-definition base3 ([] |app.keep :ns) (&struct:assoc ns-entry :doc "|changed namespace doc")
                meta $ .unwrap $ get base4 |app.meta
                new-file $ &struct:assoc meta :ns $ schema/rename-entry
                  .unwrap $ schema/definition-at base4 $ [] |app.meta :ns
                  , |app.new
                after $ -> base4 (dissoc |app.removed)
                  assoc |app.meta $ &struct:assoc meta :extra |new-meta
                  assoc |app.new new-file
                patch $ build-patch after before
                wire $ decode-map-as
                  parse-cirru-edn $ format-cirru-edn patch
                  Map Tag Dynamic
                saved $ apply-patch raw wire
                restored $ app.fetch/transform-cirru-quoted saved
                saved-files $ decode-map-as
                  .unwrap $ get saved :files
                  Map String Dynamic
                saved-entry $ .unwrap $ schema/definition-at saved-files path
                fields $ schema/entry-fields saved-entry
                noop $ build-patch before before
              assert= (Some |kept-root) (get saved :extra-root)
              assert= (get raw :configs) (get saved :configs)
              assert= (Some after) (get restored :files)
              assert= (Some |kept-doc) (get fields :doc)
              assert= (Some 'String) (get fields :schema)
              assert=
                get (schema/entry-fields original) :tests
                get fields :tests
              assert= true $ cirru-quote? $ .unwrap (get fields :code)
              assert= (Some |kept-file)
                get
                  schema/entry-fields $ .unwrap $ get saved-files |app.keep
                  , :extra
              assert= (Some |new-meta)
                get
                  schema/entry-fields $ .unwrap $ get saved-files |app.meta
                  , :extra
              assert= None $ get saved-files |app.removed
              assert= true $ contains?
                decode-map-as
                  .unwrap $ get patch :removed
                  Set String
                , |app.meta
              assert= true $ contains?
                decode-map-as
                  .unwrap $ get patch :added
                  Map String Dynamic
                , |app.meta
              assert= ({})
                .unwrap $ get noop :added
              assert= ({})
                .unwrap $ get noop :changed
              assert= (#{})
                .unwrap $ get noop :removed
        'serialize-defs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn serialize-defs (defs)
            filter-map-kv defs $ fn (name entry)
              hint-fn $ Fn String Dynamic $ -> (MapEntryDecision String AnyStruct)
              MapEntryDecision :keep name $ serialize-entry entry
          :examples $ []
          :schema $ quote $ Fn (Map String Dynamic)
            -> $ Map String AnyStruct
            :open :reflect
        'serialize-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn serialize-entry (entry)
            let
                tree $ schema/entry-tree entry
                code $ decode-map-as
                  parse-cirru-edn $ format-cirru $ [] ([] |quote tree)
                  , 'CirruQuote
              if (struct? entry) (&struct:assoc entry :code code) (raise "|Expected a Snapshot CodeEntry Struct")
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> AnyStruct) (:open :reflect)
        'serialize-file $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn serialize-file (file)
            let
                fields $ schema/entry-fields file
                ns-entry $ .unwrap $ get fields :ns
                defs $ decode-map-as
                  .unwrap $ get fields :defs
                  Map String Dynamic
              if (struct? file)
                -> file
                  &struct:assoc :ns $ serialize-entry ns-entry
                  &struct:assoc :defs $ serialize-defs defs
                raise "|Expected a Snapshot FileEntry Struct"
          :examples $ []
          :schema $ quote $ Fn Dynamic (-> AnyStruct) (:open :reflect)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.persistence
          :require $ app.schema :as schema
    'app.schema $ %{} 'FileEntry
      :defs $ {}
        'CodeEntry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct CodeEntry (:doc Dynamic) (:code Dynamic)
          :examples $ []
          :schema $ quote StructDef
        'DefinitionPathPart $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defunion DefinitionPathPart String Tag
          :examples $ []
          :schema $ quote UnionDef
        'FileEntry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct FileEntry (:ns Dynamic) (:defs Dynamic)
          :examples $ []
          :schema $ quote StructDef
        'Op $ %{} 'CodeEntry
          :doc "|Application actions used by UI callbacks. Dispatch also accepts legacy anonymous actions at the Phlox and Respo boundary."
          :code $ quote $ defenum Op
            :states (List respo.schema/CoordKey) Dynamic
            :ok
            :load-files $ Map Tag Dynamic
            :files-synced $ Map String Dynamic
            :router $ Map Tag Dynamic
            :stack-pointer Number
            :pointer-down Number
            :pointer-up Number
            :pointer-shrink Number
            :call-cirru-edit cirru-editor.schema/EditOp
            :cirru-edit-node $ Tuple (List Number) calcit.core/CirruNode
            :def-path $ List app.schema/DefinitionPathPart
            :focus $ List Number
            :warn String
            :add-ns String
            :rm-ns String
            :add-def $ List String
            :rm-def $ List String
            :mv-ns $ List String
            :mv-def $ List String
            :picker-mode Bool
            :focus-or-pick $ List Number
            :deps-tree $ Map (List String)
              List $ Tuple String String Tag
            :effect-goto-def String
          :examples $ []
          :schema $ quote EnumDef
        'assoc-definition $ %{} 'CodeEntry
          :doc "|替换选定 CodeEntry，保留原 FileEntry Struct 的身份与额外字段；定义值检查为 Struct，文件/定义 Map 不重建整图或伪造闭合 schema。"
          :code $ quote $ defn assoc-definition (files path entry)
            let
                ns-name $ decode-map-as
                  .unwrap $ get path 0
                  , 'String
                kind $ decode-map-as
                  .unwrap $ get path 1
                  , 'Tag
              if
                and (map? files) (struct? entry)
                let
                    file $ .unwrap $ get files ns-name
                    fields $ entry-fields file
                  if (struct? file)
                    match kind
                      :ns $ assoc files ns-name $ &struct:assoc file :ns entry
                      :defs $ let
                          name $ decode-map-as
                            .unwrap $ get path 2
                            , 'String
                          defs $ .unwrap $ get fields :defs
                        if (map? defs)
                          assoc files ns-name $ &struct:assoc file :defs $ assoc defs name entry
                          raise "|Expected a definition map"
                      _ $ raise "|Unknown definition path kind"
                    raise "|Expected a Snapshot file Struct"
                raise "|Expected a file map and definition Struct"
          :examples $ []
          :schema $ quote $ Fn Dynamic (List DefinitionPathPart) Dynamic
            -> $ Map Dynamic Dynamic
        'definition-at $ %{} 'CodeEntry
          :doc "|显式沿文件 Map 和 FileEntry Struct 读取 ns/defs 路径；只验证实际使用的节点，不对每次按键遍历整个文件图，也不让 get-in 跨 Struct。"
          :code $ quote $ defn definition-at (files path)
            let
                ns-name $ decode-map-as
                  .unwrap $ get path 0
                  , 'String
                kind $ decode-map-as
                  .unwrap $ get path 1
                  , 'Tag
              if (map? files)
                match (get files ns-name)
                  (:none) None
                  (:some file)
                    let
                        fields $ entry-fields file
                      match kind
                        :ns $ get fields :ns
                        :defs $ let
                            name $ decode-map-as
                              .unwrap $ get path 2
                              , 'String
                            defs $ .unwrap $ get fields :defs
                          if (map? defs) (get defs name) (raise "|Expected a definition map")
                        _ $ raise "|Unknown definition path kind"
                raise "|Expected a Snapshot file map"
          :examples $ []
          :schema $ quote $ Fn Dynamic (List DefinitionPathPart)
            -> $ Option Dynamic
        'dissoc-definition $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dissoc-definition (files path)
            let
                ns-name $ decode-map-as
                  .unwrap $ get path 0
                  , 'String
                kind $ decode-map-as
                  .unwrap $ get path 1
                  , 'Tag
              if (map? files)
                match kind
                  :ns $ dissoc files ns-name
                  :defs $ match (get files ns-name)
                    (:none) files
                    (:some file)
                      let
                          fields $ entry-fields file
                          name $ decode-map-as
                            .unwrap $ get path 2
                            , 'String
                          defs $ .unwrap $ get fields :defs
                        if
                          and (struct? file) (map? defs)
                          assoc files ns-name $ &struct:assoc file :defs $ dissoc defs name
                          raise "|Expected a file Struct with a definition map"
                  _ $ raise "|Unknown definition path kind"
                raise "|Expected a Snapshot file map"
          :examples $ []
          :schema $ quote $ Fn Dynamic (List DefinitionPathPart)
            -> $ Map Dynamic Dynamic
        'entry-fields $ %{} 'CodeEntry
          :doc "|只在原生/JS Snapshot 数据入口检查实际 Struct，再以开放字段 Map 读取；不是伪装成完整 CodeEntry/FileEntry 的断言。"
          :code $ quote $ defn entry-fields (entry)
            if (struct? entry) (&struct:to-map entry) (raise "|Expected a Snapshot entry Struct")
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ Map Tag Dynamic
        'entry-tree $ %{} 'CodeEntry
          :doc "|读取载入转换后的 quote Enum 树。Struct 字段显式读取，不让 get-in 跨 Struct，也不吞掉缺失或错误的代码载荷。"
          :code $ quote $ defn entry-tree (entry)
            let
                code $ .unwrap $ get (entry-fields entry) :code
              if (enum? code)
                if
                  = 'quote $ .unwrap $ get code 0
                  decode-map-as
                    .unwrap $ get code 1
                    List calcit.core/CirruNode
                  raise "|Expected quote code Enum"
                raise "|Expected transformed Snapshot code Enum"
          :examples $ []
          :schema $ quote $ Fn Dynamic
            -> $ List CirruNode
        'event-field $ %{} 'CodeEntry
          :doc "|Read one event field as an Option. Respo passes RespoEvent structs, Phlox passes maps, and host fields may be nil."
          :code $ quote $ defn event-field (e field)
            let
                fields $ if (struct? e) (&struct:to-map e)
                  decode-map-as e $ Map Tag Dynamic
              match (get fields field)
                (:some value)
                  if (nil? value) None $ Some value
                (:none) None
          :examples $ []
          :schema $ quote $ Fn Dynamic Tag
            -> $ Option Dynamic
        'inline $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro inline (path)
            read-file $ str |data/ path
          :examples $ []
          :schema $ quote $ Macro (Expr String)
            -> $ Expr String
            :capabilities :fs-read
        'map-field $ %{} 'CodeEntry
          :doc "|Read an optional Map field and preserve the value type."
          :code $ quote $ defn map-field (data key) (get data key)
          :examples $ []
          :schema $ quote $ Fn (Map K V) K
            -> $ Option V
            :generics K V
        'path-value $ %{} 'CodeEntry
          :doc "|Nested read for optional paths: a missing path or a wrong shape reads as None."
          :code $ quote $ defn path-value (base path)
            match (get-in base path)
              (:ok value) (Some value)
              (:err _error) None
          :examples $ []
          :schema $ quote $ Fn Dynamic (List Dynamic)
            -> $ Option Dynamic
        'rename-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rename-entry (entry name)
            let
                tree $ entry-tree entry
              if (struct? entry)
                match
                  .unwrap $ get tree 1
                  (String _)
                    &struct:assoc entry :code $ :: 'quote $ assoc tree 1 name
                  (List _) (raise "|Expected a named Snapshot code entry")
                raise "|Expected a named Snapshot code entry"
          :examples $ []
          :schema $ quote $ Fn Dynamic String (-> AnyStruct) (:open :reflect)
        'replace-node-op $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn replace-node-op (focus node)
            Op :cirru-edit-node $ decode-map-as ([] focus node)
              Tuple (List Number) calcit.core/CirruNode
          :examples $ []
          :schema $ quote $ Fn (List Number) CirruNode (-> Op)
        'store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def store
            let
                files $ {}
              {}
                :states $ {}
                :dom-states $ {} $ :cursor ([] :dom)
                :saved-files files
                :package |
                :files files
                :configs $ {}
                :warning nil
                :editor $ {}
                  :focus $ []
                  :clipboard $ []
                  :def-path $ []
                  :pointer 0
                  :stack $ []
                  :picker-mode? false
                :router $ {} $ :name :editor
                :deps-tree nil
          :examples $ []
          :schema $ quote $ Map Tag Dynamic
        'update-token-op $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-token-op (focus token)
            cirru-editor.schema/EditOp :update-token $ decode-map-as ([] focus token)
              Tuple (List Number) String
          :examples $ []
          :schema $ quote $ Fn (List Number) String (-> cirru-editor.schema/EditOp)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.schema
    'app.server $ %{} 'FileEntry
      :defs $ {}
        '*app-server $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *app-server None
          :examples $ []
          :schema $ quote $ Ref (Option FfiTask)
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (println "|start web server") (start-server!)
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'on-request $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn on-request (req)
            let
                url $ decode-map-as
                  .unwrap-or (get req :url) |
                  , 'String
                method $ decode-map-as
                  .unwrap-or (get req :method) :GET
                  , 'Tag
                request-body $ decode-map-as
                  .unwrap-or (get req :body) |
                  , 'String
              match url
                |/compact-data $ let
                    content $ read-file |calcit.cirru
                  {} (:code 200) (:headers cors-headers) (:body content)
                |/compact-inc $ match method
                  :PUT $ let
                      body request-body
                      changes $ decode-map-as (parse-cirru-edn body) (Map Tag Dynamic)
                      new-compact-data $ patch-compact-data
                        decode-map-as
                          parse-cirru-edn $ read-file |calcit.cirru
                          Map Tag Dynamic
                        , changes
                    write-file |calcit.cirru $ format-cirru-edn new-compact-data
                    write-file |.calcit-inc.cirru body
                    println "|wrote to" |.calcit-inc.cirru |and |calcit.cirru
                    ; println |data $ :body req
                    {} (:code 200) (:headers cors-headers)
                      :body $ format-cirru-edn $ {} (:ok? true) (:data |wrote)
                  :OPTIONS $ {} (:code 200) (:headers cors-headers) (:body |OK)
                  _ $ do (println "|Unknown method" method)
                    {} (:code 400) (:headers cors-headers)
                      :body $ format-cirru-edn $ {} (:ok? false)
                        :message $ str "|Unknown method " method
                _ $ do (eprintln "|unknown url" url)
                  {} (:code 404)
                    :body $ str "|unkown url " url
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic)
            -> $ Map Tag Dynamic
        'patch-compact-data $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn patch-compact-data (compact-data inc-changes) (persistence/apply-patch compact-data inc-changes)
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (Map Tag Dynamic)
            -> $ Map Tag Dynamic
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! () (println |reload...)
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
        'start-server! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn start-server! ()
            reset! *app-server $ Some $ serve-http!
              Some $ decode-map-as
                {} (:port 6101) (:host |0.0.0.0)
                Map Tag http.core/ServerOptionValue
              fn (req) (on-request req)
            , &unit
          :examples $ []
          :schema $ quote $ Fn (-> Unit)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.server
          :require
            http.core :refer $ serve-http!
            app.config :refer $ cors-headers
            app.persistence :as persistence
    'app.style $ %{} 'FileEntry
      :defs $ {}
        'button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def button
            merge ui/button $ {} $ :background :black
          :examples $ []
          :schema $ quote Dynamic
        'css-hover-entry $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-hover-entry
            {}
              |$0 $ {} (:cursor :pointer) (:font-family ui/font-code) (:cursor :pointer) (:line-height |2) (:padding "|0 8px")
              |$0:hover $ {} $ :background-color (hsl 0 0 100)
          :examples $ []
          :schema $ quote String
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.style
          :require
            respo.css :refer $ defstyle
            respo-ui.core :refer $ hsl
            respo-ui.core :as ui
    'app.updater $ %{} 'FileEntry
      :defs $ {}
        'apply-cirru-edit $ %{} 'CodeEntry
          :doc "|对选定定义应用单个 Cirru editor Enum；只检查选定文件/定义，保留 Struct 元数据，回写实际树、焦点、剪贴板和 warning。"
          :code $ quote $ defn apply-cirru-edit (store operation)
            let
                editor $ decode-map-as
                  .unwrap-or (schema/map-field store :editor) ({})
                  Map Tag Dynamic
                pointer $ decode-map-as
                  .unwrap-or (schema/map-field editor :pointer) 0
                  , 'Number
                path $ decode-map-as
                  .unwrap-or
                    app.schema/path-value editor $ [] :stack pointer
                    []
                  List app.schema/DefinitionPathPart
                files $ .unwrap-or (schema/map-field store :files) ({})
                selected $ if (empty? path) None $ schema/definition-at files path
              match selected
                (:none)
                  assoc store :warning $ str "|target not found at: " path
                (:some entry)
                  if (struct? entry)
                    let
                        previous-focus $ decode-map-as
                          .unwrap-or (schema/map-field editor :focus) ([])
                          List Number
                        snapshot $ {}
                          :tree $ schema/entry-tree entry
                          :clipboard $ .unwrap-or (schema/map-field editor :clipboard) ([])
                          :focus previous-focus
                        result $ cirru-edit snapshot operation
                        tree $ decode-map-as
                          .unwrap $ schema/map-field result :tree
                          List calcit.core/CirruNode
                        focus $ decode-map-as
                          match (schema/map-field result :focus)
                            (:some value) (or value previous-focus)
                            (:none) previous-focus
                          List Number
                        next-entry $ &struct:assoc entry :code $ :: 'quote tree
                      -> store
                        assoc :files $ schema/assoc-definition files path next-entry
                        assoc :editor $ -> editor (assoc :focus focus)
                          assoc :clipboard $ .unwrap-or (schema/map-field result :clipboard) ([])
                        assoc :warning $ .unwrap-or (schema/map-field result :warning) |
                    assoc store :warning $ str "|target not found at: " path
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) AnyEnum
            -> $ Map Tag Dynamic
            :open :decode
          :tests $ [] $ %{} 'TestEntry
            :name |edits-copy-and-node-replacement-preserve-metadata
            :code $ quote $ let
                raw $ decode-map-as
                  parse-cirru-edn "|{} $ :files $ {}\n  |app.demo $ %{} :FileEntry (:extra |file-kept)\n    :ns $ %{} :CodeEntry (:doc |namespace)\n      :code $ quote $ ns app.demo\n    :defs $ {}\n      |main $ %{} :CodeEntry (:doc |kept-doc) (:schema 'String) (:tests $ [] |kept-test)\n        :code $ quote $ defn main () (println |old)"
                  Map Tag Dynamic
                loaded $ app.fetch/transform-cirru-quoted raw
                path $ [] |app.demo :defs |main
                initial $ -> schema/store
                  assoc :files $ .unwrap $ schema/map-field loaded :files
                  assoc :editor $ {} (:pointer 0)
                    :stack $ [] path
                    :focus $ [] 3 1
                    :clipboard $ []
                    :picker-mode? false
                edited $ updater initial $ :: :call-cirru-edit
                  :: :update-token $ [] ([] 3 1) ||new
                copied $ updater edited $ :: :call-cirru-edit
                  :: :command-copy $ [] 3
                replaced $ updater copied $ :: :cirru-edit-node
                  [] ([] 3 1) ||again
                files $ .unwrap $ schema/map-field replaced :files
                entry $ .unwrap $ schema/definition-at files path
                fields $ schema/entry-fields entry
              assert= (Some ||again)
                app.schema/path-value (schema/entry-tree entry) ([] 3 1)
              assert= (Some |kept-doc) (schema/map-field fields :doc)
              assert= (Some 'String) (schema/map-field fields :schema)
              assert=
                Some $ [] |kept-test
                schema/map-field fields :tests
              assert=
                Some $ [] |println ||new
                app.schema/path-value replaced $ [] :editor :clipboard
              assert= (Some |file-kept)
                get
                  schema/entry-fields $ .unwrap $ get files |app.demo
                  , :extra
        'replace-node $ %{} 'CodeEntry
          :doc "|按 Number 游标替换选定代码节点，经显式 Struct 寻址回写；不会将路径穿过 Struct 或丢弃定义的 schema/tests 等字段。"
          :code $ quote $ defn replace-node (store focus code)
            when (empty? focus)
              match code
                (String _token)
                  raise "|The definition code root must remain an expression List"
                (List _expression) &unit
            let
                editor $ decode-map-as
                  .unwrap-or (get store :editor) ({})
                  Map Tag Dynamic
                pointer $ decode-map-as
                  .unwrap-or (get editor :pointer) 0
                  , 'Number
                path $ decode-map-as
                  .unwrap-or
                    app.schema/path-value editor $ [] :stack pointer
                    []
                  List app.schema/DefinitionPathPart
                files $ .unwrap-or (get store :files) ({})
                selected $ if (empty? path) None $ schema/definition-at files path
              match selected
                (:none)
                  assoc store :warning $ str "|target not found at: " path
                (:some entry)
                  if (struct? entry)
                    let
                        tree $ schema/entry-tree entry
                        next-entry $ &struct:assoc entry :code $ :: 'quote (assoc-in tree focus code)
                      assoc store :files $ schema/assoc-definition files path next-entry
                    assoc store :warning $ str "|target not found at: " path
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) (List Number) CirruNode
            -> $ Map Tag Dynamic
        'updater $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (store op)
            match op
              (:states cursor s)
                update-states store
                  decode-map-as cursor $ List Dynamic
                  , s
              (:load-files data)
                -> store
                  assoc :package $
                    get data :package
                    , .unwrap-or |
                  assoc :configs $
                    get data :configs
                    , .unwrap-or $ {}
                  assoc :files $
                    get data :files
                    , .unwrap-or $ {}
                  assoc :saved-files $
                    get data :files
                    , .unwrap-or $ {}
              (:files-synced files)
                assoc store :saved-files $ decode-map-as files $ Map String Dynamic
              (:router r) (assoc store :router r)
              (:stack-pointer p)
                assoc-in store ([] :editor :pointer) (decode-map-as p 'Number)
              (:pointer-down idx)
                let
                    index $ decode-map-as idx 'Number
                    editor $ decode-map-as
                      .unwrap-or (get store :editor) ({})
                      Map Tag Dynamic
                    stack $ decode-map-as
                      .unwrap-or (get editor :stack) ([])
                      List Dynamic
                    pointer $ decode-map-as
                      .unwrap-or (get editor :pointer) 0
                      , 'Number
                  if
                    >= index $ dec $ count stack
                    , store $ assoc store :editor $ assoc editor :pointer (inc pointer)
              (:pointer-up idx)
                let
                    index $ decode-map-as idx 'Number
                    editor $ decode-map-as
                      .unwrap-or (get store :editor) ({})
                      Map Tag Dynamic
                    pointer $ decode-map-as
                      .unwrap-or (get editor :pointer) 0
                      , 'Number
                  if (= 0 index) store $ assoc store :editor $ assoc editor :pointer (dec pointer)
              (:pointer-shrink idx)
                let
                    index $ decode-map-as idx 'Number
                    editor $ decode-map-as
                      .unwrap-or (get store :editor) ({})
                      Map Tag Dynamic
                    stack $ decode-map-as
                      .unwrap-or (get editor :stack) ([])
                      List Dynamic
                    pointer $ decode-map-as
                      .unwrap-or (get editor :pointer) 0
                      , 'Number
                  if (contains? stack index)
                    let
                        next-stack $ dissoc stack index
                        next-pointer $ .unwrap $ max
                          [] 0 $ .unwrap $ min
                            []
                              dec $ count next-stack
                              if (<= index pointer) (dec pointer) pointer
                      assoc store :editor $ -> editor (assoc :stack next-stack) (assoc :pointer next-pointer)
                    , store
              (:call-cirru-edit op-data)
                if (enum? op-data) (apply-cirru-edit store op-data) (raise "|Expected a Cirru editor operation Enum")
              (:cirru-edit-node op-data)
                let
                    args $ decode-map-as op-data $ List Dynamic
                    focus $ decode-map-as
                      .unwrap $ get args 0
                      List Number
                    code $ decode-map-as
                      .unwrap $ get args 1
                      , calcit.core/CirruNode
                  replace-node store focus code
              (:def-path op-data)
                let
                    path $ decode-map-as op-data $ List app.schema/DefinitionPathPart
                    editor $ decode-map-as
                      .unwrap-or (get store :editor) ({})
                      Map Tag Dynamic
                    pointer $ decode-map-as
                      .unwrap-or (get editor :pointer) 0
                      , 'Number
                    stack $ decode-map-as
                      .unwrap-or (get editor :stack) ([])
                      List $ List app.schema/DefinitionPathPart
                    next-pointer $ inc pointer
                    next-editor $ if
                      and (contains? stack next-pointer)
                        match (get stack next-pointer)
                          (:some existing) (= path existing)
                          (:none) false
                      assoc editor :pointer next-pointer
                      -> editor
                        assoc :pointer $ if (empty? stack) 0 next-pointer
                        assoc :stack $ if (empty? stack) ([] path) (&list:assoc-after stack pointer path)
                  -> store
                    assoc :router $ {} $ :name :editor
                    assoc :editor next-editor
              (:focus op-data)
                assoc-in store ([] :editor :focus)
                  decode-map-as op-data $ List Number
              (:warn op-data) (assoc store :warning op-data)
              (:ok) (assoc store :warning nil)
              (:add-ns op-data)
                let
                    name $ decode-map-as (or op-data |TODO_NS) 'String
                    files $ .unwrap-or (get store :files) ({})
                  if (map? files)
                    if (contains? files name)
                      assoc store :warning $ str "|namespace already exists: " name
                      assoc store :files $ assoc files name $ schema/FileEntry :ns
                        schema/CodeEntry :doc | :code $ :: 'quote $ [] |ns name
                        , :defs ({})
                    raise "|Expected a Snapshot file map"
              (:rm-ns op-data)
                if (nil? op-data) store $ assoc store :files $ schema/dissoc-definition
                  .unwrap-or (get store :files) ({})
                  [] (decode-map-as op-data 'String) :ns
              (:add-def op-data)
                let
                    names $ decode-map-as
                      or op-data $ [] |TODO_NS |TODO_DEF
                      List String
                    ns-name $ .unwrap $ get names 0
                    name $ .unwrap $ get names 1
                    path $ decode-map-as ([] ns-name :defs name) (List app.schema/DefinitionPathPart)
                    files $ .unwrap-or (get store :files) ({})
                  if
                    .some? $ schema/definition-at files $ [] ns-name :ns
                    if
                      .some? $ schema/definition-at files path
                      , store $ assoc store :files $ schema/assoc-definition files path
                        schema/CodeEntry :doc | :code $ :: 'quote $ [] |defn name ([])
                    , store
              (:rm-def op-data)
                let
                    names $ decode-map-as
                      or op-data $ [] |TODO_NS |TODO_DEF
                      List String
                    path $ decode-map-as
                      []
                        .unwrap $ get names 0
                        , :defs $ .unwrap $ get names 1
                      List app.schema/DefinitionPathPart
                  assoc store :files $ schema/dissoc-definition
                    .unwrap-or (get store :files) ({})
                    , path
              (:mv-ns op-data)
                let
                    names $ decode-map-as op-data $ List String
                    from $ .unwrap $ get names 0
                    to $ .unwrap $ get names 1
                    files $ .unwrap-or (get store :files) ({})
                  if (= from to) store $ match
                    schema/definition-at files $ [] from :ns
                    (:none)
                      assoc store :warning $ str "|unknown ns: " from
                    (:some entry)
                      if
                        .some? $ get files to
                        assoc store :warning $ str "|namespace already exists: " to
                        let
                            file $ .unwrap $ get files from
                            renamed $ schema/rename-entry entry to
                          if (struct? file)
                            assoc store :files $ assoc (dissoc files from) to $ &struct:assoc file :ns renamed
                            raise "|Expected a Snapshot file Struct"
              (:mv-def op-data)
                let
                    names $ decode-map-as op-data $ List String
                    from $ split
                      .unwrap $ get names 0
                      , |/
                    to $ split
                      .unwrap $ get names 1
                      , |/
                    from-path $ decode-map-as
                      []
                        .unwrap $ get from 0
                        , :defs $ .unwrap $ get from 1
                      List app.schema/DefinitionPathPart
                    to-path $ decode-map-as
                      []
                        .unwrap $ get to 0
                        , :defs $ .unwrap $ get to 1
                      List app.schema/DefinitionPathPart
                    files $ .unwrap-or (get store :files) ({})
                  if (= from-path to-path) store $ match (schema/definition-at files from-path)
                    (:none) (assoc store :warning "|unknown source definition")
                    (:some entry)
                      if-not
                        .some? $ schema/definition-at files $ []
                          .unwrap $ get to 0
                          , :ns
                        assoc store :warning "|unknown target namespace"
                        if
                          .some? $ schema/definition-at files to-path
                          assoc store :warning "|target definition already exists"
                          let
                              renamed $ schema/rename-entry entry $ .unwrap (get to 1)
                              removed $ schema/dissoc-definition files from-path
                            -> store
                              assoc :files $ schema/assoc-definition removed to-path renamed
                              assoc :warning nil
              (:picker-mode op-data)
                assoc-in store ([] :editor :picker-mode?) (decode-map-as op-data 'Bool)
              (:focus-or-pick op-data)
                let
                    picked $ decode-map-as op-data $ List Number
                    editor $ decode-map-as
                      .unwrap-or (get store :editor) ({})
                      Map Tag Dynamic
                    picker? $ decode-map-as
                      .unwrap-or (get editor :picker-mode?) false
                      , 'Bool
                  if picker?
                    let
                        pointer $ decode-map-as
                          .unwrap-or (get editor :pointer) 0
                          , 'Number
                        path $ decode-map-as
                          .unwrap-or
                            app.schema/path-value editor $ [] :stack pointer
                            []
                          List app.schema/DefinitionPathPart
                        files $ .unwrap-or (get store :files) ({})
                      match
                        if (empty? path) None $ schema/definition-at files path
                        (:none) (assoc store :warning "|target definition not found")
                        (:some entry)
                          match
                            app.schema/path-value (schema/entry-tree entry) picked
                            (:none) (assoc store :warning "|target node not found")
                            (:some item)
                              let
                                  focus $ decode-map-as
                                    .unwrap-or (get editor :focus) ([])
                                    List Number
                                  changed $ replace-node store focus $ decode-map-as item calcit.core/CirruNode
                                assoc-in changed ([] :editor :picker-mode?) false
                    assoc-in store ([] :editor :focus) picked
              (:deps-tree op-data) (assoc store :deps-tree op-data)
              (:hydrate-storage op-data)
                decode-map-as op-data $ Map Tag Dynamic
              _ $ do (eprintln "|unknown op" op) store
          :examples $ []
          :schema $ quote $ Fn (Map Tag Dynamic) AnyEnum
            -> $ Map Tag Dynamic
            :open :decode
          :tests $ [] $ %{} 'TestEntry (:name |mutations-preserve-metadata-and-history)
            :code $ quote $ let
                raw $ decode-map-as
                  parse-cirru-edn "|{} $ :files $ {}\n  |app.demo $ %{} :FileEntry (:extra |kept-file)\n    :ns $ %{} :CodeEntry (:doc |namespace)\n      :code $ quote $ ns app.demo\n    :defs $ {}\n      |main $ %{} :CodeEntry (:doc |kept-doc) (:schema 'String) (:tests $ [] |kept-test)\n        :code $ quote $ defn main () (println |old)"
                  Map Tag Dynamic
                loaded $ app.fetch/transform-cirru-quoted raw
                initial $ assoc schema/store :files $ .unwrap (get loaded :files)
                run $ fn (state operation)
                  hint-fn $ Fn (Map Tag Dynamic) AnyEnum $ -> (Map Tag Dynamic)
                  updater state operation
                created $ run initial $ :: :add-ns |app.other
                added $ run created $ :: :add-def ([] |app.other |temporary)
                moved $ run added $ :: :mv-def ([] |app.demo/main |app.other/moved)
                renamed $ run moved $ :: :mv-ns ([] |app.other |app.renamed)
                files $ .unwrap $ get renamed :files
                entry $ .unwrap $ schema/definition-at files ([] |app.renamed :defs |moved)
                fields $ schema/entry-fields entry
                removed $ run renamed $ :: :rm-def ([] |app.renamed |temporary)
                duplicate $ run removed $ :: :add-ns |app.renamed
                deleted $ run removed $ :: :rm-ns |app.renamed
                a $ [] |app.demo :defs |a
                b $ [] |app.demo :defs |b
                c $ [] |app.demo :defs |c
                nav-a $ run initial $ :: :def-path a
                nav-b $ run nav-a $ :: :def-path b
                nav-c $ run nav-b $ :: :def-path c
                pointer $ run nav-c $ :: :stack-pointer 0
                future-closed $ run pointer $ :: :pointer-shrink 2
                current-closed $ run future-closed $ :: :pointer-shrink 0
                state-updated $ run current-closed $ :: :states ([] :editor 0 :drag)
                  {} $ :active? true
                selected $ run initial $ :: :def-path ([] |app.demo :defs |main)
                focused $ run selected $ :: :focus ([] 3 1)
                picking $ run focused $ :: :picker-mode true
                picked $ run picking $ :: :focus-or-pick ([] 3)
                picked-entry $ .unwrap $ schema/definition-at
                  .unwrap $ get picked :files
                  [] |app.demo :defs |main
              assert= None $ schema/definition-at files $ [] |app.demo :defs |main
              assert= (Some |moved)
                get (schema/entry-tree entry) 1
              assert= (Some |kept-doc) (get fields :doc)
              assert= (Some 'String) (get fields :schema)
              assert=
                Some $ [] |kept-test
                get fields :tests
              assert= (Some |app.renamed)
                get
                  schema/entry-tree $ .unwrap $ schema/definition-at files ([] |app.renamed :ns)
                  , 1
              assert= None $ schema/definition-at
                .unwrap $ get removed :files
                [] |app.renamed :defs |temporary
              assert= (get removed :files) (get duplicate :files)
              assert= None $ schema/definition-at
                .unwrap $ get deleted :files
                [] |app.renamed :ns
              assert= (Some |kept-file)
                get
                  schema/entry-fields $ .unwrap $ get
                    .unwrap $ get deleted :files
                    , |app.demo
                  , :extra
              assert= (Some 0)
                app.schema/path-value future-closed $ [] :editor :pointer
              assert=
                Some $ [] a b
                app.schema/path-value future-closed $ [] :editor :stack
              assert= (Some 0)
                app.schema/path-value current-closed $ [] :editor :pointer
              assert=
                Some $ [] b
                app.schema/path-value current-closed $ [] :editor :stack
              assert= (Some true)
                app.schema/path-value state-updated $ [] :states :editor 0 :drag :data :active?
              assert= (Some |println)
                app.schema/path-value (schema/entry-tree picked-entry) ([] 3 1 0)
              assert= (Some false)
                app.schema/path-value picked $ [] :editor :picker-mode?
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require
            phlox.cursor :refer $ update-states
            cirru-editor.core :refer $ cirru-edit
            app.schema :as schema
