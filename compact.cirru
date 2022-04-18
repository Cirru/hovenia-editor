
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!) (:version nil)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/ |pointed-prompt/ |alerts.calcit/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:reload-fn |app.server/reload!)
      :modules $ [] |calcit-http/
  :files $ {}
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
                  {} (:ns nil) (:query "\"" )
              [] (effect-focus "\"#query-box")
                div
                  {} $ :style
                    merge ui/column $ {} (:position :absolute) (:top 0) (:left 0) (:width 480) (:height "\"88vh") (:z-index 100) (:backdrop-filter "\"blur(1.5px)") (:border-radius "\"6px") (:padding 8) (:border-width "\"0 1px 1px 0")
                      :border $ str "\"1px solid " (hsl 0 0 30)
                      :background-color $ hsl 0 0 20 0.4
                  div
                    {} $ :style ui/row-parted
                    input $ {} (:id "\"query-box")
                      :style $ merge ui/input
                        {} (:background-color :transparent)
                          :color $ hsl 0 0 70
                      :value $ :query state
                      :on-input $ fn (e d!)
                        d! cursor $ assoc state :query (:value e)
                      :autofocus true
                    a $ {} (:inner-text "\"close") (:style ui/link)
                      :on-click $ fn (e d!) (on-close d!)
                  =< nil 8
                  if
                    blank? $ :query state
                    comp-files-entry cursor state files on-close
                    comp-search-entry cursor state files on-close
        |comp-navbar $ quote
          defcomp comp-navbar (store states)
            let
                cursor $ :cursor states
                state $ or (:data states)
                  {} $ :menu? false
                command-plugin $ use-prompt (>> states :command)
                  {} (:text "\"command")
                    :input-style $ {} (:font-family ui/font-code)
              div ({})
                div
                  {} $ :style (merge ui/row-parted style-navbar)
                  span $ {} (:class-name "\"hover-entry")
                    :style $ {} (:cursor :pointer) (:padding "\"4px 8px")
                    :inner-text $ if
                      empty? $ :def-path store
                      , "\"..."
                        str $ .join-str (:def-path store) "\" "
                    :on-click $ fn (e d!)
                      d! cursor $ assoc state :menu? true
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
                            if (list? code) (run-command code d!)
                              d! :warn $ str "\"invalid command:" code
                if (:menu? state)
                  comp-menu (>> states :menu) (:files store) (:def-path store)
                    fn (d!)
                      d! cursor $ assoc state :menu? false
                div
                  {} $ :style style-error
                  <> $ or (:warning store) "\""
                .render command-plugin
        |comp-search-entry $ quote
          defcomp comp-search-entry (cursor state files on-close)
            let
                queries $ .split (:query state) "\" "
                entries $ -> files .to-list
                  mapcat $ fn (entry)
                    let[] (ns file) entry $ flipped prepend ([] ns :ns)
                      -> (:defs file) keys .to-list $ .map
                        fn (def-name) ([] ns :defs def-name)
              list->
                {} $ :style (merge ui/expand)
                -> entries
                  filter $ fn (entry)
                    every? queries $ fn (x)
                      .includes? (str entry) x
                  map $ fn (entry)
                    [] (str entry)
                      div
                        {} (:class-name "\"hover-entry")
                          :style $ {} (:line-height 2) (:font-family ui/font-code) (:cursor :pointer) (:padding "\"0 8px")
                          :on-click $ fn (e d!) (d! :def-path entry) (on-close d!)
                            d! cursor $ assoc state :query "\""
                        <> $ if
                          = 2 $ count entry
                          str (first entry) "\" :ns"
                          str (first entry) "\"/" $ last entry
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
                .then $ fn (res) (js/console.log "\"response" res)
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
        |style-error $ quote
          def style-error $ {} (:position :fixed) (:bottom 0) (:left 0) (:font-size 14) (:font-family ui/font-code) (:padding "\"8px 16px")
            :color $ hsl 0 90 70
            :background-color $ hsl 0 0 0 0.7
        |style-navbar $ quote
          def style-navbar $ {} (:padding "\"4px 8px") (:position :absolute) (:top 0) (:left 0) (:width "\"100%")
      :ns $ quote
        ns app.comp.nav $ :require (respo-ui.core :as ui)
          respo-ui.core :refer $ hsl
          respo.core :refer $ defcomp defeffect <> >> div button textarea span input a list->
          respo.comp.space :refer $ =<
          app.config :refer $ dev? api-host
          app.widget :as widget
          respo-alerts.core :refer $ use-prompt
    |app.config $ {}
      :defs $ {}
        |api-host $ quote
          def api-host $ str "\"http://"
            or (get-env "\"host") "\"localhost"
            , "\":"
              or (get-env "\"port") 6101
        |code-font $ quote (def code-font "\"Roboto Mono, monospace")
        |cors-headers $ quote
          def cors-headers $ {} (:Content-Type "\"data/cirru-edn") (:Access-Control-Allow-Origin "\"*") (:Access-Control-Allow-Methods "\"*")
        |dot-radius $ quote (def dot-radius 4)
        |leaf-gap $ quote (def leaf-gap 16)
        |leaf-height $ quote (def leaf-height 24)
        |line-height $ quote (def line-height 32)
        |site $ quote
          def site $ {} (:title "\"Phlox") (:icon "\"http://cdn.tiye.me/logo/quamolit.png") (:storage-key "\"phlox-workflow")
      :ns $ quote
        ns app.config $ :require ("\"mobile-detect" :default mobile-detect)
    |app.container $ {}
      :defs $ {}
        |all-block? $ quote
          defn all-block? (item) (every? item list?)
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
                        and
                          not $ and (:meta? e)
                            = "\"Tab" $ :key e
                          identical? js/document.body $ .-target (:event e)
                        d! :cirru-edit $ dissoc e :event
                :tree $ let
                    item $ -> files
                      get-in $ :def-path store
                      get 1
                  cond
                      nil? item
                      , nil
                    (string? item)
                      wrap-leaf item ([]) focus false
                    (is-linear? item)
                      wrap-linear-expr item ([]) focus false
                    (with-linear? item)
                      wrap-expr-with-linear item ([]) focus true false
                    true $ wrap-block-expr item ([]) focus
                ; comp-hint (>> states :hint) focus $ get-in tree focus
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
                d! :focus coord
        |pattern-number $ quote
          def pattern-number $ new js/RegExp "\"^-?\\d+(\\.\\d+)?$"
        |pick-leaf-color $ quote
          defn pick-leaf-color (s head?)
            cond
                or (= s "\"true") (= s "\"false") (= s "\"nil") (= s "\";")
                hslx 300 100 30
              (= "\"" s) (hslx 190 50 50)
              (= "\"\"" (get s 0))
                hslx 70 50 40
              (= "\"|" (nth s 0))
                hslx 70 50 40
              (= "\":" (nth s 0))
                hslx 240 80 74
              (.!test pattern-number s) (hslx 340 100 30)
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
            :color $ hslx 200 100 60
        |style-shadow-line $ quote
          def style-shadow-line $ {} (:width 0.5) (:alpha 0.8)
            :color $ hslx 200 100 60
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
                        :style $ if focused? style-active-line style-shadow-line
                        :position $ [] 0 0
                        :points $ [] ([] 0 0) ([] leaf-gap 0)
                          [] leaf-gap $ * line-height
                            &max 0 $ dec y-stack
                      circle $ {} (:radius dot-radius)
                        :position $ [] 0 0
                        :fill $ hslx 120 50 80
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
                          wrap-expr-with-linear item next-coord focus true false
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
          defn wrap-expr-with-linear (xs coord focus parent-winding-okay? smaller?)
            loop
                acc $ []
                ys xs
                x-position leaf-gap
                y-stack 1
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
                        circle $ {} (:radius dot-radius)
                          :position $ [] 0 0
                          :fill $ hslx 10 60 50
                          :on $ {}
                            :pointertap $ fn (e d!) (on-expr-click e xs coord d!)
                      if
                        and focused? $ not smaller?
                        , shape-focus
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
                          + x-position width leaf-gap
                          , y-stack (inc idx) winding-okay? winding-x
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
                              circle $ {} (:radius dot-radius) (:alpha 1)
                                :position $ [] 0 0
                                :fill $ hslx 200 100 40
                                :on $ {}
                                  :pointertap $ fn (e d!) (on-expr-click e item next-coord d!)
                              if focused? shape-focus
                              container
                                {} $ :position
                                  [] 0 $ * -1 line-height
                                :tree info
                          rest ys
                          + x-position leaf-gap
                          , y-stack (inc idx) false x-position
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
                              circle $ {} (:radius dot-radius) (:alpha 1)
                                :position $ [] 0 0
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
                          inc idx
                          , false winding-x
                    (and (= 1 (count ys)) (and (> y-stack 1) (is-linear? item)))
                      let
                          info $ cond
                              is-linear? item
                              wrap-linear-expr item next-coord focus false
                            (and (with-linear? item) (not (all-block? item)))
                              wrap-expr-with-linear item next-coord focus winding-okay? false
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
                          , winding-okay? winding-x
                    (and (= 1 (count ys)) (&= y-stack 1))
                      let
                          info $ cond
                              is-linear? item
                              wrap-linear-expr item next-coord focus false
                            (and (with-linear? item) (not (all-block? item)))
                              wrap-expr-with-linear item next-coord focus winding-okay? false
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
                              and (with-linear? item)
                                not $ all-block? item
                              wrap-expr-with-linear item next-coord focus winding-okay? true
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
                                circle $ {} (:radius dot-radius) (:alpha 1)
                                  :fill $ hslx 300 100 30
                                  :position $ [] 0 0
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
                          inc idx
                          , winding-okay? winding-x
                    true $ {}
                      :tree $ create-list :container ({})
                        conj acc $ [] idx (comp-error ys)
                      :width x-position
                      :y-stack y-stack
        |wrap-leaf $ quote
          defn wrap-leaf (s coord focus head?)
            let
                width $ * 8.5 (count s)
                height leaf-height
              {}
                :tree $ container
                  {} $ :position ([] -4 0)
                  rect $ {}
                    :position $ [] 0 (* -0.5 height)
                    :size $ [] (+ width 8) height
                    :alpha 0.9
                    :fill $ hslx 190 70 14
                    :line-style $ {} (:width 1) (:alpha 0.18)
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
                            d! :focus coord
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
                        circle $ {} (:radius dot-radius)
                          :position $ [] 0 0
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
          app.config :refer $ leaf-gap leaf-height line-height code-font api-host dot-radius
          phlox.complex :as complex
          pointed-prompt.core :refer $ prompt-at!
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
        |load-files! $ quote
          defn load-files! (d!)
            -> (str api-host "\"/compact-data") (js/fetch)
              .then $ fn (res) (.!text res)
              .then $ fn (text)
                let
                    files $ :files (parse-cirru-edn text)
                  if (some? files) (d! :load-files files) (js/console.log "\"unknown data:" files)
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
        |mount-target $ quote
          def mount-target $ js/document.querySelector "\".app"
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (clear-phlox-caches!) (respo/clear-cache!) (remove-watch *store :change)
              add-watch *store :change $ fn (store prev) (render-app!)
              render-app!
              replace-control-loop! 8 on-control-event
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
          app.config :refer $ api-host
          app.comp.nav :refer $ comp-navbar
          respo.core :refer $ defcomp defeffect <> >> div button textarea span input
          respo.core :as respo
          respo.comp.space :refer $ =<
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
            :files $ {}
            :focus $ []
            :warning nil
            :def-path $ []
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
                  println "\"wrote to" "\".compact-inc.cirru" "\" and " "\"compact.cirru"
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
      :ns $ quote
        ns app.updater $ :require
          phlox.cursor :refer $ update-states
    |app.widget $ {}
      :defs $ {}
        |button $ quote
          def button $ merge ui/button
            {} $ :background :black
      :ns $ quote
        ns app.widget $ :require (respo-ui.core :as ui)
