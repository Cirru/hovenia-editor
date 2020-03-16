
(ns app.container
  (:require [phlox.core :refer [defcomp hslx rect circle text container graphics create-list]]
            [shadow.resource :refer [inline]]
            [cljs.reader :refer [read-string]]
            [app.comp.expr :refer [comp-expr]]
            [phlox.comp.drag-point :refer [comp-drag-point]]
            [phlox.comp.slider :refer [comp-slider]]
            [app.math :refer [divide-path multiply-path]]))

(defcomp
 comp-container
 (store)
 (let [states (:states store)
       cursor []
       code-data (read-string (inline "expr-demo.edn"))
       state (or (:data states)
                 {:ratio 0.9, :base [200 0], :branch-a [190 10], :branch-b [160 -30]})]
   (container
    {}
    (container
     {:position [20 400]}
     (comp-expr code-data (:base state) (:base state) (:branch-a state) (:branch-b state)))
    (container
     {}
     (comp-slider
      (conj cursor :ratio)
      (:ratio states)
      {:position [30 30],
       :value (:ratio state),
       :title "ratio",
       :on-change (fn [value d!] (d! cursor (assoc state :ratio value)))}))
    (container
     {:position [20 400]}
     (comp-drag-point
      (conj cursor :base)
      (:base states)
      {:position (:base state),
       :unit 1,
       :on-change (fn [position d!] (d! cursor (assoc state :base position)))})
     (comp-drag-point
      (conj cursor :branch-a)
      (:branch-a states)
      {:position (:branch-a state),
       :unit 1,
       :on-change (fn [position d!] (d! cursor (assoc state :branch-a position)))})
     (comp-drag-point
      (conj cursor :branch-b)
      (:branch-b states)
      {:position (:branch-b state),
       :unit 1,
       :on-change (fn [position d!] (d! cursor (assoc state :branch-b position)))})))))
