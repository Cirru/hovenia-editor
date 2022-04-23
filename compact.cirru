
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!) (:version nil)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/ |pointed-prompt/ |alerts.calcit/ |respo-cirru-editor/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:reload-fn |app.server/reload!)
      :modules $ [] |calcit-http/
  :files $ {}
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
                handler $ fn (event)
                  if
                    and
                      or
                        = "\"p" $ .-key event
                        = "\"s" $ .-key event
                      or (.-ctrlKey event) (.-metaKey event)
                    .!preventDefault event
                  .!dispatchEvent el $ new js/KeyboardEvent (.-type event) event
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
                    merge ui/column $ {} (:position :absolute) (:top 0) (:left 0) (:width 480) (:height "\"88vh") ("\"×" 100) (:backdrop-filter "\"blur(1.5px)") (:border-radius "\"6px") (:padding 8) (:border-width "\"0 1px 1px 0")
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
                                , 0 $ inc idx
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
                            if (list? code) (run-command code store d!)
                              d! :warn $ str "\"invalid command:" code
                if (:menu? state)
                  comp-menu (>> states :menu) (:files store) (:def-path store)
                    fn (d!)
                      d! cursor $ assoc state :menu? false
                div
                  {} $ :style style-error
                  <> $ or (:warning store) "\""
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
                .!then $ fn (res) (d! :ok)
                .!catch $ fn (e)
                  d! :warn $ str e
        |run-command $ quote
          defn run-command (code store d!)
            case-default (first code)
              d! :warn $ str "\"invalid command: " code
              "\"add-ns" $ d! :add-ns (nth code 1)
              "\"rm-ns" $ d! :rm-ns (nth code 1)
              "\"add-def" $ d! :add-def
                [] (nth code 1) (nth code 2)
              "\"rm-def" $ d! :rm-def
                [] (nth code 1) (nth code 2)
              "\"mv-ns" $ d! :mv-ns
                [] (nth code 1) (nth code 2)
              "\"mv-def" $ d! :mv-def
                [] (nth code 1) (nth code 2)
              "\"load" $ load-files! d!
              "\"save" $ on-save (:files store) (:saved-files store) d!
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
                        let
                            target $ -> files
                              get-in $ :def-path store
                              get 1
                              get-in focus
                          cond
                              list? target
                              handle-expr-event focus (dissoc e :event) d!
                            (string? target)
                              handle-leaf-event focus target (dissoc e :event) d!
                            (nil? nil) nil
                            true $ js/console.error "\"unknown target" target
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
                      wrap-expr-with-linear item ([]) focus true false 0
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
          defn handle-leaf-event (focus token e d!)
            let
                key $ :key e
                code $ :key-code e
                meta? $ or (:meta? e) (:ctrl? e)
                shift? $ :shift? e
              cond
                  = "\"Backspace" key
                  if (empty? token)
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
                d! :focus coord
        |pattern-number $ quote
          def pattern-number $ new js/RegExp "\"^-?\\d+(\\.\\d+)?$"
        |pick-leaf-color $ quote
          defn pick-leaf-color (s head?)
            cond
                or (= s "\"true") (= s "\"false") (= s "\"nil") (= s "\";") (= s "\"&")
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
                width $ * 8.5 (count s)
                height leaf-height
              {}
                :tree $ container
                  {} $ :position ([] -4 0)
                  rect $ {}
                    :position $ [] 0 (* -0.5 height)
                    :size $ [] (+ width 8) height
                    :alpha 0.88
                    :fill $ hslx 190 70 14
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
    |app.fetch $ {}
      :defs $ {}
        |load-files! $ quote
          defn load-files! (d!)
            -> (str api-host "\"/compact-data") (js/fetch)
              .!then $ fn (res) (.!text res)
              .!then $ fn (text)
                let
                    files $ :files (parse-cirru-edn text)
                  if (some? files)
                    do (d! :load-files files) (d! :ok nil)
                    do (js/console.log "\"unknown data:" files) (d! :warn "\"unknown data")
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
            :files $ {}
            :focus $ []
            :clipboard $ []
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
              :load-files $ -> store (assoc  :files op-data) (assoc  :saved-files op-data)
              :call-cirru-edit $ let
                  def-path $ prepend (:def-path store) :files
                  def-target $ -> store (get-in def-path)
                if (tuple? def-target)
                  let
                      result $ cirru-edit
                        {}
                          :tree $ nth def-target 1
                          :clipboard $ :clipboard store
                        nth op-data 0
                        nth op-data 1
                    ; js/console.log op-data result
                    if-let
                      warning $ :warning result
                      js/console.warn warning
                    -> store
                      assoc-in def-path $ :: 'quote (:tree result)
                      assoc :focus
                        or (:focus result) (:focus store)
                        , :warning (:warning result) :clipboard $ :clipboard result
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
              :states $ update-states store op-data
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
