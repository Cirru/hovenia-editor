
(ns app.container
  (:require [phlox.core :refer [defcomp hslx rect circle text container graphics create-list]]))

(defcomp
 comp-container
 (store)
 (let [states (:states store), cursor []]
   (container
    {}
    (text {:text "DEMO", :style {:fill (hslx 240 80 80), :font-family "Josefin Sans"}}))))
