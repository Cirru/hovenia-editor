
(ns app.container
  (:require [phlox.core :refer [defcomp hslx rect circle text container graphics create-list]]
            [shadow.resource :refer [inline]]
            [cljs.reader :refer [read-string]]
            [app.comp.expr :refer [comp-expr-horizontal]]))

(defcomp
 comp-container
 (store)
 (let [states (:states store), cursor [], code-data (read-string (inline "page-demo.edn"))]
   (container {} (comp-expr-horizontal code-data))))
