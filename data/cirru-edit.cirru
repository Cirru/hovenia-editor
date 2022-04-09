
defn cirru-edit (tree focus op-data)
  ; println "\"TODO" tree focus op-data
  let
      key $ :key op-data
      code $ :key-code op-data
      meta? $ or (:meta? op-data)
        :ctrl? op-data
      shift? $ :shift? op-data
    cond
        = "\"Backspace" key
        if (empty? focus)
          [] tree focus "\"cannot delete root"
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
        if (empty? focus)
          [] tree focus "\"already at top"
          [] tree (butlast focus) nil
      (= key "\"ArrowLeft")
        if (empty? focus)
          [] tree focus "\"already at root"
          if
            > (last focus) 0
            [] tree
              conj (butlast focus)
                dec $ last focus
              , nil
            [] tree focus "\"already at first elelement"
      (= key "\"ArrowRight")
        if (empty? focus)
          [] tree focus "\"already at root"
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
          if (string? target)
            [] tree focus "\"already reached leaf"
            if (empty? target)
              [] tree focus "\"it's empty"
              [] tree (conj focus 0) nil
      (= key "\"Enter")
        if (empty? focus)
          if (empty? tree)
            [] ([] "\"")
              [] 0
              , nil
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
            [] ([] "\"")
              [] 0
              , nil
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
          if (empty? focus)
            [] tree focus "\"not working for root"
            let
                target $ get-in tree focus
              if (string? target)
                let
                    parent $ get-in tree (butlast focus)
                  if
                    = 1 $ count parent
                    []
                      assoc-in tree (butlast focus)
                        get-in tree focus
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
            update-in tree focus $ fn (xs)
              [] xs
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
      true $ do (js/console.log op-data)
        [] tree focus
