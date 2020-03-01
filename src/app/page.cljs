
(ns app.page
  (:require [shell-page.core :refer [make-page spit slurp]]
            [app.schema :as schema]
            [cljs.reader :refer [read-string]]
            [app.config :as config]
            [cumulo-util.build :refer [get-ip!]])
  (:require-macros [clojure.core.strint :refer [<<]]))

(def base-info
  {:title (:title config/site), :icon (:icon config/site), :ssr nil, :inline-html nil})

(defn dev-page []
  (make-page
   ""
   (merge
    base-info
    {:styles [(<< "http://~(get-ip!):8100/main-fonts.css")],
     :scripts ["/client.js"],
     :inline-styles [(slurp "./entry/main.css")]})))

(defn prod-page []
  (let [assets (read-string (slurp "dist/assets.edn"))
        cdn (if config/cdn? (:cdn-url config/site) "")
        prefix-cdn (fn [x] (str cdn x))]
    (make-page
     ""
     (merge
      base-info
      {:styles [(:release-ui config/site)],
       :scripts (map #(-> % :output-name prefix-cdn) assets),
       :inline-styles [(slurp "./entry/main.css")]}))))

(defn main! []
  (println "Running mode:" (if config/dev? "dev" "release"))
  (if config/dev?
    (spit "target/index.html" (dev-page))
    (spit "dist/index.html" (prod-page))))
