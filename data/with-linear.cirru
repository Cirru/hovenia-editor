
defn wrap-expr-with-linear (xs)
  loop
      acc $ []
      ys xs
      x-position 8
      y-position 0
      stacked 0
      idx 0
    if (empty? ys)
      {}
        :tree $ container ({})
          polyline $ {}
            :style $ {} (:width 1)
              :color $ hslx 200 100 30
              :alpha 1
            :position $ [] 20 0
            :points $ [] ([] 0 20)
              [] x-position 20
          circle $ {}
            :position $ [] 0 20
            :radius 5
            :fill $ hslx 20 90 50
          create-list :container ({}) acc
        :width x-position
        :height $ * line-height (inc stacked)
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
                  container ({})
                    polyline $ {}
                      :style $ {} (:width 1)
                        :color $ hslx 200 100 30
                        :alpha 0.8
                      :position $ [] (+ 4 x-position) 20
                      :points $ [] ([] 0 0)
                        [] 0 $ * (inc stacked)
                          + 0 line-height
                    circle $ {}
                      :position $ [] (+ 4 x-position) 20
                      :radius 4
                      :fill 0xffff99
                    container
                      {} $ :position
                        [] x-position $ * (inc stacked)
                          + 0 line-height
                      , tree
                rest ys
                + x-position 40
                , y-position (inc stacked)
                  inc idx
          (= 1 (count ys))
            let
                info $ cond
                    string? item
                    wrap-leaf item
                  (is-linear? item)
                    wrap-linear-expr item
                  (with-linear? item)
                    wrap-expr-with-linear item
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
                + y-position height 2
                inc stacked
                inc idx
          true $ {}
            :tree $ conj acc
              [] idx $ comp-error ys
            :width x-position
            :height $ * line-height (inc stacked)
