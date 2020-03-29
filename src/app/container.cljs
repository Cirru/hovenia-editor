
(ns app.container
  (:require [phlox.core
             :refer
             [defcomp >> hslx rect circle text container graphics create-list g]]
            [shadow.resource :refer [inline]]
            [cljs.reader :refer [read-string]]
            [phlox.comp.drag-point :refer [comp-drag-point]]
            [phlox.comp.slider :refer [comp-slider]]
            [app.math :refer [divide-path multiply-path]]))

(defn collect-nodes-iter! [item collect! get-idx!]
  (if (= :token (:kind item))
    (collect! (assoc item :index (get-idx! true)))
    (do
     (collect! (-> (dissoc item :items) (assoc :index (get-idx! false))))
     (doseq [x (:items item)] (collect-nodes-iter! x collect! get-idx!)))))

(defn collect-nodes [expanded-code]
  (let [*nodes (atom [])
        *counter (atom 0)
        collect! (fn [x] (swap! *nodes conj x))
        get-idx! (fn [inc?] (let [x @*counter] (if inc? (swap! *counter inc)) x))]
    (collect-nodes-iter! expanded-code collect! get-idx!)
    @*nodes))

(defcomp comp-base () (rect {:position [0 0], :size [400 400], :fill (hslx 0 0 10)}))

(defcomp
 comp-pivot
 ()
 (container
  {:position [0 0]}
  (comp-base)
  (container
   {:angle 24}
   (graphics
    {:ops [(g :line-style {:color (hslx 0 0 40), :width 1, :alpha 1}) (g :line-to [200 0])]})
   (text {:text "DEMO", :style {:fill (hslx 0 0 100)}, :position [200 0], :angle 0}))))

(defn expand-tree [level x]
  (if (string? x)
    {:kind :token, :level level, :item x, :size 1}
    (let [children (->> x (map (fn [y] (expand-tree (inc level) y))))]
      {:kind :expr,
       :level level,
       :items children,
       :size (->> children (map :size) (reduce + 0))})))

(defcomp
 comp-container
 (store)
 (let [states (:states store)
       cursor []
       state (or (:data states) {})
       code-data (read-string (inline "expr-demo.edn"))
       expanded-code (expand-tree 0 code-data)
       nodes (collect-nodes expanded-code)]
   (container
    {}
    (comment comp-pivot)
    (container
     {:position [670 440]}
     (comp-base)
     (create-list
      :container
      {}
      (->> nodes
           (map
            (fn [node idx]
              [idx
               (container
                {:position [0 0], :angle (- (* 2.6 (:index node)) 90), :pivot [0 0]}
                (if (= :token (:kind node))
                  (text
                   {:text (:item node),
                    :position [(* 40 (:level node)) 0],
                    :style {:fill (hslx 0 0 100), :font-size 14}})
                  (rect
                   {:position [(* 40 (:level node)) 0], :size [40 1], :fill (hslx 0 0 90)})))]))))))))
