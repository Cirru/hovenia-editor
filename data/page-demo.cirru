
defn prod-page () $ let
    assets $ read-string (slurp "\"dist/assets.edn")
    cdn $ if config/cdn? (:cdn-url config/site) "\""
    prefix-cdn $ fn (x)
      str cdn x
  make-page "\"" $ merge base-info
    {}
      :styles $ [] (:release-ui config/site)
      :scripts $ map ("#()" -> % :output-name prefix-cdn) assets
      :inline-styles $ [] (slurp "\"./entry/main.css")
