
defn wrap-expr-with-linear (xs)
  loop
      acc $ []
      ys xs
      x-position 20
      y-position 0
      stacked 0
      idx 0
    if (empty? ys)
      {}
        :tree $ container ({})
          polyline $ {}
            :style $ {} (:width 1)
              :alpha 1
              :color $ hslx 200 100 30
            :position $ [] 0 0
            :points $ [] ([] 0 0)
              [] x-position 0
          circle $ {} (:radius 5)
            :position $ [] 0 0
            :fill $ hslx 20 90 50
          create-list :container ({}) acc
        :width x-position
        :height $ &max y-position
          * line-height $ inc stacked
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
                  container
                    {} $ :position
                      [] (+ 4 x-position) 0
                    polyline $ {}
                      :style $ {} (:width 1)
                        :alpha 0.8
                        :color $ hslx 200 100 30
                      :position $ [] 0 0
                      :points $ [] ([] 0 0)
                        [] 0 $ * (inc stacked)
                          + 12 line-height
                    circle $ {} (:radius 3)
                      :alpha 1
                      :fill $ hslx 200 100 30
                      :position $ [] 0 0
                    container
                      {} $ :position
                        [] 0 $ * (inc stacked)
                          + 12 line-height
                      , tree
                rest ys
                + x-position 40
                &max y-position $ + height
                  * (inc stacked)
                    + 12 line-height
                inc stacked
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
                &max (+ y-position height) height
                inc stacked
                inc idx
          true $ {}
            :tree $ create-list :container ({})
              conj acc $ [] idx (comp-error ys)
            :width x-position
            :height $ * line-height (inc stacked)
