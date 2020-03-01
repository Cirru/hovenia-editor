
(ns app.comp.expr
  (:require [phlox.core :refer [defcomp hslx rect circle text container graphics create-list]]))

(declare comp-expr-vertical)

(declare comp-expr-horizontal)

(defcomp
 comp-expr-empty
 ()
 (circle
  {:radius 4, :line-style {:color (hslx 0 0 50), :width 2, :alpha 1}, :position [0 10]}))

(defcomp
 comp-skip-node
 ()
 (rect {:line-style {:color (hslx 0 0 100), :alpha 1, :width 2}, :size [20 20]}))

(defcomp
 comp-expr-vertical
 (expr)
 (create-list
  :container
  {}
  (->> expr
       (map-indexed
        (fn [idx child]
          [idx
           (cond
             (string? child)
               (text
                {:text child,
                 :position [0 (* idx 40)],
                 :style {:fill (hslx 0 0 100),
                         :font-size 14,
                         :font-family "Source Code Pro, monospace"}})
             (empty? child) (container {:position [0 (* idx 40)]} (comp-expr-empty))
             (vector? (first child))
               (container
                {:position [0 (* idx 40)]}
                (comp-skip-node)
                (container {:position [100 0]} (comp-expr-vertical child)))
             :else (container {:position [0 (* idx 40)]} (comp-expr-horizontal child)))])))))

(defcomp
 comp-expr-horizontal
 (expr)
 (create-list
  :container
  {}
  (->> expr
       (map-indexed
        (fn [idx child]
          [idx
           (cond
             (string? child)
               (text
                {:text child,
                 :position [(* idx 100) 0],
                 :style {:fill (hslx 0 0 100),
                         :font-size 14,
                         :font-family "Source Code Pro, monospace"}})
             (empty? child) (container {:position [(* idx 100) 0]} (comp-expr-empty))
             (vector? (first child))
               (container
                {:position [(* idx 100) 0]}
                (comp-skip-node)
                (container {:position [0 40]} (comp-expr-vertical child)))
             :else (container {:position [(* idx 100) 0]} (comp-expr-vertical child)))])))))
