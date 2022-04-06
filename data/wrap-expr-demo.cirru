
defn wrap-simple-expr (xs)
  apply-args
      []
      , xs 20 0 0
    fn (acc ys x-position h idx)
      if (empty? ys)
        {}
          :tree $ container ({})
            circle $ {}
              :position $ [] 4 12
              :radius 5
              :fill $ hslx 260 80 60
            create-list :container ({}) acc
          :width x-position
          :height $ &max h 28
        let
            item $ first ys
            info $ cond
                string? item
                wrap-leaf item
              (every? item string?)
                wrap-simple-expr item
              (and (> (count item) 1) (every? (butlast item) string?))
                wrap-simple-expr item
              true $ wrap-expr item
            width $ :width info
            height $ :height info
            tree $ :tree info
          recur
            conj acc $ [] idx
              container
                {} $ :position ([] x-position 0)
                , tree
            rest ys
            + x-position width 2
            &max h height
            inc idx
