
(ns app.main
  (:require ["pixi.js" :as PIXI]
            ["shortid" :as shortid]
            [phlox.core :refer [render!]]
            [app.container :refer [comp-container]]
            [app.schema :as schema]
            [app.config :refer [dev?]]
            [app.updater :refer [updater]]))

(defonce *store (atom schema/store))

(defn dispatch! [op op-data]
  (if (vector? op)
    (recur :states [op op-data])
    (do
     (when (and dev? (not= op :states)) (println "dispatch!" op op-data))
     (let [op-id (shortid/generate), op-time (.now js/Date)]
       (reset! *store (updater @*store op op-data op-id op-time))))))

(defn main! []
  (comment js/console.log PIXI)
  (render! (comp-container @*store) dispatch! {})
  (add-watch *store :change (fn [] (render! (comp-container @*store) dispatch! {})))
  (println "App Started"))

(defn reload! []
  (println "Code updated")
  (render! (comp-container @*store) dispatch! {:swap? true}))
