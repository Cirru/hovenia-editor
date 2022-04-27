
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!) (:version nil)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/ |pointed-prompt/ |alerts.calcit/ |respo-cirru-editor/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:reload-fn |app.server/reload!)
      :modules $ [] |calcit-http/
  :files $ {}
    |app.analyze $ {}
      :defs $ {}
        |analyze-deps $ quote
          defn analyze-deps (files)
            let
                ns-deps-dict $ -> files
                  map-kv $ fn (ns file)
                    [] ns $ parse-import-dict
                      get-in file $ [] :ns 1
                defs-deps-dict $ -> files .to-list
                  mapcat $ fn (pair)
                    let
                        ns $ nth pair 0
                        defs $ -> pair (nth 1) (get :defs)
                      -> defs (.to-list)
                        map $ fn (pair)
                          let
                              def-name $ nth pair 0
                              code $ -> pair (nth 1) (nth 1)
                            [] ([] ns def-name)
                              lookup-body-deps (slice code 2) (get ns-deps-dict ns) ns def-name $ keys defs
                  pairs-map
                ; defs-dependants-dict $ lookup-dependants defs-deps-dict
              , defs-deps-dict
        |digit-pattern $ quote
          def digit-pattern $ new js/RegExp "\"^\\d$"
        |flatten $ quote
          defn flatten (xs)
            if (list? xs) (mapcat xs flatten) ([] xs)
        |lookup-body-deps $ quote
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
        |lookup-dependants $ quote
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
        |lookup-target-def $ quote
          defn lookup-target-def (token files def-path pkg)
            let
                ns $ first def-path
                imports-form $ get-in files ([] ns :ns 1)
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
        |parse-import-dict $ quote
          defn parse-import-dict (ns-form)
            loop
                dict $ {}
                  :namespaces $ {}
                  :defs $ {}
                  :npm-defaults $ {}
                  :npm-defs $ {}
                  :npm-namespaces $ {}
                rules $ rest (nth ns-form 2 )
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
                            if (empty? d) dict $ let
                                d0 $ first defs
                              recur (assoc d d0 target) (rest defs)
                        rest rules
                      recur
                        update dict :defs $ fn (dict)
                          loop
                              d dict
                              defs defs-list
                            if (empty? defs) d $ let
                                d0 $ first defs
                              recur (assoc d d0 target) (rest defs)
                        rest rules
                  "\":default" $ recur
                    assoc-in dict
                      [] :npm-defaults $ nth rule 2
                      nth rule 0
                    rest rules
        |regularize-rule $ quote
          defn regularize-rule (rule)
            -> rule
              filter $ fn (item) (not= item "\"[]")
              map $ fn (item)
                if (list? item) (regularize-rule item) item
        |strip-at $ quote
          defn strip-at (token)
            if
              = "\"@" $ nth token 0
              .!slice token 1
              , token
      :ns $ quote (ns app.analyze)
    |app.comp.deps-tree $ {}
      :defs $ {}
        |*defs-layout-stack $ quote
          defatom *defs-layout-stack $ {}
        |*defs-metrics-states $ quote
          defatom *defs-metrics-states $ {}
        |build-defs-metrics $ quote
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
        |calcit-def? $ quote
          defn calcit-def? (item)
            or
              = :def $ nth item 2
              = :ns $ nth item 2
        |comp-deps-tree $ quote
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
        |expand-layout-xy $ quote
          defn expand-layout-xy (info)
            let
                max-y $ get-def-stack-y-of (:depth info)
              []
                * 320 $ :depth info
                * 20 $ - (:y info) (* 0.4 max-y)
        |get-def-stack-y-of $ quote
          defn get-def-stack-y-of (depth) (get @*defs-layout-stack depth)
        |new-def-stack-y-of $ quote
          defn new-def-stack-y-of (depth size)
            let
                dict @*defs-layout-stack
              if (contains? dict depth)
                let
                    v $ get dict depth
                  swap! *defs-layout-stack update depth $ fn (x) (+ x size)
                  , v
                do (swap! *defs-layout-stack assoc depth size) 0
        |str-def-entry $ quote
          defn str-def-entry (pair pkg)
            let[] (ns def-name) pair $ if (.starts-with? ns pkg)
              str (.strip-prefix ns pkg) "\"/" def-name
              str ns "\"/" def-name
      :ns $ quote
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
    |app.comp.key-event $ {}
      :defs $ {}
        |comp-key-event $ quote
          defcomp comp-key-event (on-event)
            [] (effect-listen-keyboard)
              span $ {}
                :on-keydown $ fn (e d!) (on-event e d!)
        |effect-listen-keyboard $ quote
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
      :ns $ quote
        ns app.comp.key-event $ :require (respo-ui.core :as ui)
          respo-ui.core :refer $ hsl
          respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
          respo.comp.space :refer $ =<
          app.config :refer $ dev? api-host
    |app.comp.nav $ {}
      :defs $ {}
        |comp-files-entry $ quote
          defcomp comp-files-entry (cursor state files on-close)
            div
              {} $ :style (merge ui/expand ui/row)
              list->
                {} $ :style ui/expand
                -> (keys files) .to-list sort $ map
                  fn (ns)
                    [] ns $ div
                      {} (:class-name "\"hover-entry")
                        :style $ merge
                          {} (:font-family ui/font-code) (:cursor :pointer) (:line-height 2) (:padding "\"0 8px")
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
                    {} $ :style ui/expand
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
                            {} (:class-name "\"hover-entry")
                              :style $ merge
                                {} (:font-family ui/font-code) (:cursor :pointer) (:line-height 2) (:padding "\"0 8px")
                              :on-click $ fn (e d!)
                                d! :def-path $ [] ns :defs def-name
                                on-close d!
                            <> def-name
        |comp-menu $ quote
          defcomp comp-menu (states files def-path on-close)
            let
                cursor $ :cursor states
                state $ or (:data states)
                  {} (:ns nil) (:query "\"") (:select-idx 0)
                queries $ .split (:query state) "\" "
                entries $ -> files .to-list
                  mapcat $ fn (entry)
                    let[] (ns file) entry $ flipped prepend ([] ns :ns)
                      -> (:defs file) keys .to-list $ .map
                        fn (def-name) ([] ns :defs def-name)
                  filter $ fn (entry)
                    every? queries $ fn (x)
                      .includes? (str entry) x
              [] (effect-focus "\"#query-box")
                div
                  {} $ :style
                    merge ui/column $ {} (:position :absolute) (:top 0) (:left 0) (:width 480) (:height "\"88vh") ("\"×" 100) (:backdrop-filter "\"blur(1.5px)") (:border-radius "\"6px") (:padding 8) (:border-width "\"0 1px 1px 0") (:z-index 100)
                      :border $ str "\"1px solid " (hsl 0 0 30)
                      :background-color $ hsl 0 0 20 0.4
                  div
                    {} $ :style ui/row-parted
                    input $ {} (:id "\"query-box")
                      :style $ merge ui/input
                        {} (:background-color :transparent) (:font-family ui/font-code) (:color :white)
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
        |comp-navbar $ quote
          defcomp comp-navbar (store states)
            let
                cursor $ :cursor states
                state $ or (:data states)
                  {} $ :menu? false
                command-plugin $ use-prompt (>> states :command)
                  {} (:text "\"command")
                    :input-style $ {} (:font-family ui/font-code)
                editor $ :editor store
                def-path $ get-in editor
                  [] :stack $ :pointer editor
              div ({})
                div
                  {} $ :style (merge ui/row-parted style-navbar)
                  span $ {} (:class-name "\"hover-entry")
                    :style $ {} (:cursor :pointer) (:padding "\"4px 8px") (:font-family "\"Josefin Sans")
                      :color $ hsl 200 80 70
                    :inner-text "\"Hovernia"
                    :on-click $ fn (e d!)
                      d! cursor $ assoc state :menu? true
                      d! :router $ {} (:name :editor)
                      .!preventDefault $ :event e
                  div ({})
                    a $ {} (:inner-text "\"Save") (:style ui/link)
                      :on-click $ fn (e d!)
                        on-save (:files store) (:saved-files store) d!
                    =< 8 nil
                    a $ {} (:inner-text "\"Command") (:style ui/link)
                      :on-click $ fn (e d!)
                        .show command-plugin d! $ fn (content)
                          let
                              code $ first (parse-cirru content)
                            if (list? code) (run-command code store d!)
                              d! :warn $ str "\"invalid command:" code
                if (:menu? state)
                  comp-menu (>> states :menu) (:files store) def-path $ fn (d!)
                    d! cursor $ assoc state :menu? false
                div
                  {} $ :style style-error
                  <> $ or (:warning store) "\""
                comp-stack (:stack editor) (:pointer editor) (:package store)
                if (:picker-mode? editor) (comp-picker-mode)
                comp-key-event $ fn (e d!)
                  cond
                      and
                        or (:meta? e) (:ctrl? e)
                        = "\"p" $ :key e
                      if (:shift? e)
                        .show command-plugin d! $ fn (content)
                          let
                              code $ first (parse-cirru content)
                            if (list? code) (run-command code store d!)
                              d! :warn $ str "\"invalid command:" code
                        d! cursor $ update state :menu? not
                    (and (or (:meta? e) (:ctrl? e)) (= "\"s" (:key e)))
                      on-save (:files store) (:saved-files store) d!
                    true nil
                .render command-plugin
        |comp-picker-mode $ quote
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
        |comp-search-entry $ quote
          defcomp comp-search-entry (cursor state entries selected-idx on-select on-close)
            let () $ list->
              {} $ :style (merge ui/expand)
              -> entries $ map-indexed
                fn (idx entry)
                  [] (str entry)
                    div
                      {} (:class-name "\"hover-entry")
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
                          <>
                            str (first entry) "\"/"
                            {} (:font-size 10)
                              :color $ hsl 0 0 70
                          =< 8 nil
                          <> $ last entry
        |effect-focus $ quote
          defeffect effect-focus (query) (action el at?)
            .!select $ js/document.querySelector query
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
                .!then $ fn (res) (d! :ok nil)
                .!catch $ fn (e)
                  d! :warn $ str e
        |run-command $ quote
          defn run-command (code store d!)
            let
                p1 $ get code 1
              case-default (first code)
                d! :warn $ str "\"invalid command: " code
                "\"add-ns" $ d! :add-ns p1
                "\"rm-ns" $ d! :rm-ns p1
                "\"add-def" $ d! :add-def
                  [] p1 $ nth code 2
                "\"rm-def" $ d! :rm-def
                  [] p1 $ nth code 2
                "\"mv-ns" $ d! :mv-ns
                  [] p1 $ nth code 2
                "\"mv-def" $ d! :mv-def
                  [] p1 $ nth code 2
                "\"load" $ load-files! d!
                "\"save" $ on-save (:files store) (:saved-files store) d!
                "\"pick" $ if (= p1 "\"off") (d! :picker-mode false) (d! :picker-mode true)
                "\"deps-tree" $ do
                  d! :router $ {} (:name :deps-tree)
                  d! :deps-tree $ wo-js-log
                    analyze-deps $ :files store
        |style-error $ quote
          def style-error $ {} (:position :fixed) (:bottom 0) (:left 0) (:font-size 14) (:font-family ui/font-code) (:padding "\"8px 16px")
            :color $ hsl 0 90 70
            :background-color $ hsl 0 0 0 0.7
        |style-navbar $ quote
          def style-navbar $ {} (:padding "\"0px 8px") (:position :absolute) (:top 16) (:left 0) (:width "\"100%") (:height 0)
      :ns $ quote
        ns app.comp.nav $ :require (respo-ui.core :as ui)
          respo-ui.core :refer $ hsl
          respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
          respo.comp.space :refer $ =<
          app.config :refer $ dev? api-host
          app.widget :as widget
          respo-alerts.core :refer $ use-prompt
          app.comp.key-event :refer $ comp-key-event
          app.fetch :refer $ load-files!
          app.analyze :refer $ analyze-deps
          app.comp.stack :refer $ comp-stack
    |app.comp.stack $ {}
      :defs $ {}
        |comp-stack $ quote
          defcomp comp-stack (stack pointer pkg) (js/console.log stack)
            div ({})
              list->
                {} $ :style
                  merge ui/column $ {} (:position :absolute) (:opacity 0.8) (:top 32) (:left 8) (:z-index 0) (:align-items :flex-start)
                -> stack $ map-indexed
                  fn (idx frame)
                    [] idx $ div
                      {}
                        :on-click $ fn (e d!) (d! :stack-pointer idx)
                        :style $ merge
                          {} (:cursor :pointer) (:padding "\"4px 8px")
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
      :ns $ quote
        ns app.comp.stack $ :require (respo-ui.core :as ui)
          respo-ui.core :refer $ hsl
          respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
          respo.comp.space :refer $ =<
          app.widget :as widget
          app.comp.key-event :refer $ comp-key-event
          app.analyze :refer $ analyze-deps
    |app.config $ {}
      :defs $ {}
        |api-host $ quote
          def api-host $ str "\"http://" (get-env "\"host" "\"localhost") "\":" (get-env "\"port" "\"6101")
        |code-font $ quote (def code-font "\"Roboto Mono, monospace")
        |cors-headers $ quote
          def cors-headers $ {} (:Content-Type "\"data/cirru-edn") (:Access-Control-Allow-Origin "\"*") (:Access-Control-Allow-Methods "\"*")
        |dot-radius $ quote (def dot-radius 4)
        |leaf-gap $ quote (def leaf-gap 16)
        |leaf-height $ quote (def leaf-height 24)
        |line-height $ quote (def line-height 32)
        |site $ quote
          def site $ {} (:title "\"Phlox") (:icon "\"http://cdn.tiye.me/logo/quamolit.png") (:storage-key "\"phlox-workflow")
        |twist-distance $ quote
          def twist-distance $ * 0.8 js/window.innerWidth
      :ns $ quote
        ns app.config $ :require ("\"mobile-detect" :default mobile-detect)
    |app.container $ {}
      :defs $ {}
        |all-block? $ quote
          defn all-block? (item) (every? item list?)
        |base-dot $ quote
          def base-dot $ {} (:radius dot-radius) (:alpha 1)
            :position $ [] 0 0
        |char-keymap $ quote
          defn char-keymap (key)
            case-default key key ("\":" "\";") ("\";" "\":") ("\"\\" "\"|") ("\"|" "\"\\")
        |comp-container $ quote
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
                :editor $ container
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
                              target $ -> files
                                get-in $ either
                                  get-in editor $ [] :stack (:pointer editor)
                                  []
                                get 1
                                get-in focus
                            cond
                                list? target
                                handle-expr-event focus (dissoc e :event) d!
                              (string? target)
                                handle-leaf-event store focus target (dissoc e :event) d!
                              (nil? nil) nil
                              true $ js/console.error "\"unknown target" target
                  :tree $ let
                      item $ -> files
                        get-in $ either
                          get-in editor $ [] :stack (:pointer editor)
                          []
                        get 1
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
                :deps-tree $ if
                  nil? $ :deps-tree store
                  text $ {} (:text "\"tree is empty")
                    :position $ [] 1 1
                    :style $ {} (:fill |red) (:font-size 14) (:font-family |Hind)
                  comp-deps-tree (:deps-tree store) (-> store :configs :init-fn) (:package store)
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
        |handle-expr-event $ quote
          defn handle-expr-event (focus e d!)
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
                true $ do (;nil js/console.log "\"unknown event:" e)
        |handle-leaf-event $ quote
          defn handle-leaf-event (store focus token e d!)
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
                  if-let
                    next-def-path $ let
                        editor $ :editor store
                      lookup-target-def (strip-at token) (:files store)
                        get-in editor $ [] :stack (:pointer editor)
                        :package store
                    d! :def-path next-def-path
                    d! :warn $ str "\"not found: " token
                (and meta? (= "\"v" key))
                  d! :call-cirru-edit $ [] :command-paste focus
                (and (= 1 (count key)) (not meta?))
                  d! :call-cirru-edit $ [] :update-token
                    [] focus $ str token (char-keymap key)
                true $ do (;nil js/console.warn "\"unknown event:" e)
        |head-in-list $ quote
          defn head-in-list (xs)
            if
              some? $ first xs
              list? $ first xs
              , false
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
        |on-expr-click $ quote
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
                      first $ parse-cirru content
                d! :focus-or-pick coord
        |pattern-number $ quote
          def pattern-number $ new js/RegExp "\"^-?\\d+(\\.\\d+)?$"
        |pick-leaf-color $ quote
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
        |shape-focus $ quote
          def shape-focus $ circle
            {}
              :radius $ + dot-radius 2
              :position $ [] 0 0
              :line-style $ {} (:width 1)
                :color $ hslx 60 80 80
                :alpha 0.8
        |style-active-line $ quote
          def style-active-line $ {} (:width 2) (:alpha 1)
            :color $ hslx 20 100 70
        |style-shadow-line $ quote
          def style-shadow-line $ {} (:width 1) (:alpha 0.7)
            :color $ hslx 200 70 54
        |turn-quoted $ quote
          defn turn-quoted (target)
            if (string? target) (turn-symbol target) (map target turn-quoted)
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
                  :tree $ let
                      focused? $ = coord focus
                    container ({})
                      polyline $ {}
                        :style $ if focused? style-active-line
                          assoc style-shadow-line :color $ hslx 120 90 30
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
        |wrap-expr-with-linear $ quote
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
        |wrap-leaf $ quote
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
        |wrap-linear-expr $ quote
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
      :ns $ quote
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
    |app.fetch $ {}
      :defs $ {}
        |load-files! $ quote
          defn load-files! (d!)
            -> (str api-host "\"/compact-data") (js/fetch)
              .!then $ fn (res) (.!text res)
              .!then $ fn (text)
                let
                    compact-files $ parse-cirru-edn text
                  if (some? compact-files)
                    do (d! :load-files compact-files) (d! :ok nil)
                    do (js/console.log "\"unknown data:" compact-files) (d! :warn "\"unknown data")
              .!catch $ fn (err)
                d! :warn $ str err
      :ns $ quote
        ns app.fetch $ :require
          app.config :refer $ api-host
    |app.main $ {}
      :defs $ {}
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
        |handle-global-keys $ quote
          defn handle-global-keys () $ js/window.addEventListener "\"keydown"
            fn (event)
              cond $ true
                do $ js/console.log event
        |main! $ quote
          defn main! () (; js/console.log PIXI)
            if dev? $ load-console-formatter!
            -> (new FontFaceObserver "\"Roboto Mono") (.!load)
              .!then $ fn (event) (render-app!) ("js/window._phloxTree. renderer.plugins.accessibility.destroy")
            add-watch *store :change $ fn (store prev) (render-app!)
            when true (render-control!) (start-control-loop! 8 on-control-event)
            load-files! dispatch!
            ; handle-global-keys
            println "\"App Started"
        |mount-target $ quote
          def mount-target $ js/document.querySelector "\".app"
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (clear-phlox-caches!) (respo/clear-cache!) (remove-watch *store :change)
              add-watch *store :change $ fn (store prev) (render-app!)
              render-app!
              when true $ replace-control-loop! 8 on-control-event
              hud! "\"ok~" "\"Ok"
              load-files! dispatch!
            hud! "\"error" build-errors
        |render-app! $ quote
          defn render-app! ()
            render! (comp-container @*store) dispatch! $ {}
            respo/render! mount-target
              comp-navbar @*store $ >> (:states @*store) :dom
              , dispatch!
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
          app.comp.nav :refer $ comp-navbar on-save
          respo.core :refer $ defcomp defeffect <> >> div button textarea span input
          respo.core :as respo
          respo.comp.space :refer $ =<
          app.fetch :refer $ load-files!
    |app.math $ {}
      :defs $ {}
        |add-path $ quote
          defn add-path
              [] a b
              [] x y
            [] (+ a x) (+ b y)
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
        |rough-size $ quote
          defn rough-size
              [] x y
            + (js/Math.abs x) (js/Math.abs y)
        |subtract-path $ quote
          defn subtract-path
              [] a b
              [] x y
            [] (- a x) (- b y)
      :ns $ quote (ns app.math)
    |app.schema $ {}
      :defs $ {}
        |inline $ quote
          defmacro inline (path)
            read-file $ str "\"data/" path
        |store $ quote
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
      :ns $ quote (ns app.schema)
    |app.server $ {}
      :defs $ {}
        |*app-server $ quote (defatom *app-server nil)
        |main! $ quote
          defn main! () (println "\"start web server") (start-server!)
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
                  println "\"wrote to" "\".compact-inc.cirru" "\"and" "\"compact.cirru"
                  ; println "\"data" $ :body req
                  {} (:code 200) (:headers cors-headers)
                    :body $ format-cirru-edn
                      {} (:ok? true) (:data "\"wrote")
                :OPTIONS $ {} (:code 200) (:headers cors-headers) (:body "\"OK")
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
        |reload! $ quote
          defn reload! () $ println "\"reload..."
        |start-server! $ quote
          defn start-server! () $ reset! *app-server
            serve-http!
              {} (:port 6101) (:host "\"0.0.0.0")
              fn (req) (on-request req)
      :ns $ quote
        ns app.server $ :require
          http.core :refer $ serve-http!
          app.config :refer $ cors-headers
    |app.updater $ {}
      :defs $ {}
        |splice-after $ quote
          defn splice-after (xs i ys)
            loop
                acc xs
                data $ reverse ys
              if (empty? data) acc $ recur
                &list:assoc-after acc i $ first data
                rest data
        |updater $ quote
          defn updater (store op op-data op-id op-time)
            case-default op
              do (eprintln "\"unknown op" op op-data) store
              :states $ update-states store op-data
              :load-files $ -> store
                assoc :package $ :package op-data
                assoc :configs $ :configs op-data
                assoc :files $ :files op-data
                assoc :saved-files $ :files op-data
              :router $ assoc store :router op-data
              :stack-pointer $ assoc-in store ([] :editor :pointer) op-data
              :pointer-down $ update store :editor
                fn (editor)
                  let
                      size $ count (:stack editor)
                    if
                      >= op-data $ dec size
                      , editor $ update editor :pointer inc
              :pointer-up $ update store :editor
                fn (editor)
                  let
                      size $ count (:stack editor)
                    if (= 0 op-data) editor $ update editor :pointer dec
              :pointer-shrink $ update store :editor
                fn (editor)
                  if
                    contains? (:stack editor) (:pointer editor)
                    -> editor
                      update :pointer $ fn (idx)
                        if (= 0 idx) 0 $ dec idx
                      update :stack $ fn (xs) (dissoc xs op-data)
                    , editor
              :call-cirru-edit $ let
                  editor $ :editor store
                  def-path $ prepend
                    get-in editor $ [] :stack (:pointer editor)
                    , :files
                  def-target $ -> store (get-in def-path)
                if (tuple? def-target)
                  let
                      result $ cirru-edit
                        {}
                          :tree $ nth def-target 1
                          :clipboard $ :clipboard editor
                        nth op-data 0
                        nth op-data 1
                    ; js/console.log op-data result
                    if-let
                      warning $ :warning result
                      js/console.warn warning
                    -> store
                      assoc-in def-path $ :: 'quote (:tree result)
                      assoc-in ([] :editor :focus)
                        or (:focus result) (:focus editor)
                      assoc :warning (:warning result) :clipboard $ :clipboard result
                  assoc store :warning $ str "\"target not found at:" def-path
              :cirru-edit-node $ let-sugar
                    [] focus code
                    , op-data
                  editor $ :editor store
                  def-path $ prepend
                    get-in editor $ [] :stack (:pointer editor)
                    , :files
                  def-target $ -> store (get-in def-path)
                if (tuple? def-target)
                  assoc-in store def-path $ :: 'quote
                    assoc-in (nth def-target 1) focus code
                  assoc store :warning $ str "\"target not found at:" def-path
              :def-path $ -> store
                assoc :router $ {} (:name :editor)
                update :editor $ fn (editor)
                  let
                      pointer $ :pointer editor
                      stack $ :stack editor
                    merge editor $ if (empty? stack)
                      {} (:pointer 0)
                        :stack $ [] op-data
                      {}
                        :stack $ .assoc-after stack pointer op-data
                        :pointer $ inc pointer
              :focus $ assoc-in store ([] :editor :focus) op-data
              :warn $ assoc store :warning op-data
              :ok $ assoc store :warning nil
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
              :mv-ns $ let[] (from to) op-data
                if
                  contains-in? store $ [] :files from
                  update store :files $ fn (files)
                    -> files (dissoc from)
                      assoc to $ get files from
                  assoc store :warning $ str "\"unknown ns: " from
              :mv-def $ let-sugar
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
                          get-in files $ [] from-ns :defs from-def
                    assoc :warning nil
                  assoc store :warning $ str "\"unknown ns/def: " from
              :picker-mode $ assoc-in store ([] :editor :picker-mode?) op-data
              :focus-or-pick $ if
                :picker-mode? $ :editor store
                let
                    editor $ :editor store
                    def-path $ get-in editor
                      [] :stack $ :pointer editor
                    item $ get-in store
                      concat ([] :files) def-path ([] 1) op-data
                  -> store
                    update-in
                      concat ([] :files) def-path
                      fn (pair)
                        :: 'quote $ assoc-in (nth pair 1) (-> store :editor :focus) item
                    assoc-in ([] :editor :picker-mode?) false
                assoc-in store ([] :editor :focus) op-data
              :deps-tree $ assoc store :deps-tree op-data
              :hydrate-storage op-data
      :ns $ quote
        ns app.updater $ :require
          phlox.cursor :refer $ update-states
          cirru-editor.core :refer $ cirru-edit
    |app.widget $ {}
      :defs $ {}
        |button $ quote
          def button $ merge ui/button
            {} $ :background :black
      :ns $ quote
        ns app.widget $ :require (respo-ui.core :as ui)
