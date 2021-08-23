
defcomp comp-expr (expr parent base va vb)
  let
      ratio $ divide-path ([] 1 0) base
      branch-a $ multiply-path parent (multiply-path ratio va)
      branch-b $ multiply-path parent (multiply-path ratio vb)
      e0 $ first expr
    container ({})
      if (some? e0)
        graphics $ {}
          :position $ [] 0 0
          :ops $ []
            g :move-to $ [] 0 0
            g :line-style $ {}
              :color $ hslx 0 0 100
              :width 1
              :alpha 0.3
            g :line-to branch-a
        container $ {}
      if-not (empty? expr)
        container
          {} $ :position branch-a
          comp-expr (rest expr) branch-a base va vb
        container $ {}
      container
        {} $ :position branch-a
        cond
            string? e0
            text $ {} (:text e0)
              :position $ [] 0 0
              :style $ {}
                :fill $ hslx 0 0 100
                :font-size 14
                :font-family "\"Source Code Pro, monospace"
          (vector? e0)
            container ({})
              comp-expr-empty
              if-not (empty? e0)
                container ({})
                  container
                    {} $ :position ([] 0 0)
                    comp-expr e0 branch-b base va vb
                container $ {}
          :else $ container ({})
