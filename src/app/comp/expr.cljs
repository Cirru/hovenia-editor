
(ns app.comp.expr
  (:require [phlox.core
             :refer
             [defcomp hslx rect circle text container graphics create-list g]]
            [app.math :refer [add-path subtract-path multiply-path divide-path]]))

(defcomp
 comp-skip-node
 ()
 (rect {:line-style {:color (hslx 0 0 100), :alpha 1, :width 2}, :size [20 20]}))
