
{}
  :configs $ {} (:init-fn |app.main/main!) (:port 6001) (:reload-fn |app.main/reload!) (:storage-key |calcit.cirru)
    :modules $ [] |memof/ |lilac/ |respo.calcit/ |respo-ui.calcit/ |phlox/ |touch-control/ |pointed-prompt/ |alerts.calcit/
  :entries $ {}
    :server $ {} (:init-fn |app.server/main!) (:reload-fn |app.server/reload!)
      :modules $ [] |calcit-http/
  :ir $ {} (:package |app)
    :files $ {}
      |app.comp.nav $ {}
        :configs $ {}
        :defs $ {}
          |comp-files-entry $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650192395636) (:by |rJG4IHzWf) (:text |defcomp) (:type :leaf)
              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |comp-files-entry) (:type :leaf)
              |e $ {} (:at 1650192396843) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1650192410571) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                  |L $ {} (:at 1650192411798) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                  |T $ {} (:at 1650192406835) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                  |b $ {} (:at 1650194551096) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ui/expand) (:type :leaf)
                              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ui/row) (:type :leaf)
                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |list->) (:type :leaf)
                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ui/expand) (:type :leaf)
                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |.to-list) (:type :leaf)
                          |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |sort) (:type :leaf)
                          |o $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:class-name) (:type :leaf)
                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text "|\"hover-entry") (:type :leaf)
                                              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ui/font-code) (:type :leaf)
                                                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:pointer) (:type :leaf)
                                                          |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:line-height) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                          |o $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:padding) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text "|\"0 8px") (:type :leaf)
                                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:background-color) (:type :leaf)
                                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |hsl) (:type :leaf)
                                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                                                      |o $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |0.3) (:type :leaf)
                                              |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                                              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                              |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |<>) (:type :leaf)
                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                  |j $ {} (:at 1650214008960) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650214010192) (:by |rJG4IHzWf) (:text |=<) (:type :leaf)
                      |b $ {} (:at 1650214017134) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                      |h $ {} (:at 1650214012548) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |if-let) (:type :leaf)
                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |if-let) (:type :leaf)
                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ui/expand) (:type :leaf)
                              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:pointer) (:type :leaf)
                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |<>) (:type :leaf)
                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ui/font-code) (:type :leaf)
                              |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |=<) (:type :leaf)
                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                              |o $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |list->) (:type :leaf)
                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                      |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                      |o $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                      |q $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |.to-list) (:type :leaf)
                                      |s $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |sort) (:type :leaf)
                                      |t $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                              |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:class-name) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text "|\"hover-entry") (:type :leaf)
                                                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ui/font-code) (:type :leaf)
                                                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:pointer) (:type :leaf)
                                                                      |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:line-height) (:type :leaf)
                                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                      |o $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:padding) (:type :leaf)
                                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text "|\"0 8px") (:type :leaf)
                                                          |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                                              |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                  |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                  |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                      |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                                          |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                                                          |l $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                  |l $ {} (:at 1650194564239) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650194564239) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
                                                                      |b $ {} (:at 1650194564239) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                      |h $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |<>) (:type :leaf)
                                                          |b $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
          |comp-menu $ {} (:at 1650137006777) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650137008308) (:by |rJG4IHzWf) (:text |defcomp) (:type :leaf)
              |b $ {} (:at 1650137006777) (:by |rJG4IHzWf) (:text |comp-menu) (:type :leaf)
              |h $ {} (:at 1650137006777) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |5 $ {} (:at 1650161648714) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                  |D $ {} (:at 1650161307993) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                  |L $ {} (:at 1650161413196) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                  |T $ {} (:at 1650137150095) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
              |l $ {} (:at 1650161649689) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1650161650296) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1650161650528) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650161650629) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650161652681) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                          |b $ {} (:at 1650161652889) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650161654215) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                              |b $ {} (:at 1650161655024) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                      |b $ {} (:at 1650161655745) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650161656621) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                          |b $ {} (:at 1650161657345) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650161658524) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |b $ {} (:at 1650161658774) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650161659505) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                                  |b $ {} (:at 1650161661453) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                              |h $ {} (:at 1650161661928) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650161662263) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1650161663580) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650161666081) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                      |b $ {} (:at 1650161669735) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |h $ {} (:at 1650192001195) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192002569) (:by |rJG4IHzWf) (:text |:query) (:type :leaf)
                                      |X $ {} (:at 1650192004235) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                      |b $ {} (:at 1650192003297) (:by |rJG4IHzWf) (:text |) (:type :leaf)
                  |T $ {} (:at 1650194392561) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1650194393965) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                      |L $ {} (:at 1650194397750) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650194397487) (:by |rJG4IHzWf) (:text |effect-focus) (:type :leaf)
                          |b $ {} (:at 1650194402269) (:by |rJG4IHzWf) (:text "|\"#query-box") (:type :leaf)
                      |T $ {} (:at 1650137009282) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650137010458) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                          |b $ {} (:at 1650137010712) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650137011032) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1650137011335) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650137013909) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                  |b $ {} (:at 1650162099579) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1650162100386) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                      |L $ {} (:at 1650162103324) (:by |rJG4IHzWf) (:text |ui/column) (:type :leaf)
                                      |T $ {} (:at 1650137014327) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650137014710) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |b $ {} (:at 1650137026908) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650137028899) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                              |b $ {} (:at 1650137032674) (:by |rJG4IHzWf) (:text |:absolute) (:type :leaf)
                                          |h $ {} (:at 1650137033254) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650137035413) (:by |rJG4IHzWf) (:text |:top) (:type :leaf)
                                              |b $ {} (:at 1650137035717) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |l $ {} (:at 1650137036268) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650137037549) (:by |rJG4IHzWf) (:text |:left) (:type :leaf)
                                              |b $ {} (:at 1650137037850) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |o $ {} (:at 1650137038367) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650137040164) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                              |b $ {} (:at 1650213989050) (:by |rJG4IHzWf) (:text |480) (:type :leaf)
                                          |p $ {} (:at 1650137065417) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650137066544) (:by |rJG4IHzWf) (:text |:height) (:type :leaf)
                                              |b $ {} (:at 1650194266953) (:by |rJG4IHzWf) (:text "|\"88vh") (:type :leaf)
                                          |pT $ {} (:at 1650157211641) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650157213769) (:by |rJG4IHzWf) (:text |:z-index) (:type :leaf)
                                              |b $ {} (:at 1650157214443) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                          |s $ {} (:at 1650162272256) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162272977) (:by |rJG4IHzWf) (:text |:backdrop-filter) (:type :leaf)
                                              |b $ {} (:at 1650214076214) (:by |rJG4IHzWf) (:text "|\"blur(1.5px)") (:type :leaf)
                                          |sT $ {} (:at 1650162335198) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162339132) (:by |rJG4IHzWf) (:text |:border-radius) (:type :leaf)
                                              |b $ {} (:at 1650162343849) (:by |rJG4IHzWf) (:text "|\"6px") (:type :leaf)
                                          |sj $ {} (:at 1650162354973) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162356701) (:by |rJG4IHzWf) (:text |:padding) (:type :leaf)
                                              |b $ {} (:at 1650162357731) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                                          |sr $ {} (:at 1650214100237) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650214100237) (:by |rJG4IHzWf) (:text |:border-width) (:type :leaf)
                                              |b $ {} (:at 1650214104860) (:by |rJG4IHzWf) (:text "|\"0 1px 1px 0") (:type :leaf)
                                          |t $ {} (:at 1650162305791) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162308065) (:by |rJG4IHzWf) (:text |:border) (:type :leaf)
                                              |b $ {} (:at 1650162313300) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1650162314606) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                  |T $ {} (:at 1650162312349) (:by |rJG4IHzWf) (:text "|\"1px solid ") (:type :leaf)
                                                  |b $ {} (:at 1650162315388) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650162315935) (:by |rJG4IHzWf) (:text |hsl) (:type :leaf)
                                                      |b $ {} (:at 1650162316518) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1650162316837) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |l $ {} (:at 1650162606030) (:by |rJG4IHzWf) (:text |30) (:type :leaf)
                                          |u $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:text |:background-color) (:type :leaf)
                                              |b $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:text |hsl) (:type :leaf)
                                                  |b $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                  |h $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                  |l $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:text |20) (:type :leaf)
                                                  |o $ {} (:at 1650162353381) (:by |rJG4IHzWf) (:text |0.4) (:type :leaf)
                          |h $ {} (:at 1650137101902) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1650137102563) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                              |L $ {} (:at 1650137102771) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650137103107) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1650137104414) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650137105118) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                      |b $ {} (:at 1650137107254) (:by |rJG4IHzWf) (:text |ui/row-parted) (:type :leaf)
                              |X $ {} (:at 1650191937954) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650191938886) (:by |rJG4IHzWf) (:text |input) (:type :leaf)
                                  |b $ {} (:at 1650191939144) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650191939455) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |X $ {} (:at 1650194381876) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650194383215) (:by |rJG4IHzWf) (:text |:id) (:type :leaf)
                                          |b $ {} (:at 1650194389313) (:by |rJG4IHzWf) (:text "|\"query-box") (:type :leaf)
                                      |b $ {} (:at 1650191939697) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650191941734) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                          |b $ {} (:at 1650191949354) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1650191950301) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                              |T $ {} (:at 1650191944702) (:by |rJG4IHzWf) (:text |ui/input) (:type :leaf)
                                              |b $ {} (:at 1650191950776) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650191951424) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                  |b $ {} (:at 1650191951782) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650191955663) (:by |rJG4IHzWf) (:text |:background-color) (:type :leaf)
                                                      |b $ {} (:at 1650191958781) (:by |rJG4IHzWf) (:text |:transparent) (:type :leaf)
                                                  |h $ {} (:at 1650191968924) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650191969784) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                                      |b $ {} (:at 1650191970358) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650191972602) (:by |rJG4IHzWf) (:text |hsl) (:type :leaf)
                                                          |b $ {} (:at 1650191972859) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |h $ {} (:at 1650191973135) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |l $ {} (:at 1650191975071) (:by |rJG4IHzWf) (:text |70) (:type :leaf)
                                      |h $ {} (:at 1650191996479) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650191999530) (:by |rJG4IHzWf) (:text |:value) (:type :leaf)
                                          |b $ {} (:at 1650192005870) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192008297) (:by |rJG4IHzWf) (:text |:query) (:type :leaf)
                                              |b $ {} (:at 1650192009648) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                      |l $ {} (:at 1650192011343) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650192013130) (:by |rJG4IHzWf) (:text |:on-input) (:type :leaf)
                                          |b $ {} (:at 1650192013510) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650192013763) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1650192013999) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192014135) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                  |b $ {} (:at 1650192014657) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                              |h $ {} (:at 1650192016312) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650192017646) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                  |b $ {} (:at 1650192018692) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                                  |h $ {} (:at 1650192019212) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650192020448) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                                      |X $ {} (:at 1650192022886) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                                      |b $ {} (:at 1650192021869) (:by |rJG4IHzWf) (:text |:query) (:type :leaf)
                                                      |h $ {} (:at 1650192039107) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192041033) (:by |rJG4IHzWf) (:text |:value) (:type :leaf)
                                                          |b $ {} (:at 1650192041527) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                      |o $ {} (:at 1650193507821) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650194366572) (:by |rJG4IHzWf) (:text |:autofocus) (:type :leaf)
                                          |b $ {} (:at 1650193510703) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                              |b $ {} (:at 1650137109694) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650137114061) (:by |rJG4IHzWf) (:text |a) (:type :leaf)
                                  |b $ {} (:at 1650137114613) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650137114939) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1650137115212) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650137117532) (:by |rJG4IHzWf) (:text |:inner-text) (:type :leaf)
                                          |b $ {} (:at 1650137121854) (:by |rJG4IHzWf) (:text "|\"close") (:type :leaf)
                                      |h $ {} (:at 1650137129762) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650137130699) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                          |b $ {} (:at 1650137132132) (:by |rJG4IHzWf) (:text |ui/link) (:type :leaf)
                                      |l $ {} (:at 1650137135619) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650137139812) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                          |b $ {} (:at 1650137140120) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650137140412) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1650137140794) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650137140994) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                  |b $ {} (:at 1650137141497) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                              |h $ {} (:at 1650137141932) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650137145025) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
                                                  |b $ {} (:at 1650137146485) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |j $ {} (:at 1650194521436) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650194521944) (:by |rJG4IHzWf) (:text |=<) (:type :leaf)
                              |b $ {} (:at 1650194525671) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                              |h $ {} (:at 1650194526049) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                          |l $ {} (:at 1650192444004) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1650192444901) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |L $ {} (:at 1650192446938) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192491333) (:by |rJG4IHzWf) (:text |blank?) (:type :leaf)
                                  |b $ {} (:at 1650192448595) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650192484068) (:by |rJG4IHzWf) (:text |:query) (:type :leaf)
                                      |b $ {} (:at 1650192451550) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                              |T $ {} (:at 1650192398092) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192393596) (:by |rJG4IHzWf) (:text |comp-files-entry) (:type :leaf)
                                  |X $ {} (:at 1650192414788) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                  |Z $ {} (:at 1650192415519) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                  |b $ {} (:at 1650192401205) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |h $ {} (:at 1650194548379) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
                              |b $ {} (:at 1650192496162) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650192496162) (:by |rJG4IHzWf) (:text |comp-search-entry) (:type :leaf)
                                  |b $ {} (:at 1650192496162) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                  |h $ {} (:at 1650192496162) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                  |l $ {} (:at 1650192496162) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |o $ {} (:at 1650193465388) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
          |comp-navbar $ {} (:at 1650134759776) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650134764199) (:by |rJG4IHzWf) (:text |defcomp) (:type :leaf)
              |b $ {} (:at 1650134866490) (:by |rJG4IHzWf) (:text |comp-navbar) (:type :leaf)
              |h $ {} (:at 1650134759776) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650135159162) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                  |b $ {} (:at 1650136789355) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
              |l $ {} (:at 1650135289331) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1650135290050) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1650135290311) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |b $ {} (:at 1650135357917) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650135358963) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                          |b $ {} (:at 1650135359479) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650136800947) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                              |b $ {} (:at 1650136802228) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                      |h $ {} (:at 1650136662731) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650136663600) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                          |b $ {} (:at 1650136663962) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650136672009) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |b $ {} (:at 1650136677317) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650136678375) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                                  |b $ {} (:at 1650136679378) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                              |h $ {} (:at 1650136681014) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650136681334) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1650136804225) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650136992213) (:by |rJG4IHzWf) (:text |:menu?) (:type :leaf)
                                      |b $ {} (:at 1650136809169) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                      |l $ {} (:at 1650160894757) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650160899892) (:by |rJG4IHzWf) (:text |command-plugin) (:type :leaf)
                          |b $ {} (:at 1650160900419) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650160905516) (:by |rJG4IHzWf) (:text |use-prompt) (:type :leaf)
                              |X $ {} (:at 1650161004674) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650161005105) (:by |rJG4IHzWf) (:text |>>) (:type :leaf)
                                  |b $ {} (:at 1650161006106) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                                  |h $ {} (:at 1650161007341) (:by |rJG4IHzWf) (:text |:command) (:type :leaf)
                              |b $ {} (:at 1650160911831) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650160912146) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1650160912500) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650160913562) (:by |rJG4IHzWf) (:text |:text) (:type :leaf)
                                      |b $ {} (:at 1650160915416) (:by |rJG4IHzWf) (:text "|\"command") (:type :leaf)
                                  |h $ {} (:at 1650161072864) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650161075712) (:by |rJG4IHzWf) (:text |:input-style) (:type :leaf)
                                      |b $ {} (:at 1650161075992) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650161076356) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |b $ {} (:at 1650161077000) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650161079926) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                              |b $ {} (:at 1650161081968) (:by |rJG4IHzWf) (:text |ui/font-code) (:type :leaf)
                  |T $ {} (:at 1650136854734) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1650136855477) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                      |L $ {} (:at 1650136856600) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650136855951) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |T $ {} (:at 1650135147167) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650135147579) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                          |b $ {} (:at 1650135148102) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650135148468) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1650135468808) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650135470143) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                  |b $ {} (:at 1650135482749) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1650135483715) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                      |T $ {} (:at 1650135476025) (:by |rJG4IHzWf) (:text |ui/row-parted) (:type :leaf)
                                      |b $ {} (:at 1650136908012) (:by |rJG4IHzWf) (:text |style-navbar) (:type :leaf)
                          |h $ {} (:at 1650136952031) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1650136952774) (:by |rJG4IHzWf) (:text |span) (:type :leaf)
                              |L $ {} (:at 1650136953144) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650136953450) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |X $ {} (:at 1650162446662) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650162450239) (:by |rJG4IHzWf) (:text |:class-name) (:type :leaf)
                                      |b $ {} (:at 1650162457977) (:by |rJG4IHzWf) (:text "|\"hover-entry") (:type :leaf)
                                  |Z $ {} (:at 1650162468913) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650162470755) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                      |b $ {} (:at 1650162471026) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650162471380) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |b $ {} (:at 1650162471645) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162474766) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                                              |b $ {} (:at 1650162475818) (:by |rJG4IHzWf) (:text |:pointer) (:type :leaf)
                                          |h $ {} (:at 1650162476472) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162478428) (:by |rJG4IHzWf) (:text |:padding) (:type :leaf)
                                              |b $ {} (:at 1650162484617) (:by |rJG4IHzWf) (:text "|\"4px 8px") (:type :leaf)
                                  |b $ {} (:at 1650136956666) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650136960766) (:by |rJG4IHzWf) (:text |:inner-text) (:type :leaf)
                                      |b $ {} (:at 1650178227125) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1650178230444) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |L $ {} (:at 1650178230740) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650178263378) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                              |b $ {} (:at 1650178232889) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650178232889) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                                  |b $ {} (:at 1650178232889) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                          |P $ {} (:at 1650214137652) (:by |rJG4IHzWf) (:text "|\"...") (:type :leaf)
                                          |T $ {} (:at 1650162391701) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162393063) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                              |b $ {} (:at 1650178225723) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650162404631) (:by |rJG4IHzWf) (:text |.join-str) (:type :leaf)
                                                  |b $ {} (:at 1650162393467) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650162395919) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                                      |b $ {} (:at 1650162396664) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                                  |h $ {} (:at 1650162405639) (:by |rJG4IHzWf) (:text "|\" ") (:type :leaf)
                                  |h $ {} (:at 1650136966051) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650136968212) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                      |b $ {} (:at 1650136968527) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650136968783) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                          |b $ {} (:at 1650136969068) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650136970283) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                              |b $ {} (:at 1650136971748) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                          |h $ {} (:at 1650136972968) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650136973427) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                              |b $ {} (:at 1650136975146) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                              |h $ {} (:at 1650136975438) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650136977352) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                                  |b $ {} (:at 1650136978034) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                                  |h $ {} (:at 1650136985653) (:by |rJG4IHzWf) (:text |:menu?) (:type :leaf)
                                                  |l $ {} (:at 1650136989078) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                          |l $ {} (:at 1650194341854) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650194346970) (:by |rJG4IHzWf) (:text |.!preventDefault) (:type :leaf)
                                              |b $ {} (:at 1650194348472) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1650194350722) (:by |rJG4IHzWf) (:text |:event) (:type :leaf)
                                                  |T $ {} (:at 1650194348246) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                          |l $ {} (:at 1650135607887) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1650135608551) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                              |L $ {} (:at 1650135608890) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650135609188) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |V $ {} (:at 1650135636612) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650162547932) (:by |rJG4IHzWf) (:text |a) (:type :leaf)
                                  |b $ {} (:at 1650135637812) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650135638171) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |X $ {} (:at 1650135641474) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650135643993) (:by |rJG4IHzWf) (:text |:inner-text) (:type :leaf)
                                          |b $ {} (:at 1650135646658) (:by |rJG4IHzWf) (:text "|\"Save") (:type :leaf)
                                      |b $ {} (:at 1650135638507) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650135639292) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                          |b $ {} (:at 1650162553374) (:by |rJG4IHzWf) (:text |ui/link) (:type :leaf)
                                      |h $ {} (:at 1650160653038) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650160654411) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                          |b $ {} (:at 1650160654695) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650160655050) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1650160655323) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650160655559) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                  |b $ {} (:at 1650160656328) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                              |h $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:text |on-save) (:type :leaf)
                                                  |b $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                                                      |b $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                                  |h $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:text |:saved-files) (:type :leaf)
                                                      |b $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                                  |l $ {} (:at 1650160657293) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                              |Y $ {} (:at 1650135653106) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650135654801) (:by |rJG4IHzWf) (:text |=<) (:type :leaf)
                                  |b $ {} (:at 1650135655373) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                                  |h $ {} (:at 1650135655952) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                              |c $ {} (:at 1650135636612) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650162556846) (:by |rJG4IHzWf) (:text |a) (:type :leaf)
                                  |b $ {} (:at 1650135637812) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650135638171) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |X $ {} (:at 1650135641474) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650135643993) (:by |rJG4IHzWf) (:text |:inner-text) (:type :leaf)
                                          |b $ {} (:at 1650135762761) (:by |rJG4IHzWf) (:text "|\"Command") (:type :leaf)
                                      |b $ {} (:at 1650135638507) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650135639292) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                          |b $ {} (:at 1650162561201) (:by |rJG4IHzWf) (:text |ui/link) (:type :leaf)
                                      |h $ {} (:at 1650160937848) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650160939655) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                          |b $ {} (:at 1650160939968) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650160940316) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1650160940648) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650160940881) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                  |b $ {} (:at 1650160941624) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                              |h $ {} (:at 1650160942293) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650160944837) (:by |rJG4IHzWf) (:text |.show) (:type :leaf)
                                                  |b $ {} (:at 1650160947369) (:by |rJG4IHzWf) (:text |command-plugin) (:type :leaf)
                                                  |h $ {} (:at 1650160954671) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                  |l $ {} (:at 1650160955328) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650160955725) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1650160956523) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650160975906) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                                                      |h $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                                          |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                                                  |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                                                      |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |parse-cirru) (:type :leaf)
                                                                          |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                                                          |h $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                              |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |list?) (:type :leaf)
                                                                  |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                                              |h $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |run-command) (:type :leaf)
                                                                  |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                                                  |h $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                              |l $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                  |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |:warn) (:type :leaf)
                                                                  |h $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                                      |b $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text "|\"invalid command:") (:type :leaf)
                                                                      |h $ {} (:at 1650160972473) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                      |X $ {} (:at 1650136998655) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650136999085) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                          |b $ {} (:at 1650136999562) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650137001528) (:by |rJG4IHzWf) (:text |:menu?) (:type :leaf)
                              |b $ {} (:at 1650137002408) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                          |h $ {} (:at 1650137002842) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650137004891) (:by |rJG4IHzWf) (:text |comp-menu) (:type :leaf)
                              |V $ {} (:at 1650161641658) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650161642249) (:by |rJG4IHzWf) (:text |>>) (:type :leaf)
                                  |b $ {} (:at 1650161643272) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                                  |h $ {} (:at 1650161644471) (:by |rJG4IHzWf) (:text |:menu) (:type :leaf)
                              |X $ {} (:at 1650161302554) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650161303987) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                                  |b $ {} (:at 1650161304934) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |Z $ {} (:at 1650161403486) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650161404882) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                  |b $ {} (:at 1650161405982) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |b $ {} (:at 1650137153348) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650137153580) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                  |b $ {} (:at 1650137153895) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650137154490) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                  |h $ {} (:at 1650137157301) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650137157301) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                      |b $ {} (:at 1650137157301) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                      |h $ {} (:at 1650137157301) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650137157301) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                          |b $ {} (:at 1650137157301) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                          |h $ {} (:at 1650137157301) (:by |rJG4IHzWf) (:text |:menu?) (:type :leaf)
                                          |l $ {} (:at 1650137159179) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                      |b $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                          |b $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                  |b $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:text |style-error) (:type :leaf)
                          |h $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:text |<>) (:type :leaf)
                              |b $ {} (:at 1650197132083) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1650197132579) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                                  |T $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:text |:warning) (:type :leaf)
                                      |b $ {} (:at 1650136857867) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                  |b $ {} (:at 1650197133458) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                      |h $ {} (:at 1650160929602) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650160932354) (:by |rJG4IHzWf) (:text |.render) (:type :leaf)
                          |b $ {} (:at 1650160933004) (:by |rJG4IHzWf) (:text |command-plugin) (:type :leaf)
          |comp-search-entry $ {} (:at 1650192464760) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650192467234) (:by |rJG4IHzWf) (:text |defcomp) (:type :leaf)
              |b $ {} (:at 1650192464760) (:by |rJG4IHzWf) (:text |comp-search-entry) (:type :leaf)
              |h $ {} (:at 1650192464760) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650192464760) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                  |b $ {} (:at 1650192464760) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                  |h $ {} (:at 1650192464760) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                  |l $ {} (:at 1650193478288) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
              |l $ {} (:at 1650192534254) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1650192534844) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1650193057465) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1650193161448) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650193164892) (:by |rJG4IHzWf) (:text |queries) (:type :leaf)
                          |b $ {} (:at 1650193165632) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650193167169) (:by |rJG4IHzWf) (:text |.split) (:type :leaf)
                              |b $ {} (:at 1650193167851) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650193171545) (:by |rJG4IHzWf) (:text |:query) (:type :leaf)
                                  |b $ {} (:at 1650193170139) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                              |h $ {} (:at 1650193224394) (:by |rJG4IHzWf) (:text "|\" ") (:type :leaf)
                      |T $ {} (:at 1650192535074) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650193059913) (:by |rJG4IHzWf) (:text |entries) (:type :leaf)
                          |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                              |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                              |h $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |.to-list) (:type :leaf)
                              |l $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |mapcat) (:type :leaf)
                                  |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                      |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                      |h $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |let[]) (:type :leaf)
                                          |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                              |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                          |h $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                          |l $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |flipped) (:type :leaf)
                                              |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |prepend) (:type :leaf)
                                              |h $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                  |h $ {} (:at 1650193066907) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                              |l $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                  |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                                      |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                  |h $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                                  |l $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |.to-list) (:type :leaf)
                                                  |o $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |.map) (:type :leaf)
                                                      |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                          |b $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650193062903) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                          |e $ {} (:at 1650193074096) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650193073884) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                              |b $ {} (:at 1650193075475) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                              |h $ {} (:at 1650193437571) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                                              |l $ {} (:at 1650193078604) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                  |T $ {} (:at 1650192468415) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650192531889) (:by |rJG4IHzWf) (:text |list->) (:type :leaf)
                      |b $ {} (:at 1650192469163) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650192469480) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1650192517227) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650192517999) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                              |b $ {} (:at 1650193283621) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1650193284525) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                  |T $ {} (:at 1650192520907) (:by |rJG4IHzWf) (:text |ui/expand) (:type :leaf)
                      |h $ {} (:at 1650193082021) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650193082729) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                          |b $ {} (:at 1650193083885) (:by |rJG4IHzWf) (:text |entries) (:type :leaf)
                          |e $ {} (:at 1650193151850) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650193151563) (:by |rJG4IHzWf) (:text |filter) (:type :leaf)
                              |b $ {} (:at 1650193152461) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650193152706) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                  |b $ {} (:at 1650193154241) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650193153470) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                  |h $ {} (:at 1650193174630) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650193235681) (:by |rJG4IHzWf) (:text |every?) (:type :leaf)
                                      |b $ {} (:at 1650193179899) (:by |rJG4IHzWf) (:text |queries) (:type :leaf)
                                      |h $ {} (:at 1650193180336) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650193180643) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                          |b $ {} (:at 1650193180915) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650193181482) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                          |h $ {} (:at 1650193182238) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650193188762) (:by |rJG4IHzWf) (:text |.includes?) (:type :leaf)
                                              |b $ {} (:at 1650193192207) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1650193196604) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                  |T $ {} (:at 1650193195817) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                              |h $ {} (:at 1650193207345) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                          |h $ {} (:at 1650193084465) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650193087608) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                              |b $ {} (:at 1650193090319) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1650193090791) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                  |T $ {} (:at 1650193087935) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650193089775) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                  |b $ {} (:at 1650193091310) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650193097455) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1650193098751) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650193099330) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                          |b $ {} (:at 1650193100364) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                      |h $ {} (:at 1650193111870) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650193114114) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                                          |b $ {} (:at 1650193114686) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650193116077) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1650193248280) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650193251275) (:by |rJG4IHzWf) (:text |:class-name) (:type :leaf)
                                                  |b $ {} (:at 1650193254629) (:by |rJG4IHzWf) (:text "|\"hover-entry") (:type :leaf)
                                              |h $ {} (:at 1650193257016) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650193257921) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                  |b $ {} (:at 1650193258169) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650193258459) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                      |b $ {} (:at 1650193258720) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193260325) (:by |rJG4IHzWf) (:text |:line-height) (:type :leaf)
                                                          |b $ {} (:at 1650193260673) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                      |h $ {} (:at 1650193261092) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193265410) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                                          |b $ {} (:at 1650193267992) (:by |rJG4IHzWf) (:text |ui/font-code) (:type :leaf)
                                                      |l $ {} (:at 1650193275216) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193277199) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                                                          |b $ {} (:at 1650193279017) (:by |rJG4IHzWf) (:text |:pointer) (:type :leaf)
                                                      |o $ {} (:at 1650194499761) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650194501068) (:by |rJG4IHzWf) (:text |:padding) (:type :leaf)
                                                          |b $ {} (:at 1650194503015) (:by |rJG4IHzWf) (:text "|\"0 8px") (:type :leaf)
                                              |l $ {} (:at 1650193343029) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650193345285) (:by |rJG4IHzWf) (:text |:on-click) (:type :leaf)
                                                  |b $ {} (:at 1650193345585) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650193345892) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1650193346249) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193346471) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                          |b $ {} (:at 1650193346951) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                      |h $ {} (:at 1650193347400) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193347952) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                          |b $ {} (:at 1650193350155) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                                          |h $ {} (:at 1650193353468) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                                      |l $ {} (:at 1650193482993) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193480749) (:by |rJG4IHzWf) (:text |on-close) (:type :leaf)
                                                          |b $ {} (:at 1650193483606) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                      |o $ {} (:at 1650193522064) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193522966) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                          |b $ {} (:at 1650193525585) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                                          |h $ {} (:at 1650193525901) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650193526755) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                                              |b $ {} (:at 1650193527983) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                                              |h $ {} (:at 1650193529471) (:by |rJG4IHzWf) (:text |:query) (:type :leaf)
                                                              |l $ {} (:at 1650193529828) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                          |h $ {} (:at 1650193116495) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650193116900) (:by |rJG4IHzWf) (:text |<>) (:type :leaf)
                                              |b $ {} (:at 1650193305512) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650193305840) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                  |b $ {} (:at 1650193306414) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650193306604) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                      |b $ {} (:at 1650193307368) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                      |h $ {} (:at 1650193307585) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193308357) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                                          |b $ {} (:at 1650193309361) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                                  |h $ {} (:at 1650193310577) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650193311416) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                      |b $ {} (:at 1650193316526) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193317198) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                                          |b $ {} (:at 1650193318309) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                                      |h $ {} (:at 1650193320617) (:by |rJG4IHzWf) (:text "|\" :ns") (:type :leaf)
                                                  |l $ {} (:at 1650193310577) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650193311416) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                      |b $ {} (:at 1650193316526) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193317198) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                                          |b $ {} (:at 1650193318309) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
                                                      |h $ {} (:at 1650193331127) (:by |rJG4IHzWf) (:text "|\"/") (:type :leaf)
                                                      |l $ {} (:at 1650193332089) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650193333454) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                          |b $ {} (:at 1650193334350) (:by |rJG4IHzWf) (:text |entry) (:type :leaf)
          |effect-focus $ {} (:at 1650194403788) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650194406213) (:by |rJG4IHzWf) (:text |defeffect) (:type :leaf)
              |b $ {} (:at 1650194403788) (:by |rJG4IHzWf) (:text |effect-focus) (:type :leaf)
              |h $ {} (:at 1650194455386) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650194454811) (:by |rJG4IHzWf) (:text |query) (:type :leaf)
              |l $ {} (:at 1650194411129) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650194427594) (:by |rJG4IHzWf) (:text |action) (:type :leaf)
                  |b $ {} (:at 1650194427910) (:by |rJG4IHzWf) (:text |el) (:type :leaf)
                  |h $ {} (:at 1650194429191) (:by |rJG4IHzWf) (:text |at?) (:type :leaf)
              |o $ {} (:at 1650194457313) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1650194462940) (:by |rJG4IHzWf) (:text |.!select) (:type :leaf)
                  |T $ {} (:at 1650194430381) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650194442102) (:by |rJG4IHzWf) (:text |js/document.querySelector) (:type :leaf)
                      |b $ {} (:at 1650194450629) (:by |rJG4IHzWf) (:text |query) (:type :leaf)
          |on-save $ {} (:at 1649851121078) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649851121078) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1650160635220) (:by |rJG4IHzWf) (:text |on-save) (:type :leaf)
              |h $ {} (:at 1649851121078) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |H $ {} (:at 1649851124652) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                  |U $ {} (:at 1649851127591) (:by |rJG4IHzWf) (:text |saved-files) (:type :leaf)
                  |h $ {} (:at 1649851121078) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
              |l $ {} (:at 1649851128510) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649851130584) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |b $ {} (:at 1649851130855) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |b $ {} (:at 1649851153824) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649851157869) (:by |rJG4IHzWf) (:text |removed-entries) (:type :leaf)
                          |b $ {} (:at 1649851159932) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649851159932) (:by |rJG4IHzWf) (:text |difference) (:type :leaf)
                              |X $ {} (:at 1649851163333) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649851163333) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                  |b $ {} (:at 1649851163333) (:by |rJG4IHzWf) (:text |saved-files) (:type :leaf)
                              |b $ {} (:at 1649851159932) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649851159932) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                  |b $ {} (:at 1649851159932) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                      |h $ {} (:at 1649851172979) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649851174774) (:by |rJG4IHzWf) (:text |common-ns) (:type :leaf)
                          |b $ {} (:at 1649851178958) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649851181904) (:by |rJG4IHzWf) (:text |intersection) (:type :leaf)
                              |T $ {} (:at 1649851176969) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649851177807) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                  |b $ {} (:at 1649851187485) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                              |b $ {} (:at 1649851190136) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649851190136) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                  |b $ {} (:at 1649851190136) (:by |rJG4IHzWf) (:text |saved-files) (:type :leaf)
                      |j $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:text |new-entries) (:type :leaf)
                          |b $ {} (:at 1649853710864) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649853712212) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                              |T $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:text |difference) (:type :leaf)
                                  |b $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                      |b $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |h $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                      |b $ {} (:at 1649853709038) (:by |rJG4IHzWf) (:text |saved-files) (:type :leaf)
                              |b $ {} (:at 1649853712856) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853718186) (:by |rJG4IHzWf) (:text |.to-list) (:type :leaf)
                              |h $ {} (:at 1649853718624) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853720791) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                  |b $ {} (:at 1649853721125) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649853721382) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                      |b $ {} (:at 1649853721750) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649853724637) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                      |h $ {} (:at 1649853725756) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649853726243) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649853727382) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                          |h $ {} (:at 1649853727642) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649853731606) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                              |b $ {} (:at 1649853733575) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                              |h $ {} (:at 1649853734330) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                              |l $ {} (:at 1649853735649) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853737181) (:by |rJG4IHzWf) (:text |pairs-map) (:type :leaf)
                      |l $ {} (:at 1649851193551) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649851230995) (:by |rJG4IHzWf) (:text |changed-entries) (:type :leaf)
                          |b $ {} (:at 1649851231601) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649851237144) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                              |T $ {} (:at 1649851232090) (:by |rJG4IHzWf) (:text |common-ns) (:type :leaf)
                              |b $ {} (:at 1649851238517) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649851248994) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                  |b $ {} (:at 1649851249298) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649851250492) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                      |b $ {} (:at 1649851250998) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649851251245) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                      |h $ {} (:at 1649851253064) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649851256153) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649851257203) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                          |h $ {} (:at 1649851321487) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649851322139) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                              |L $ {} (:at 1649851322397) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649851323252) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649851324394) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                      |b $ {} (:at 1649851326140) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649851326140) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                                          |b $ {} (:at 1649851326140) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                                          |h $ {} (:at 1649851326140) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                  |b $ {} (:at 1649851327294) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649851329247) (:by |rJG4IHzWf) (:text |saved-file) (:type :leaf)
                                                      |b $ {} (:at 1649851330576) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649851330576) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                                          |b $ {} (:at 1649851330576) (:by |rJG4IHzWf) (:text |saved-files) (:type :leaf)
                                                          |h $ {} (:at 1649851330576) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                              |T $ {} (:at 1649851257697) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649851260083) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                  |b $ {} (:at 1649851261025) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649851260682) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                      |b $ {} (:at 1649851333668) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                      |h $ {} (:at 1649851335049) (:by |rJG4IHzWf) (:text |saved-file) (:type :leaf)
                                                  |h $ {} (:at 1649851275935) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                                  |l $ {} (:at 1649851397790) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649851398372) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                                      |L $ {} (:at 1649851398664) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1649851513943) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851515070) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                              |b $ {} (:at 1649851516158) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851516693) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                                                  |b $ {} (:at 1649851518973) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                          |L $ {} (:at 1649851519972) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851521751) (:by |rJG4IHzWf) (:text |saved-defs) (:type :leaf)
                                                              |b $ {} (:at 1649851522311) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851528448) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                                                  |b $ {} (:at 1649851526330) (:by |rJG4IHzWf) (:text |saved-file) (:type :leaf)
                                                          |T $ {} (:at 1649851400084) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851571851) (:by |rJG4IHzWf) (:text |common-defs) (:type :leaf)
                                                              |b $ {} (:at 1649851437266) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851440215) (:by |rJG4IHzWf) (:text |intersection) (:type :leaf)
                                                                  |b $ {} (:at 1649851441982) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851441982) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                                                      |b $ {} (:at 1649851533838) (:by |rJG4IHzWf) (:text |saved-defs) (:type :leaf)
                                                                  |h $ {} (:at 1649851444026) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851444026) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                                                      |b $ {} (:at 1649851537326) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                          |b $ {} (:at 1649851452325) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851453673) (:by |rJG4IHzWf) (:text |new-defs) (:type :leaf)
                                                              |b $ {} (:at 1649851456932) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851462607) (:by |rJG4IHzWf) (:text |difference) (:type :leaf)
                                                                  |h $ {} (:at 1649851456932) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851456932) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                                                      |b $ {} (:at 1649851541919) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                                  |l $ {} (:at 1649851459731) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851459731) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                                                      |b $ {} (:at 1649851539613) (:by |rJG4IHzWf) (:text |saved-defs) (:type :leaf)
                                                      |T $ {} (:at 1649851278443) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649851281878) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649851283661) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851284243) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                              |b $ {} (:at 1649851285108) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851315439) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                                  |b $ {} (:at 1649851337727) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851339566) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                                      |b $ {} (:at 1649851342147) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649851344514) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                                          |b $ {} (:at 1649851346213) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                                      |h $ {} (:at 1649851342147) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649851344514) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                                          |b $ {} (:at 1649851350730) (:by |rJG4IHzWf) (:text |saved-file) (:type :leaf)
                                                                  |h $ {} (:at 1649851354267) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                                                  |l $ {} (:at 1649851688999) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851688999) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                                      |b $ {} (:at 1649851688999) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                          |h $ {} (:at 1649851364408) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851466215) (:by |rJG4IHzWf) (:text |:added-defs) (:type :leaf)
                                                              |X $ {} (:at 1649851466811) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851468407) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                                  |b $ {} (:at 1649851468779) (:by |rJG4IHzWf) (:text |new-defs) (:type :leaf)
                                                                  |h $ {} (:at 1649851469572) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851469976) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                                                      |b $ {} (:at 1649851470811) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649851471062) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                          |b $ {} (:at 1649851474689) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649851476552) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                          |h $ {} (:at 1649851477221) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649851487751) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1649851490262) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                              |h $ {} (:at 1649851490569) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1649851556222) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                                                                  |b $ {} (:at 1649851551904) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                                                  |h $ {} (:at 1649851500079) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                  |l $ {} (:at 1649851502700) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851504411) (:by |rJG4IHzWf) (:text |pairs-map) (:type :leaf)
                                                          |l $ {} (:at 1649851372474) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851374254) (:by |rJG4IHzWf) (:text |:removed-defs) (:type :leaf)
                                                              |b $ {} (:at 1649851380165) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851382157) (:by |rJG4IHzWf) (:text |difference) (:type :leaf)
                                                                  |b $ {} (:at 1649851382649) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851383445) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                                                      |b $ {} (:at 1649851544464) (:by |rJG4IHzWf) (:text |saved-defs) (:type :leaf)
                                                                  |h $ {} (:at 1649851382649) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851383445) (:by |rJG4IHzWf) (:text |keys) (:type :leaf)
                                                                      |b $ {} (:at 1649851546685) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                          |o $ {} (:at 1649851392424) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649851394423) (:by |rJG4IHzWf) (:text |:changed-defs) (:type :leaf)
                                                              |b $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                                  |b $ {} (:at 1649851569099) (:by |rJG4IHzWf) (:text |common-defs) (:type :leaf)
                                                                  |e $ {} (:at 1649851631528) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851632601) (:by |rJG4IHzWf) (:text |filter) (:type :leaf)
                                                                      |b $ {} (:at 1649851633967) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649851634453) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                          |b $ {} (:at 1649851634785) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649851636857) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                          |h $ {} (:at 1649851637781) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649851638523) (:by |rJG4IHzWf) (:text |not=) (:type :leaf)
                                                                              |b $ {} (:at 1649851639733) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1649851642918) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                                                                  |b $ {} (:at 1649851643962) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                                                  |h $ {} (:at 1649851645410) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                              |h $ {} (:at 1649851639733) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1649851642918) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                                                                  |b $ {} (:at 1649851648824) (:by |rJG4IHzWf) (:text |saved-defs) (:type :leaf)
                                                                                  |h $ {} (:at 1649851645410) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                  |h $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                                                      |b $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                          |b $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                          |h $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                              |h $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                                                                  |b $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                                                  |h $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                                  |l $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649851564610) (:by |rJG4IHzWf) (:text |pairs-map) (:type :leaf)
                              |e $ {} (:at 1649851763937) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649851764740) (:by |rJG4IHzWf) (:text |filter) (:type :leaf)
                                  |b $ {} (:at 1649851765115) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649851765588) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                      |b $ {} (:at 1649851765921) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649851767610) (:by |rJG4IHzWf) (:text |pair) (:type :leaf)
                                      |h $ {} (:at 1649851768175) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649851770364) (:by |rJG4IHzWf) (:text |some?) (:type :leaf)
                                          |b $ {} (:at 1649851771067) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649851771733) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                              |b $ {} (:at 1649851773626) (:by |rJG4IHzWf) (:text |pair) (:type :leaf)
                                              |h $ {} (:at 1649851773857) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                              |h $ {} (:at 1649851580260) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649851581967) (:by |rJG4IHzWf) (:text |pairs-map) (:type :leaf)
                      |o $ {} (:at 1649852326958) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649852327771) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                          |b $ {} (:at 1649852329581) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649852329581) (:by |rJG4IHzWf) (:text |format-cirru-edn) (:type :leaf)
                              |b $ {} (:at 1649853293767) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649853295418) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |L $ {} (:at 1649853306881) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649853309137) (:by |rJG4IHzWf) (:text |:added) (:type :leaf)
                                      |b $ {} (:at 1649853315476) (:by |rJG4IHzWf) (:text |new-entries) (:type :leaf)
                                  |P $ {} (:at 1649853316870) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649853317876) (:by |rJG4IHzWf) (:text |:removed) (:type :leaf)
                                      |b $ {} (:at 1649853322922) (:by |rJG4IHzWf) (:text |removed-entries) (:type :leaf)
                                  |T $ {} (:at 1649853301322) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649853306414) (:by |rJG4IHzWf) (:text |:changed) (:type :leaf)
                                      |T $ {} (:at 1649852329581) (:by |rJG4IHzWf) (:text |changed-entries) (:type :leaf)
                  |h $ {} (:at 1649851587533) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649852331436) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                      |T $ {} (:at 1649851591119) (:by |rJG4IHzWf) (:text |js/console.log) (:type :leaf)
                      |b $ {} (:at 1649851591474) (:by |rJG4IHzWf) (:text |changed-entries) (:type :leaf)
                  |l $ {} (:at 1649851747376) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649852330845) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                      |T $ {} (:at 1649851748946) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                      |b $ {} (:at 1649851751348) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649851755070) (:by |rJG4IHzWf) (:text |format-cirru-edn) (:type :leaf)
                          |b $ {} (:at 1649851756326) (:by |rJG4IHzWf) (:text |changed-entries) (:type :leaf)
                  |o $ {} (:at 1649852353694) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649852354949) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                      |T $ {} (:at 1649852332359) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649852335039) (:by |rJG4IHzWf) (:text |js/fetch) (:type :leaf)
                          |b $ {} (:at 1649852346424) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649852337834) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                              |b $ {} (:at 1649852335839) (:by |rJG4IHzWf) (:text |api-host) (:type :leaf)
                              |h $ {} (:at 1649852345052) (:by |rJG4IHzWf) (:text "|\"/compact-inc") (:type :leaf)
                          |h $ {} (:at 1649852349540) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649852351558) (:by |rJG4IHzWf) (:text |js-object) (:type :leaf)
                              |b $ {} (:at 1649852358579) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649852362957) (:by |rJG4IHzWf) (:text |:method) (:type :leaf)
                                  |b $ {} (:at 1649852365116) (:by |rJG4IHzWf) (:text "|\"PUT") (:type :leaf)
                              |h $ {} (:at 1649852370527) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649852372521) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                                  |b $ {} (:at 1649852374732) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                      |b $ {} (:at 1649852366722) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649852379489) (:by |rJG4IHzWf) (:text |.then) (:type :leaf)
                          |b $ {} (:at 1649852379929) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649852381041) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                              |b $ {} (:at 1649852381339) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649852382737) (:by |rJG4IHzWf) (:text |res) (:type :leaf)
                              |h $ {} (:at 1649852383291) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649852385304) (:by |rJG4IHzWf) (:text |js/console.log) (:type :leaf)
                                  |b $ {} (:at 1649852387676) (:by |rJG4IHzWf) (:text "|\"response") (:type :leaf)
                                  |h $ {} (:at 1649852388878) (:by |rJG4IHzWf) (:text |res) (:type :leaf)
          |run-command $ {} (:at 1649963857307) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649963857307) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1650161021128) (:by |rJG4IHzWf) (:text |run-command) (:type :leaf)
              |h $ {} (:at 1649963857307) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649963857307) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                  |b $ {} (:at 1649963857307) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
              |l $ {} (:at 1649963859308) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649963945296) (:by |rJG4IHzWf) (:text |case-default) (:type :leaf)
                  |b $ {} (:at 1649963947658) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649963948426) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                      |b $ {} (:at 1649963949855) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                  |h $ {} (:at 1649963952987) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649963958386) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                      |X $ {} (:at 1649963965914) (:by |rJG4IHzWf) (:text |:warn) (:type :leaf)
                      |b $ {} (:at 1649963966493) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649963968494) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                          |T $ {} (:at 1649963972235) (:by |rJG4IHzWf) (:text "|\"invalid command: ") (:type :leaf)
                          |b $ {} (:at 1649963973537) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                  |l $ {} (:at 1649963974561) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649963978464) (:by |rJG4IHzWf) (:text "|\"add-ns") (:type :leaf)
                      |b $ {} (:at 1649964011371) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649964013215) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |b $ {} (:at 1649964014680) (:by |rJG4IHzWf) (:text |:add-ns) (:type :leaf)
                          |h $ {} (:at 1649964022205) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964023797) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                              |b $ {} (:at 1649964025405) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                              |h $ {} (:at 1649964025747) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                  |o $ {} (:at 1649963980245) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649963984880) (:by |rJG4IHzWf) (:text "|\"rm-ns") (:type :leaf)
                      |b $ {} (:at 1649964027528) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649964028027) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |b $ {} (:at 1649964030491) (:by |rJG4IHzWf) (:text |:rm-ns) (:type :leaf)
                          |h $ {} (:at 1649964033533) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964033533) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                              |b $ {} (:at 1649964033533) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                              |h $ {} (:at 1649964033533) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                  |q $ {} (:at 1649963985369) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649963988778) (:by |rJG4IHzWf) (:text "|\"add-def") (:type :leaf)
                      |b $ {} (:at 1649964035371) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649964035371) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |b $ {} (:at 1649964056264) (:by |rJG4IHzWf) (:text |:add-def) (:type :leaf)
                          |h $ {} (:at 1649964136831) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649964137300) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                              |T $ {} (:at 1649964035371) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964035371) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                  |b $ {} (:at 1649964035371) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                  |h $ {} (:at 1649964035371) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                              |b $ {} (:at 1649964139514) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964139514) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                  |b $ {} (:at 1649964139514) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                  |h $ {} (:at 1649964139514) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                  |s $ {} (:at 1649963989304) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649964003026) (:by |rJG4IHzWf) (:text "|\"rm-def") (:type :leaf)
                      |b $ {} (:at 1649964050862) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649964050862) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |b $ {} (:at 1649964058975) (:by |rJG4IHzWf) (:text |:rm-def) (:type :leaf)
                          |h $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                              |b $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                  |b $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                  |h $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                              |h $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                  |b $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                  |h $ {} (:at 1649964142758) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
          |style-error $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |style-error) (:type :leaf)
              |h $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:fixed) (:type :leaf)
                  |h $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:bottom) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                  |l $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:left) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                  |o $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:font-size) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |14) (:type :leaf)
                  |q $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |ui/font-code) (:type :leaf)
                  |s $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:padding) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text "|\"8px 16px") (:type :leaf)
                  |t $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |hsl) (:type :leaf)
                          |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |h $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |90) (:type :leaf)
                          |l $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |70) (:type :leaf)
                  |u $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |:background-color) (:type :leaf)
                      |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |hsl) (:type :leaf)
                          |b $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |h $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |l $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |o $ {} (:at 1650136822551) (:by |rJG4IHzWf) (:text |0.7) (:type :leaf)
          |style-navbar $ {} (:at 1650136908012) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650136908012) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1650136908012) (:by |rJG4IHzWf) (:text |style-navbar) (:type :leaf)
              |h $ {} (:at 1650136908012) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650136908012) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1650136917307) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136917307) (:by |rJG4IHzWf) (:text |:padding) (:type :leaf)
                      |b $ {} (:at 1650136917307) (:by |rJG4IHzWf) (:text "|\"4px 8px") (:type :leaf)
                  |h $ {} (:at 1650136918147) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136919749) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                      |b $ {} (:at 1650136921879) (:by |rJG4IHzWf) (:text |:absolute) (:type :leaf)
                  |l $ {} (:at 1650136922633) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136924847) (:by |rJG4IHzWf) (:text |:top) (:type :leaf)
                      |b $ {} (:at 1650136925052) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                  |o $ {} (:at 1650136925582) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136927605) (:by |rJG4IHzWf) (:text |:left) (:type :leaf)
                      |b $ {} (:at 1650136927932) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                  |q $ {} (:at 1650136929118) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650136930066) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                      |b $ {} (:at 1650136932822) (:by |rJG4IHzWf) (:text "|\"100%") (:type :leaf)
        :ns $ {} (:at 1650134755553) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1650134755553) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1650134755553) (:by |rJG4IHzWf) (:text |app.comp.nav) (:type :leaf)
            |h $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |b $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |respo-ui.core) (:type :leaf)
                    |b $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |ui) (:type :leaf)
                |e $ {} (:at 1650135940166) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135943338) (:by |rJG4IHzWf) (:text |respo-ui.core) (:type :leaf)
                    |b $ {} (:at 1650135944055) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1650135944319) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650135944720) (:by |rJG4IHzWf) (:text |hsl) (:type :leaf)
                |h $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |respo.core) (:type :leaf)
                    |b $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |defcomp) (:type :leaf)
                        |b $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |defeffect) (:type :leaf)
                        |h $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |<>) (:type :leaf)
                        |l $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |>>) (:type :leaf)
                        |o $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                        |q $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |button) (:type :leaf)
                        |s $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |textarea) (:type :leaf)
                        |t $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |span) (:type :leaf)
                        |u $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |input) (:type :leaf)
                        |v $ {} (:at 1650137125888) (:by |rJG4IHzWf) (:text |a) (:type :leaf)
                        |w $ {} (:at 1650161346808) (:by |rJG4IHzWf) (:text |list->) (:type :leaf)
                |l $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |respo.comp.space) (:type :leaf)
                    |b $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |=<) (:type :leaf)
                |s $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |app.config) (:type :leaf)
                    |b $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650135129519) (:by |rJG4IHzWf) (:text |dev?) (:type :leaf)
                        |b $ {} (:at 1650160665693) (:by |rJG4IHzWf) (:text |api-host) (:type :leaf)
                |t $ {} (:at 1650135697074) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135699770) (:by |rJG4IHzWf) (:text |app.widget) (:type :leaf)
                    |b $ {} (:at 1650135700396) (:by |rJG4IHzWf) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1650135701322) (:by |rJG4IHzWf) (:text |widget) (:type :leaf)
                |u $ {} (:at 1650160874920) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |D $ {} (:at 1650160891110) (:by |rJG4IHzWf) (:text |respo-alerts.core) (:type :leaf)
                    |L $ {} (:at 1650160892092) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |T $ {} (:at 1650160878277) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650160878277) (:by |rJG4IHzWf) (:text |use-prompt) (:type :leaf)
      |app.config $ {}
        :defs $ {}
          |api-host $ {} (:at 1649852295006) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649852298774) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649852295006) (:by |rJG4IHzWf) (:text |api-host) (:type :leaf)
              |h $ {} (:at 1649852297385) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649852297385) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                  |b $ {} (:at 1649852297385) (:by |rJG4IHzWf) (:text "|\"http://") (:type :leaf)
                  |h $ {} (:at 1649852297385) (:by |rJG4IHzWf) (:text |js/location.hostname) (:type :leaf)
                  |l $ {} (:at 1649852297385) (:by |rJG4IHzWf) (:text "|\":6101") (:type :leaf)
          |code-font $ {} (:at 1649851033607) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649851044218) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649851033607) (:by |rJG4IHzWf) (:text |code-font) (:type :leaf)
              |h $ {} (:at 1649851045454) (:by |rJG4IHzWf) (:text "|\"Roboto Mono, monospace") (:type :leaf)
          |cors-headers $ {} (:at 1649852624646) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649852628252) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649852624646) (:by |rJG4IHzWf) (:text |cors-headers) (:type :leaf)
              |h $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:text |:Content-Type) (:type :leaf)
                      |b $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:text "|\"data/cirru-edn") (:type :leaf)
                  |h $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:text |:Access-Control-Allow-Origin) (:type :leaf)
                      |b $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:text "|\"*") (:type :leaf)
                  |l $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:text |:Access-Control-Allow-Methods) (:type :leaf)
                      |b $ {} (:at 1649852627049) (:by |rJG4IHzWf) (:text "|\"*") (:type :leaf)
          |dot-radius $ {} (:at 1650211848170) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650211851568) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1650211848170) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
              |h $ {} (:at 1650212885799) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
          |leaf-gap $ {} (:at 1649227293365) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649227297570) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649227293365) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
              |h $ {} (:at 1650209675519) (:by |rJG4IHzWf) (:text |16) (:type :leaf)
          |leaf-height $ {} (:at 1649227496870) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649227499166) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649227496870) (:by |rJG4IHzWf) (:text |leaf-height) (:type :leaf)
              |h $ {} (:at 1649959896353) (:by |rJG4IHzWf) (:text |24) (:type :leaf)
          |line-height $ {} (:at 1649229076034) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649229078668) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649229076034) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
              |h $ {} (:at 1649336614667) (:by |rJG4IHzWf) (:text |32) (:type :leaf)
          |site $ {} (:at 1545933382603) (:by |root) (:id |i6pfoMgwq) (:type :expr)
            :data $ {}
              |T $ {} (:at 1518157345496) (:by |root) (:id |Hy-Of025IG) (:text |def) (:type :leaf)
              |j $ {} (:at 1518157327696) (:by |root) (:id |SyfufCnc8G) (:text |site) (:type :leaf)
              |r $ {} (:at 1518157327696) (:by |root) (:id |Hy7OfCnqUG) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1518157346643) (:by |root) (:id |HyZ5XCh58M) (:text |{}) (:type :leaf)
                  |y $ {} (:at 1527868456422) (:by |root) (:id |HJlgNn11gm) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1527868457305) (:by |root) (:id |HJlgNn11gmleaf) (:text |:title) (:type :leaf)
                      |j $ {} (:at 1573292411084) (:by |rJG4IHzWf) (:id |S1eWS2JJlm) (:text "|\"Phlox") (:type :leaf)
                  |yT $ {} (:at 1527868457696) (:by |root) (:id |HJxzN3kyxm) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1527868458476) (:by |root) (:id |HJxzN3kyxmleaf) (:text |:icon) (:type :leaf)
                      |j $ {} (:at 1573292425255) (:by |rJG4IHzWf) (:id |rJeUB2k1xQ) (:text "|\"http://cdn.tiye.me/logo/quamolit.png") (:type :leaf)
                  |yf $ {} (:at 1544956719115) (:by |rJG4IHzWf) (:id |E81qVD65QI) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1544956719115) (:by |rJG4IHzWf) (:id |uzAHSBrxME) (:text |:storage-key) (:type :leaf)
                      |j $ {} (:at 1574511341643) (:by |rJG4IHzWf) (:id |3M_DNn-aUN) (:text "|\"phlox-workflow") (:type :leaf)
        :ns $ {} (:at 1527788237503) (:by |root) (:id |BJlrAf2TyX) (:type :expr)
          :data $ {}
            |T $ {} (:at 1527788237503) (:by |root) (:id |SkZHRz3TJ7) (:text |ns) (:type :leaf)
            |j $ {} (:at 1527788237503) (:by |root) (:id |HJzrRGhp1X) (:text |app.config) (:type :leaf)
            |s $ {} (:at 1649073519181) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1649073519181) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |b $ {} (:at 1649073519181) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649073519181) (:by |rJG4IHzWf) (:text "|\"mobile-detect") (:type :leaf)
                    |b $ {} (:at 1649073519181) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |h $ {} (:at 1649073519181) (:by |rJG4IHzWf) (:text |mobile-detect) (:type :leaf)
        :proc $ {} (:at 1527788237503) (:by |root) (:id |Hk7B0z3pJX) (:type :expr)
          :data $ {}
      |app.container $ {}
        :defs $ {}
          |all-block? $ {} (:at 1650213204319) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650213204319) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1650213204319) (:by |rJG4IHzWf) (:text |all-block?) (:type :leaf)
              |h $ {} (:at 1650213204319) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650213204319) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
              |l $ {} (:at 1650213206062) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650213207845) (:by |rJG4IHzWf) (:text |every?) (:type :leaf)
                  |b $ {} (:at 1650213213803) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                  |h $ {} (:at 1650213214895) (:by |rJG4IHzWf) (:text |list?) (:type :leaf)
          |comp-container $ {} (:at 1573356299931) (:by |rJG4IHzWf) (:id |Txfqxt4rCB) (:type :expr)
            :data $ {}
              |T $ {} (:at 1573923376454) (:by |rJG4IHzWf) (:id |ZA64iDmVDY) (:text |defcomp) (:type :leaf)
              |j $ {} (:at 1573356299931) (:by |rJG4IHzWf) (:id |cnaxAYx-vP) (:text |comp-container) (:type :leaf)
              |r $ {} (:at 1573356299931) (:by |rJG4IHzWf) (:id |LJOqz2qL0L) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1573662792335) (:by |rJG4IHzWf) (:id |6d14YihKa) (:text |store) (:type :leaf)
              |v $ {} (:at 1582981227143) (:by |rJG4IHzWf) (:id |YWz8iHdI) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1582981228465) (:by |rJG4IHzWf) (:id |a5rkA2hPa) (:text |let) (:type :leaf)
                  |L $ {} (:at 1582981229181) (:by |rJG4IHzWf) (:id |jUH4nAEt) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1582981229329) (:by |rJG4IHzWf) (:id |gSvpUyfN1) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1582981230028) (:by |rJG4IHzWf) (:id |GSObTjjnX) (:text |states) (:type :leaf)
                          |j $ {} (:at 1582981230263) (:by |rJG4IHzWf) (:id |MAs7xVt_V) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1582981231046) (:by |rJG4IHzWf) (:id |f-GQyJLp) (:text |:states) (:type :leaf)
                              |j $ {} (:at 1582981231774) (:by |rJG4IHzWf) (:id |uFb3Tykz) (:text |store) (:type :leaf)
                      |j $ {} (:at 1582981235652) (:by |rJG4IHzWf) (:id |nc6DSexf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1582981237122) (:by |rJG4IHzWf) (:id |nc6DSexfleaf) (:text |cursor) (:type :leaf)
                          |j $ {} (:at 1582981237365) (:by |rJG4IHzWf) (:id |kQkDUOA4K) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1582981237700) (:by |rJG4IHzWf) (:id |nQ2hBEqil) (:text |[]) (:type :leaf)
                      |v $ {} (:at 1584275027849) (:by |rJG4IHzWf) (:id |YcTxtXYFm) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584275029421) (:by |rJG4IHzWf) (:id |YcTxtXYFmleaf) (:text |state) (:type :leaf)
                          |j $ {} (:at 1584275029771) (:by |rJG4IHzWf) (:id |b45uHRMtT) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584275030309) (:by |rJG4IHzWf) (:id |-7oSId1D7) (:text |or) (:type :leaf)
                              |j $ {} (:at 1584275030550) (:by |rJG4IHzWf) (:id |EgTYSQLV5) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584275034344) (:by |rJG4IHzWf) (:id |F8gPHV6Gf) (:text |:data) (:type :leaf)
                                  |j $ {} (:at 1584275035188) (:by |rJG4IHzWf) (:id |d4UEmppEy) (:text |states) (:type :leaf)
                              |r $ {} (:at 1584275036516) (:by |rJG4IHzWf) (:id |0QWM7GFw) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584275036851) (:by |rJG4IHzWf) (:id |T-1U5nsBt) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1649787890360) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649787895026) (:by |rJG4IHzWf) (:text |:selected-ns) (:type :leaf)
                                      |b $ {} (:at 1649787896637) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |h $ {} (:at 1649849216073) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649849219571) (:by |rJG4IHzWf) (:text |:def-target) (:type :leaf)
                                      |b $ {} (:at 1649849220454) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |w $ {} (:at 1649234948184) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649234951814) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                          |b $ {} (:at 1649234954196) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649234954196) (:by |rJG4IHzWf) (:text |:code-tree) (:type :leaf)
                              |b $ {} (:at 1649234954196) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                      |x $ {} (:at 1649234948184) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649234962769) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                          |b $ {} (:at 1649234954196) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649234965641) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                              |b $ {} (:at 1649234954196) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                      |y $ {} (:at 1649787652655) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649787653379) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                          |b $ {} (:at 1649787653980) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649787655773) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                              |b $ {} (:at 1649787656459) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                  |T $ {} (:at 1649234307288) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649234308485) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                      |L $ {} (:at 1649234308705) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649234309080) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |h $ {} (:at 1649234316463) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649234322279) (:by |rJG4IHzWf) (:text |:on-keyboard) (:type :leaf)
                              |b $ {} (:at 1649234322516) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649234323068) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1649234324487) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649234889110) (:by |rJG4IHzWf) (:text |:down) (:type :leaf)
                                      |b $ {} (:at 1649234333031) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649234333337) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                          |b $ {} (:at 1649234333603) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649234333766) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                              |b $ {} (:at 1649234338646) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                          |e $ {} (:at 1649337571223) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649337571724) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                              |T $ {} (:at 1649254894213) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649254894368) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                  |X $ {} (:at 1649254902326) (:by |rJG4IHzWf) (:text "|\"Tab") (:type :leaf)
                                                  |b $ {} (:at 1649254899073) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649254898853) (:by |rJG4IHzWf) (:text |:key) (:type :leaf)
                                                      |b $ {} (:at 1649254915114) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                              |b $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:text |.!preventDefault) (:type :leaf)
                                                  |b $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:text |:event) (:type :leaf)
                                                      |b $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                              |e $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649340360445) (:by |rJG4IHzWf) (:text |.!stopPropagation) (:type :leaf)
                                                  |b $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:text |:event) (:type :leaf)
                                                      |b $ {} (:at 1649337574148) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                              |h $ {} (:at 1649339599294) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649339611454) (:by |rJG4IHzWf) (:text |js/document.body.focus) (:type :leaf)
                                          |h $ {} (:at 1649964412601) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649964413151) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                              |L $ {} (:at 1650192102406) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1650192234104) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                                  |T $ {} (:at 1649964414327) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649964414897) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                                      |b $ {} (:at 1649964415822) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649964417569) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                                          |X $ {} (:at 1649964433697) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649964433697) (:by |rJG4IHzWf) (:text |:meta?) (:type :leaf)
                                                              |b $ {} (:at 1649964433697) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                          |b $ {} (:at 1649964420461) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649964420461) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                              |b $ {} (:at 1649964420461) (:by |rJG4IHzWf) (:text "|\"Tab") (:type :leaf)
                                                              |h $ {} (:at 1649964420461) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649964420461) (:by |rJG4IHzWf) (:text |:key) (:type :leaf)
                                                                  |b $ {} (:at 1649964420461) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                  |b $ {} (:at 1650192235557) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650192343753) (:by |rJG4IHzWf) (:text |identical?) (:type :leaf)
                                                      |b $ {} (:at 1650192235557) (:by |rJG4IHzWf) (:text |js/document.body) (:type :leaf)
                                                      |h $ {} (:at 1650192235557) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650192235557) (:by |rJG4IHzWf) (:text |.-target) (:type :leaf)
                                                          |b $ {} (:at 1650192235557) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650192235557) (:by |rJG4IHzWf) (:text |:event) (:type :leaf)
                                                              |b $ {} (:at 1650192235557) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                              |T $ {} (:at 1649234763562) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |5 $ {} (:at 1649235048379) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                  |D $ {} (:at 1649235046515) (:by |rJG4IHzWf) (:text |:cirru-edit) (:type :leaf)
                                                  |T $ {} (:at 1649235055525) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649235066198) (:by |rJG4IHzWf) (:text |dissoc) (:type :leaf)
                                                      |P $ {} (:at 1649235067004) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                      |Y $ {} (:at 1649235069555) (:by |rJG4IHzWf) (:text |:event) (:type :leaf)
                      |T $ {} (:at 1649095249749) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649095249749) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                          |h $ {} (:at 1649849407715) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649849410305) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |L $ {} (:at 1649849410728) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649849412482) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649849412075) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649849419992) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849421437) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                          |X $ {} (:at 1650162145326) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                          |Z $ {} (:at 1650162146287) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650162192362) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                              |b $ {} (:at 1650162152138) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650162153589) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                                  |b $ {} (:at 1650162156530) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                          |l $ {} (:at 1649849457353) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649849461960) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                              |b $ {} (:at 1649849463825) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                              |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                                  |X $ {} (:at 1649999996386) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649999996969) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649999997893) (:by |rJG4IHzWf) (:text |nil?) (:type :leaf)
                                          |b $ {} (:at 1649999998622) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649999999746) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |b $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                          |b $ {} (:at 1649830067759) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |wrap-leaf) (:type :leaf)
                                          |b $ {} (:at 1649830115034) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                          |h $ {} (:at 1649830074849) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649830075296) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |l $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |o $ {} (:at 1649830100257) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                  |h $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                          |b $ {} (:at 1649830112557) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
                                          |b $ {} (:at 1649830116187) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                          |h $ {} (:at 1649830077161) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649830077161) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |l $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |o $ {} (:at 1650198276604) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                  |l $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |with-linear?) (:type :leaf)
                                          |b $ {} (:at 1649830129488) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |wrap-expr-with-linear) (:type :leaf)
                                          |b $ {} (:at 1649830118251) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                          |h $ {} (:at 1649830078002) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649830078002) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |l $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |o $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                          |q $ {} (:at 1650198166949) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                  |o $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                      |b $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |wrap-block-expr) (:type :leaf)
                                          |b $ {} (:at 1649830120112) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                          |h $ {} (:at 1649830079788) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649830079788) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |l $ {} (:at 1649830055493) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                      |b $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649789234452) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                          |T $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |comp-hint) (:type :leaf)
                          |b $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |>>) (:type :leaf)
                              |b $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                              |h $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |:hint) (:type :leaf)
                          |h $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                          |l $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                              |b $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                              |h $ {} (:at 1649398510351) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
          |comp-error $ {} (:at 1649175431513) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649175433007) (:by |rJG4IHzWf) (:text |defcomp) (:type :leaf)
              |b $ {} (:at 1649175431513) (:by |rJG4IHzWf) (:text |comp-error) (:type :leaf)
              |h $ {} (:at 1649175431513) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649175431513) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
              |l $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                  |b $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                          |b $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                              |b $ {} (:at 1649175451436) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                              |h $ {} (:at 1649175452093) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |h $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                          |b $ {} (:at 1649177203432) (:by |rJG4IHzWf) (:text |10) (:type :leaf)
                      |o $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649175448192) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                          |b $ {} (:at 1649175457688) (:by |rJG4IHzWf) (:text |0xff0000) (:type :leaf)
                  |h $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |text) (:type :leaf)
                      |b $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |:text) (:type :leaf)
                              |b $ {} (:at 1649175525800) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649177180510) (:by |rJG4IHzWf) (:text |format-cirru-edn) (:type :leaf)
                                  |b $ {} (:at 1649175527736) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                          |h $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                              |b $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649175471081) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                  |h $ {} (:at 1649175472135) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |l $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                              |b $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                      |b $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text ||red) (:type :leaf)
                                  |h $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |:font-size) (:type :leaf)
                                      |b $ {} (:at 1649177196115) (:by |rJG4IHzWf) (:text |10) (:type :leaf)
                                  |l $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175464988) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                      |b $ {} (:at 1649177191464) (:by |rJG4IHzWf) (:text "||Roboto Mono") (:type :leaf)
          |comp-hint $ {} (:at 1649397942834) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649397942834) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649397942834) (:by |rJG4IHzWf) (:text |comp-hint) (:type :leaf)
              |h $ {} (:at 1649397942834) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |H $ {} (:at 1649397945980) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                  |b $ {} (:at 1649397942834) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                  |h $ {} (:at 1649397948000) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
              |l $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649398015370) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1649398015643) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649398015791) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649398022109) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                          |b $ {} (:at 1649398022293) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649398024468) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                              |b $ {} (:at 1649398025180) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                      |b $ {} (:at 1649398025833) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649398027677) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                          |b $ {} (:at 1649398027939) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649398029351) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |b $ {} (:at 1649398029900) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398031058) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                                  |b $ {} (:at 1649398032296) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                              |h $ {} (:at 1649398032740) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398033528) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1649398033810) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649398062154) (:by |rJG4IHzWf) (:text |:p1) (:type :leaf)
                                      |b $ {} (:at 1649398036588) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398036861) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649398049183) (:by |rJG4IHzWf) (:text |400) (:type :leaf)
                                          |h $ {} (:at 1649398045813) (:by |rJG4IHzWf) (:text |-100) (:type :leaf)
                  |T $ {} (:at 1649398104735) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649398105830) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                      |L $ {} (:at 1649398106116) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649398106414) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |comp-drag-point) (:type :leaf)
                          |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |>>) (:type :leaf)
                              |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |states) (:type :leaf)
                              |h $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |:p1) (:type :leaf)
                          |h $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |X $ {} (:at 1649398214540) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398217053) (:by |rJG4IHzWf) (:text |:hide-text?) (:type :leaf)
                                  |b $ {} (:at 1649398217566) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                              |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                  |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649398060704) (:by |rJG4IHzWf) (:text |:p1) (:type :leaf)
                                      |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                              |c $ {} (:at 1649398462849) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398464316) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                                  |b $ {} (:at 1649398533901) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                              |e $ {} (:at 1649398425249) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398447115) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                  |b $ {} (:at 1649398426375) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649398426860) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                      |b $ {} (:at 1649398433581) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
                                      |h $ {} (:at 1649398435295) (:by |rJG4IHzWf) (:text |90) (:type :leaf)
                                      |l $ {} (:at 1649398461193) (:by |rJG4IHzWf) (:text |44) (:type :leaf)
                              |h $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |:on-change) (:type :leaf)
                                  |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                      |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |position) (:type :leaf)
                                          |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                      |h $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                          |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |cursor) (:type :leaf)
                                          |h $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                              |b $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                              |h $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |:p1) (:type :leaf)
                                              |l $ {} (:at 1649398006209) (:by |rJG4IHzWf) (:text |position) (:type :leaf)
                      |b $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |text) (:type :leaf)
                          |b $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |:text) (:type :leaf)
                                  |b $ {} (:at 1649412907532) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649412911814) (:by |rJG4IHzWf) (:text |.!slice) (:type :leaf)
                                      |T $ {} (:at 1649398271087) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649403156658) (:by |rJG4IHzWf) (:text |format-to-lisp) (:type :leaf)
                                          |b $ {} (:at 1649398293157) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649398302256) (:by |rJG4IHzWf) (:text |turn-quoted) (:type :leaf)
                                              |T $ {} (:at 1649398276090) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                      |b $ {} (:at 1649412913478) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                      |h $ {} (:at 1649412943077) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                              |h $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                  |b $ {} (:at 1649398191272) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649398249227) (:by |rJG4IHzWf) (:text |complex/add) (:type :leaf)
                                      |T $ {} (:at 1649398116481) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398118280) (:by |rJG4IHzWf) (:text |:p1) (:type :leaf)
                                          |b $ {} (:at 1649398119597) (:by |rJG4IHzWf) (:text |state) (:type :leaf)
                                      |b $ {} (:at 1649398195297) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398197050) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649398482897) (:by |rJG4IHzWf) (:text |12) (:type :leaf)
                                          |h $ {} (:at 1649398480668) (:by |rJG4IHzWf) (:text |-6) (:type :leaf)
                              |l $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                  |b $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                          |b $ {} (:at 1649398349237) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649398350628) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                              |b $ {} (:at 1649398364199) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                                              |h $ {} (:at 1649398361764) (:by |rJG4IHzWf) (:text |40) (:type :leaf)
                                              |l $ {} (:at 1649398354279) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                                      |h $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |:font-size) (:type :leaf)
                                          |b $ {} (:at 1649398347361) (:by |rJG4IHzWf) (:text |10) (:type :leaf)
                                      |l $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649398108224) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                          |b $ {} (:at 1649398340073) (:by |rJG4IHzWf) (:text "||Roboto Mono, manospace") (:type :leaf)
          |head-in-list $ {} (:at 1649481202589) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649481202589) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649481202589) (:by |rJG4IHzWf) (:text |head-in-list) (:type :leaf)
              |h $ {} (:at 1649481202589) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649481205099) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
              |l $ {} (:at 1649481230183) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649481237963) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |T $ {} (:at 1649481238426) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649481239280) (:by |rJG4IHzWf) (:text |some?) (:type :leaf)
                      |T $ {} (:at 1649481206026) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649481229180) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                          |b $ {} (:at 1649481229549) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                  |b $ {} (:at 1649481241502) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649481242204) (:by |rJG4IHzWf) (:text |list?) (:type :leaf)
                      |b $ {} (:at 1649481247474) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649481247474) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                          |b $ {} (:at 1649481247474) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                  |h $ {} (:at 1649481248906) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
          |is-linear? $ {} (:at 1649172214761) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649172214761) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649172214761) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
              |h $ {} (:at 1649172214761) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649172214761) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
              |l $ {} (:at 1649173091571) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649173092351) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                  |b $ {} (:at 1649173097092) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |b $ {} (:at 1649173097092) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173097092) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                          |b $ {} (:at 1649173097092) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |h $ {} (:at 1649173097092) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                  |h $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |b $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                          |b $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                          |h $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                              |b $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |h $ {} (:at 1649173192284) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649173192907) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |L $ {} (:at 1649173193301) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173193465) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173193991) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                  |b $ {} (:at 1649173196541) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173196541) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                      |b $ {} (:at 1649173196541) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                          |T $ {} (:at 1649173201008) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649173201471) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |L $ {} (:at 1649173202333) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173202595) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                  |b $ {} (:at 1649173203246) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                              |P $ {} (:at 1649173205256) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                              |T $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173101755) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                  |b $ {} (:at 1649173200554) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                  |l $ {} (:at 1649173108915) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649173109645) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                      |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |b $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                  |b $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                      |b $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                          |h $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                  |b $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                              |h $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                  |b $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                      |b $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                              |l $ {} (:at 1649173108426) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
          |on-expr-click $ {} (:at 1649998839659) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649998839659) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649998839659) (:by |rJG4IHzWf) (:text |on-expr-click) (:type :leaf)
              |h $ {} (:at 1649998839659) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649998926262) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                  |V $ {} (:at 1649998951501) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                  |X $ {} (:at 1649998945523) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                  |b $ {} (:at 1649998926867) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
              |l $ {} (:at 1650000027174) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1650000027925) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1650000028395) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650000029128) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650000029979) (:by |rJG4IHzWf) (:text |event) (:type :leaf)
                          |b $ {} (:at 1650000033214) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650000033214) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                              |b $ {} (:at 1650000033214) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                              |h $ {} (:at 1650000033214) (:by |rJG4IHzWf) (:text |.-data) (:type :leaf)
                              |l $ {} (:at 1650000033214) (:by |rJG4IHzWf) (:text |.-originalEvent) (:type :leaf)
                  |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                      |a $ {} (:at 1650000036380) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650000036969) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                          |b $ {} (:at 1650000037272) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650000037657) (:by |rJG4IHzWf) (:text |.-metaKey) (:type :leaf)
                              |b $ {} (:at 1650000039672) (:by |rJG4IHzWf) (:text |event) (:type :leaf)
                          |h $ {} (:at 1650000037272) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650000044058) (:by |rJG4IHzWf) (:text |.-ctrlKey) (:type :leaf)
                              |b $ {} (:at 1650000039672) (:by |rJG4IHzWf) (:text |event) (:type :leaf)
                      |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |prompt-at!) (:type :leaf)
                          |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |&let) (:type :leaf)
                              |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |pos) (:type :leaf)
                                  |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                      |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                      |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |.-data) (:type :leaf)
                                      |l $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |.-global) (:type :leaf)
                              |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |.-x) (:type :leaf)
                                      |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |pos) (:type :leaf)
                                  |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |.-y) (:type :leaf)
                                      |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |pos) (:type :leaf)
                          |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |X $ {} (:at 1649998990721) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649998993681) (:by |rJG4IHzWf) (:text |:textarea?) (:type :leaf)
                                  |b $ {} (:at 1649998994283) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                              |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |:initial) (:type :leaf)
                                  |b $ {} (:at 1649998973228) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649999012026) (:by |rJG4IHzWf) (:text |format-cirru) (:type :leaf)
                                      |b $ {} (:at 1649999028114) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649999028693) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |T $ {} (:at 1649998982994) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                              |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                  |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                          |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |code-font) (:type :leaf)
                          |l $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                              |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                              |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                  |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |:cirru-edit-node) (:type :leaf)
                                  |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                      |h $ {} (:at 1649999486411) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649999488226) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                          |T $ {} (:at 1649999478542) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649999485176) (:by |rJG4IHzWf) (:text |parse-cirru) (:type :leaf)
                                              |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                      |l $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |b $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                          |h $ {} (:at 1649998841218) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
          |pattern-number $ {} (:at 1649336377519) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649336377519) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649336377519) (:by |rJG4IHzWf) (:text |pattern-number) (:type :leaf)
              |h $ {} (:at 1649336377519) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649336379371) (:by |rJG4IHzWf) (:text |new) (:type :leaf)
                  |b $ {} (:at 1649336383080) (:by |rJG4IHzWf) (:text |js/RegExp) (:type :leaf)
                  |h $ {} (:at 1649404668264) (:by |rJG4IHzWf) (:text "|\"^-?\\d+(\\.\\d+)?$") (:type :leaf)
          |pick-leaf-color $ {} (:at 1649335566813) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649335566813) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649335566813) (:by |rJG4IHzWf) (:text |pick-leaf-color) (:type :leaf)
              |h $ {} (:at 1649335566813) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649335566813) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                  |b $ {} (:at 1649335937158) (:by |rJG4IHzWf) (:text |head?) (:type :leaf)
              |l $ {} (:at 1649335569513) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649335573655) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                  |b $ {} (:at 1649335587238) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649335573942) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649336243109) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                          |T $ {} (:at 1649335575089) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649335574045) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649335575989) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                              |h $ {} (:at 1649335577740) (:by |rJG4IHzWf) (:text "|\"true") (:type :leaf)
                          |b $ {} (:at 1649335575089) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649335574045) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649335575989) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                              |h $ {} (:at 1649335585342) (:by |rJG4IHzWf) (:text "|\"false") (:type :leaf)
                          |h $ {} (:at 1649335575089) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649335574045) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649335575989) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                              |h $ {} (:at 1649336079113) (:by |rJG4IHzWf) (:text "|\"nil") (:type :leaf)
                          |l $ {} (:at 1649335575089) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649335574045) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649335575989) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                              |h $ {} (:at 1649336202702) (:by |rJG4IHzWf) (:text "|\";") (:type :leaf)
                      |b $ {} (:at 1649335588160) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335588160) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1649335592489) (:by |rJG4IHzWf) (:text |300) (:type :leaf)
                          |h $ {} (:at 1649335595219) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                          |l $ {} (:at 1649336249968) (:by |rJG4IHzWf) (:text |30) (:type :leaf)
                  |c $ {} (:at 1650213895225) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650213900874) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650213901143) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                          |b $ {} (:at 1650213902331) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                          |h $ {} (:at 1650213905278) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                      |b $ {} (:at 1650213906933) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650213906933) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1650213906933) (:by |rJG4IHzWf) (:text |190) (:type :leaf)
                          |h $ {} (:at 1650213906933) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                          |l $ {} (:at 1650213906933) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                  |e $ {} (:at 1649335607681) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649335611317) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335611452) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                          |b $ {} (:at 1649335637855) (:by |rJG4IHzWf) (:text "|\"\"") (:type :leaf)
                          |h $ {} (:at 1649335615640) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649335618445) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                              |b $ {} (:at 1649335618956) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                              |h $ {} (:at 1649335619721) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |b $ {} (:at 1649335627457) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335627457) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1649335629661) (:by |rJG4IHzWf) (:text |70) (:type :leaf)
                          |h $ {} (:at 1649336174007) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                          |l $ {} (:at 1649336178594) (:by |rJG4IHzWf) (:text |40) (:type :leaf)
                  |eT $ {} (:at 1649335607681) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649335611317) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335611452) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                          |b $ {} (:at 1650213850139) (:by |rJG4IHzWf) (:text "|\"|") (:type :leaf)
                          |h $ {} (:at 1649335615640) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650213867627) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                              |b $ {} (:at 1649335618956) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                              |h $ {} (:at 1649335619721) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |b $ {} (:at 1649335627457) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335627457) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1649335629661) (:by |rJG4IHzWf) (:text |70) (:type :leaf)
                          |h $ {} (:at 1649336174007) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                          |l $ {} (:at 1649336178594) (:by |rJG4IHzWf) (:text |40) (:type :leaf)
                  |f $ {} (:at 1649335607681) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649335611317) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335611452) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                          |b $ {} (:at 1649335666233) (:by |rJG4IHzWf) (:text "|\":") (:type :leaf)
                          |h $ {} (:at 1649335615640) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650213870068) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                              |b $ {} (:at 1649335618956) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                              |h $ {} (:at 1649335619721) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |b $ {} (:at 1649335627457) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335627457) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1649335669746) (:by |rJG4IHzWf) (:text |240) (:type :leaf)
                          |h $ {} (:at 1649335884963) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                          |l $ {} (:at 1649335868872) (:by |rJG4IHzWf) (:text |74) (:type :leaf)
                  |fT $ {} (:at 1649336360032) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649336361648) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649336367095) (:by |rJG4IHzWf) (:text |.!test) (:type :leaf)
                          |b $ {} (:at 1649336376781) (:by |rJG4IHzWf) (:text |pattern-number) (:type :leaf)
                          |h $ {} (:at 1649336406603) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                      |b $ {} (:at 1649336410957) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649336410957) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1649336430177) (:by |rJG4IHzWf) (:text |340) (:type :leaf)
                          |h $ {} (:at 1649336410957) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                          |l $ {} (:at 1649336410957) (:by |rJG4IHzWf) (:text |30) (:type :leaf)
                  |g $ {} (:at 1649335940583) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649335942939) (:by |rJG4IHzWf) (:text |head?) (:type :leaf)
                      |b $ {} (:at 1649335946050) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335946050) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1649336040324) (:by |rJG4IHzWf) (:text |160) (:type :leaf)
                          |h $ {} (:at 1649336029365) (:by |rJG4IHzWf) (:text |70) (:type :leaf)
                          |l $ {} (:at 1649336052337) (:by |rJG4IHzWf) (:text |76) (:type :leaf)
                  |h $ {} (:at 1649335587238) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |H $ {} (:at 1649335604517) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                      |b $ {} (:at 1649335600224) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649335600224) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1649336023773) (:by |rJG4IHzWf) (:text |190) (:type :leaf)
                          |h $ {} (:at 1649335600224) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                          |l $ {} (:at 1649336000974) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
          |shape-focus $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |shape-focus) (:type :leaf)
              |h $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                  |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                          |b $ {} (:at 1650211884688) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650211887183) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                              |b $ {} (:at 1650211887577) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                              |h $ {} (:at 1650211888572) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                      |h $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                          |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                              |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                              |h $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |l $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |:line-style) (:type :leaf)
                          |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                  |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                              |h $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                  |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                      |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
                                      |h $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                      |l $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                              |l $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                  |b $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |0.8) (:type :leaf)
          |style-active-line $ {} (:at 1650208279402) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650208279402) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1650208279402) (:by |rJG4IHzWf) (:text |style-active-line) (:type :leaf)
              |h $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                      |b $ {} (:at 1650209235513) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                  |h $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                      |b $ {} (:at 1650209234457) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                  |l $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                      |b $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                          |h $ {} (:at 1650208280638) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                          |l $ {} (:at 1650209373512) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
          |style-shadow-line $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |style-shadow-line) (:type :leaf)
              |h $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                      |b $ {} (:at 1650209354883) (:by |rJG4IHzWf) (:text |0.5) (:type :leaf)
                  |h $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                      |b $ {} (:at 1650209324921) (:by |rJG4IHzWf) (:text |0.8) (:type :leaf)
                  |l $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                      |b $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                          |b $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                          |h $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                          |l $ {} (:at 1650209358612) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
          |turn-quoted $ {} (:at 1649398306590) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649398306590) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649398306590) (:by |rJG4IHzWf) (:text |turn-quoted) (:type :leaf)
              |h $ {} (:at 1649398306590) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649398306590) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
              |l $ {} (:at 1649398308187) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649398308676) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |b $ {} (:at 1649398309023) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649398310583) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                      |b $ {} (:at 1649398311937) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                  |h $ {} (:at 1649398312563) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649398314490) (:by |rJG4IHzWf) (:text |turn-symbol) (:type :leaf)
                      |b $ {} (:at 1649398316884) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                  |l $ {} (:at 1649398322160) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649398322523) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                      |b $ {} (:at 1649398324629) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                      |h $ {} (:at 1649398326810) (:by |rJG4IHzWf) (:text |turn-quoted) (:type :leaf)
          |with-linear? $ {} (:at 1649172374138) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649172374138) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649172604780) (:by |rJG4IHzWf) (:text |with-linear?) (:type :leaf)
              |h $ {} (:at 1649172374138) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649172374138) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
              |l $ {} (:at 1649172770060) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649172771069) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                  |T $ {} (:at 1649172375641) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |b $ {} (:at 1649172376707) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172377693) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                          |b $ {} (:at 1649172378400) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |h $ {} (:at 1649172380227) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                  |b $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |b $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                          |b $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                          |h $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                              |b $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |h $ {} (:at 1649172802396) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                  |h $ {} (:at 1649172808649) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649172809697) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                      |T $ {} (:at 1649172966504) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649172967065) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |L $ {} (:at 1649172967420) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649172967582) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649172968432) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                  |b $ {} (:at 1649172968891) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172968891) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                      |b $ {} (:at 1649172968891) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                          |T $ {} (:at 1649172960081) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649172960581) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |L $ {} (:at 1649172960805) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649172962113) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                  |b $ {} (:at 1649172963057) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                              |P $ {} (:at 1649179049013) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649179049013) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                  |b $ {} (:at 1649179049013) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649179049013) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                      |b $ {} (:at 1649179049013) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                              |T $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                      |b $ {} (:at 1649172958947) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                  |h $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                      |b $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                          |b $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                  |l $ {} (:at 1649172807318) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
          |wrap-block-expr $ {} (:at 1649093101836) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649093101836) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649173351426) (:by |rJG4IHzWf) (:text |wrap-block-expr) (:type :leaf)
              |h $ {} (:at 1649093101836) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649093130919) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                  |b $ {} (:at 1649236129658) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                  |h $ {} (:at 1649236560444) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
              |l $ {} (:at 1649094110705) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |H $ {} (:at 1649172077353) (:by |rJG4IHzWf) (:text |loop) (:type :leaf)
                  |R $ {} (:at 1649172077684) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649172077814) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172078337) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                          |b $ {} (:at 1649172080385) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649172080385) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                      |b $ {} (:at 1649172081652) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172082092) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                          |b $ {} (:at 1649172084019) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |h $ {} (:at 1649172084899) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172086373) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                          |b $ {} (:at 1649172086823) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |l $ {} (:at 1649172088187) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649229390526) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                          |b $ {} (:at 1649172090572) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |o $ {} (:at 1649172092012) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172092672) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                          |b $ {} (:at 1649172092924) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |q $ {} (:at 1649473271565) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649473274361) (:by |rJG4IHzWf) (:text |prev-width) (:type :leaf)
                          |b $ {} (:at 1649473275135) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |s $ {} (:at 1649478528100) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649478533430) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                          |b $ {} (:at 1649478535191) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |t $ {} (:at 1649479452394) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649479458665) (:by |rJG4IHzWf) (:text |prev-leaf?) (:type :leaf)
                          |b $ {} (:at 1649479460496) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                      |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                              |b $ {} (:at 1650208342305) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1650208343022) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                  |L $ {} (:at 1650208344803) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650208344959) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650208346159) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                          |b $ {} (:at 1650208348366) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650208348366) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                              |b $ {} (:at 1650208348366) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                              |h $ {} (:at 1650208348366) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |polyline) (:type :leaf)
                                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                  |b $ {} (:at 1650208355146) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1650208355815) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                      |L $ {} (:at 1650208356213) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                      |P $ {} (:at 1650208361296) (:by |rJG4IHzWf) (:text |style-active-line) (:type :leaf)
                                                      |T $ {} (:at 1650208186814) (:by |rJG4IHzWf) (:text |style-shadow-line) (:type :leaf)
                                              |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649230665904) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |l $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:points) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |X $ {} (:at 1649230675430) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649230675430) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1649230675430) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |h $ {} (:at 1649230675430) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1650213584060) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                                          |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1650213584849) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                                          |h $ {} (:at 1649229505588) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649229506011) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                              |b $ {} (:at 1649229507690) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                                              |h $ {} (:at 1649256216332) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |D $ {} (:at 1649256219098) (:by |rJG4IHzWf) (:text |&max) (:type :leaf)
                                                                  |L $ {} (:at 1649256221244) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |T $ {} (:at 1649230336307) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1649230337155) (:by |rJG4IHzWf) (:text |dec) (:type :leaf)
                                                                      |T $ {} (:at 1649229509554) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                      |l $ {} (:at 1650209854876) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |X $ {} (:at 1649181886038) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649181886038) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                                                  |b $ {} (:at 1650211867281) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649181850673) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649184756206) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |l $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                      |b $ {} (:at 1650212826015) (:by |rJG4IHzWf) (:text |120) (:type :leaf)
                                                      |h $ {} (:at 1650212851716) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                                                      |l $ {} (:at 1650212861286) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                              |o $ {} (:at 1649236187675) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649236188261) (:by |rJG4IHzWf) (:text |:on) (:type :leaf)
                                                  |b $ {} (:at 1649236188966) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236189374) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                      |b $ {} (:at 1649236189957) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649236192565) (:by |rJG4IHzWf) (:text |:pointertap) (:type :leaf)
                                                          |b $ {} (:at 1649236197772) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649236198021) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                              |b $ {} (:at 1649236199349) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649236200348) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                  |b $ {} (:at 1649236200854) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                              |h $ {} (:at 1649998861479) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649998861479) (:by |rJG4IHzWf) (:text |on-expr-click) (:type :leaf)
                                                                  |b $ {} (:at 1649998861479) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                  |c $ {} (:at 1649998963733) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                                  |e $ {} (:at 1649998939388) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                                                  |h $ {} (:at 1649998861479) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                      |m $ {} (:at 1649236630869) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649236631325) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |a $ {} (:at 1650208351532) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                          |h $ {} (:at 1649236711623) (:by |rJG4IHzWf) (:text |shape-focus) (:type :leaf)
                                      |o $ {} (:at 1649181882954) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649181882954) (:by |rJG4IHzWf) (:text |create-list) (:type :leaf)
                                          |b $ {} (:at 1649181882954) (:by |rJG4IHzWf) (:text |:container) (:type :leaf)
                                          |h $ {} (:at 1649181882954) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649181882954) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |l $ {} (:at 1649181882954) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                          |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                          |l $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649229396455) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                              |b $ {} (:at 1649229399434) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                          |o $ {} (:at 1649478789726) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649478791852) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                              |b $ {} (:at 1649478790572) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                      |l $ {} (:at 1649479563497) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649479564151) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                          |L $ {} (:at 1649479569587) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649479572144) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                              |b $ {} (:at 1649479581442) (:by |rJG4IHzWf) (:text |prev-leaf?) (:type :leaf)
                              |h $ {} (:at 1649479582561) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649479584667) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                  |b $ {} (:at 1649479613480) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479613040) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                      |b $ {} (:at 1649479615591) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                          |P $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                          |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                  |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                          |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                          |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                  |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |b $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:text |wrap-leaf) (:type :leaf)
                                          |b $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                          |h $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                          |l $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |o $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                              |b $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                              |h $ {} (:at 1649479628880) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                  |l $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                          |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                  |o $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                          |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                  |s $ {} (:at 1649479988183) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479990002) (:by |rJG4IHzWf) (:text |offset) (:type :leaf)
                                      |b $ {} (:at 1649479991482) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479991482) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                          |b $ {} (:at 1649479991482) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                          |h $ {} (:at 1649479991482) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                              |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                  |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                      |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                              |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                  |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |a $ {} (:at 1649480016787) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1649480017911) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                                              |L $ {} (:at 1650213588028) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                                              |V $ {} (:at 1649959661843) (:by |rJG4IHzWf) (:text |offset) (:type :leaf)
                                                          |h $ {} (:at 1649481020030) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649481020030) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                              |b $ {} (:at 1649481054705) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |D $ {} (:at 1649481055668) (:by |rJG4IHzWf) (:text |dec) (:type :leaf)
                                                                  |T $ {} (:at 1649481022147) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                                              |h $ {} (:at 1649481020030) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                              |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                  |l $ {} (:at 1649479978159) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649479993963) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                      |T $ {} (:at 1649479979202) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                      |b $ {} (:at 1649959657714) (:by |rJG4IHzWf) (:text |offset) (:type :leaf)
                                  |n $ {} (:at 1649480045312) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                  |q $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                  |s $ {} (:at 1649479997851) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649479999392) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                      |b $ {} (:at 1649959655437) (:by |rJG4IHzWf) (:text |offset) (:type :leaf)
                                  |t $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                          |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                      |h $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                                          |b $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |l $ {} (:at 1649479590429) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                                  |u $ {} (:at 1649479596454) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                  |X $ {} (:at 1649236241385) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649236247220) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                      |b $ {} (:at 1649236248038) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649236248553) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                          |b $ {} (:at 1649236249384) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                          |h $ {} (:at 1649236250765) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |wrap-leaf) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |h $ {} (:at 1649236254677) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |l $ {} (:at 1649236566383) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |o $ {} (:at 1649335986041) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649335986618) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                      |b $ {} (:at 1649335987374) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                      |h $ {} (:at 1649335987896) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173449341) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173416822) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |h $ {} (:at 1649236255523) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |l $ {} (:at 1649236567219) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |o $ {} (:at 1650198243477) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                          |k $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650213192612) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1650213193263) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649173593820) (:by |rJG4IHzWf) (:text |with-linear?) (:type :leaf)
                                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |b $ {} (:at 1650213196908) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650213197322) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                                      |b $ {} (:at 1650213198250) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650213202664) (:by |rJG4IHzWf) (:text |all-block?) (:type :leaf)
                                                          |b $ {} (:at 1650213203553) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173602315) (:by |rJG4IHzWf) (:text |wrap-expr-with-linear) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |h $ {} (:at 1649236256578) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |l $ {} (:at 1649236568152) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |o $ {} (:at 1649472529814) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                                  |q $ {} (:at 1650198174805) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                          |o $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173377215) (:by |rJG4IHzWf) (:text |wrap-block-expr) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |h $ {} (:at 1649236257560) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |l $ {} (:at 1649236569135) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                  |o $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                  |q $ {} (:at 1649472413878) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649472419250) (:by |rJG4IHzWf) (:text |next-y-stack) (:type :leaf)
                                      |b $ {} (:at 1649472421848) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649472421848) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |b $ {} (:at 1649477905573) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649477906250) (:by |rJG4IHzWf) (:text |some?) (:type :leaf)
                                              |b $ {} (:at 1649477908204) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649477908204) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                                                  |b $ {} (:at 1649477908204) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |h $ {} (:at 1649473529003) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649473529624) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                              |L $ {} (:at 1649473530404) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649473530404) (:by |rJG4IHzWf) (:text |>) (:type :leaf)
                                                  |b $ {} (:at 1649473788532) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649473790082) (:by |rJG4IHzWf) (:text |either) (:type :leaf)
                                                      |T $ {} (:at 1649473530404) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649473530404) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                                                          |b $ {} (:at 1649473530404) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                                      |b $ {} (:at 1649473790829) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                  |h $ {} (:at 1649473590772) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649473591332) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                                      |L $ {} (:at 1650213591305) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                                      |T $ {} (:at 1649473643447) (:by |rJG4IHzWf) (:text |prev-width) (:type :leaf)
                                              |P $ {} (:at 1649473550053) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                              |Y $ {} (:at 1649473579714) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1649473580652) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                                  |T $ {} (:at 1649473573509) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                          |l $ {} (:at 1649472421848) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                              |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                      |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                              |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                  |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1650213592742) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                                          |h $ {} (:at 1649229406031) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649229406765) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                              |b $ {} (:at 1649472424362) (:by |rJG4IHzWf) (:text |next-y-stack) (:type :leaf)
                                                              |h $ {} (:at 1649229413826) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                              |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                              |l $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1649481520451) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                                                  |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |text) (:type :leaf)
                                                  |b $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                      |b $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |:text) (:type :leaf)
                                                          |b $ {} (:at 1649475681767) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1649475682850) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                              |T $ {} (:at 1649475680366) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649475729725) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1649475732897) (:by |rJG4IHzWf) (:text |prev-width) (:type :leaf)
                                                                  |h $ {} (:at 1649475751341) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649475757850) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                                                                      |b $ {} (:at 1649475758683) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                                                  |l $ {} (:at 1649478637775) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |L $ {} (:at 1649481338380) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                                                                      |T $ {} (:at 1649478206341) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                                      |h $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                          |b $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                              |b $ {} (:at 1649475709933) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                              |h $ {} (:at 1649478677578) (:by |rJG4IHzWf) (:text |-8) (:type :leaf)
                                                      |j $ {} (:at 1649476383131) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649476391935) (:by |rJG4IHzWf) (:text |:rotation) (:type :leaf)
                                                          |b $ {} (:at 1649478658828) (:by |rJG4IHzWf) (:text |-0.4) (:type :leaf)
                                                      |l $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                          |b $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                                  |b $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text ||red) (:type :leaf)
                                                              |h $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |:font-size) (:type :leaf)
                                                                  |b $ {} (:at 1649475705317) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                                                              |l $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649475671281) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                                                  |b $ {} (:at 1649475700553) (:by |rJG4IHzWf) (:text "||Source Code Pro, monospace") (:type :leaf)
                                  |h $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                  |k $ {} (:at 1649960282640) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                  |n $ {} (:at 1649229420725) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649229569713) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                      |b $ {} (:at 1649472427734) (:by |rJG4IHzWf) (:text |next-y-stack) (:type :leaf)
                                      |h $ {} (:at 1649229570967) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649229601507) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                                          |b $ {} (:at 1649229575967) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                  |q $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                      |b $ {} (:at 1649172099288) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                  |s $ {} (:at 1649473299020) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                  |t $ {} (:at 1649478750206) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649478750823) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |L $ {} (:at 1649478751847) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649478753525) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                          |b $ {} (:at 1649478753765) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |h $ {} (:at 1649478756467) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                      |P $ {} (:at 1649478759486) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649478759486) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                                          |b $ {} (:at 1649478759486) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |T $ {} (:at 1649478570118) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                                  |u $ {} (:at 1649479527479) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649479527479) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                      |b $ {} (:at 1649479527479) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
          |wrap-expr-with-linear $ {} (:at 1649173628664) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649173628664) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649173628664) (:by |rJG4IHzWf) (:text |wrap-expr-with-linear) (:type :leaf)
              |h $ {} (:at 1649173628664) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649173654635) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                  |b $ {} (:at 1649236263880) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                  |h $ {} (:at 1649236615869) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                  |l $ {} (:at 1649472771377) (:by |rJG4IHzWf) (:text |parent-winding-okay?) (:type :leaf)
                  |o $ {} (:at 1650198124660) (:by |rJG4IHzWf) (:text |smaller?) (:type :leaf)
              |l $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |loop) (:type :leaf)
                  |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                      |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |h $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                          |b $ {} (:at 1650213628614) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                      |m $ {} (:at 1649174544246) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649229199550) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                          |b $ {} (:at 1649229200584) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                      |o $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |q $ {} (:at 1649472773870) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649472781952) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                          |b $ {} (:at 1649472778829) (:by |rJG4IHzWf) (:text |parent-winding-okay?) (:type :leaf)
                      |s $ {} (:at 1649473388484) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649473393647) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                          |b $ {} (:at 1649473744593) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |h $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                      |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                      |h $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                              |b $ {} (:at 1650208252034) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1650208252939) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                  |L $ {} (:at 1650208253396) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650208254737) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650208255814) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                          |b $ {} (:at 1650208261751) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650208261751) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                              |b $ {} (:at 1650208261751) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                              |h $ {} (:at 1650208261751) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                      |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |h $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |polyline) (:type :leaf)
                                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                  |b $ {} (:at 1650208268657) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1650208269338) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                      |L $ {} (:at 1650208271282) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                      |P $ {} (:at 1650208275568) (:by |rJG4IHzWf) (:text |style-active-line) (:type :leaf)
                                                      |T $ {} (:at 1650208233600) (:by |rJG4IHzWf) (:text |style-shadow-line) (:type :leaf)
                                              |g $ {} (:at 1649228047071) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649228048696) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                  |b $ {} (:at 1649228049485) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649228052111) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649228052444) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649228052715) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |l $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |:points) (:type :leaf)
                                                  |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |h $ {} (:at 1649184577468) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1649960007397) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                          |h $ {} (:at 1649184579074) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                      |l $ {} (:at 1650209869598) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1650209870132) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |L $ {} (:at 1650209870950) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650209871260) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                              |b $ {} (:at 1650209873791) (:by |rJG4IHzWf) (:text |smaller?) (:type :leaf)
                                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                                              |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                  |X $ {} (:at 1649182313251) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649182313251) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                                                      |b $ {} (:at 1650211896481) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                                                  |e $ {} (:at 1649228056306) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649228056306) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                      |b $ {} (:at 1649228056306) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649228056306) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1649228056306) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |h $ {} (:at 1649228056306) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                  |l $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                      |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                          |b $ {} (:at 1650212793509) (:by |rJG4IHzWf) (:text |10) (:type :leaf)
                                                          |h $ {} (:at 1650212805157) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
                                                          |l $ {} (:at 1650212802672) (:by |rJG4IHzWf) (:text |50) (:type :leaf)
                                                  |o $ {} (:at 1649236267453) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236269060) (:by |rJG4IHzWf) (:text |:on) (:type :leaf)
                                                      |b $ {} (:at 1649236269500) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649236271134) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649236271428) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649236274867) (:by |rJG4IHzWf) (:text |:pointertap) (:type :leaf)
                                                              |b $ {} (:at 1649236275428) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649236275638) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                  |b $ {} (:at 1649236275893) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649236277004) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                      |b $ {} (:at 1649236277551) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                  |h $ {} (:at 1649998871545) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649998871545) (:by |rJG4IHzWf) (:text |on-expr-click) (:type :leaf)
                                                                      |b $ {} (:at 1649998871545) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                      |c $ {} (:at 1649998958215) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                                      |e $ {} (:at 1649998942531) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                                                      |h $ {} (:at 1649998871545) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                      |m $ {} (:at 1649236733321) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649236733321) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |b $ {} (:at 1650198383298) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1650198384023) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                              |H $ {} (:at 1650208264826) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                              |L $ {} (:at 1650198385866) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650198386385) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                                  |b $ {} (:at 1650198388740) (:by |rJG4IHzWf) (:text |smaller?) (:type :leaf)
                                          |h $ {} (:at 1649236733321) (:by |rJG4IHzWf) (:text |shape-focus) (:type :leaf)
                                      |o $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |create-list) (:type :leaf)
                                          |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |:container) (:type :leaf)
                                          |h $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |l $ {} (:at 1649243392104) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649243393604) (:by |rJG4IHzWf) (:text |reverse) (:type :leaf)
                                              |T $ {} (:at 1649243156504) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                          |h $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                              |b $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                          |l $ {} (:at 1649173630885) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649229132073) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                              |b $ {} (:at 1649229134782) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                          |o $ {} (:at 1649473403176) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649473403784) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                              |b $ {} (:at 1649473405197) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                      |l $ {} (:at 1649175211589) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649175212350) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |L $ {} (:at 1649175215021) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649175214340) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649175214340) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                  |b $ {} (:at 1649175214340) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175214340) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                      |b $ {} (:at 1649175214340) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                              |b $ {} (:at 1649236289421) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649236291782) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                  |b $ {} (:at 1649236292042) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649236293972) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                      |b $ {} (:at 1649236294859) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                      |h $ {} (:at 1649236296471) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                          |P $ {} (:at 1649175216009) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649175217178) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                              |b $ {} (:at 1649175224556) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649175217709) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175220146) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                      |b $ {} (:at 1649175220808) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                              |b $ {} (:at 1649175233410) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175233410) (:by |rJG4IHzWf) (:text |wrap-leaf) (:type :leaf)
                                                  |b $ {} (:at 1649175233410) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |h $ {} (:at 1649236305635) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |l $ {} (:at 1649236578645) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |o $ {} (:at 1649335911005) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649335911076) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                      |b $ {} (:at 1649335912127) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                      |h $ {} (:at 1649335913262) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |o $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                          |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649243048958) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                              |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                  |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                      |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                                  |h $ {} (:at 1649213596296) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                          |l $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                              |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |l $ {} (:at 1650213562687) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                          |q $ {} (:at 1649229153057) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                          |s $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |t $ {} (:at 1649472798605) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                          |u $ {} (:at 1649473412858) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                              |h $ {} (:at 1649175224556) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649175728820) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649175730027) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                      |L $ {} (:at 1649472899703) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                      |T $ {} (:at 1649175217709) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175274417) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                          |b $ {} (:at 1649175220808) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649183166808) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649183171249) (:by |rJG4IHzWf) (:text |not=) (:type :leaf)
                                          |b $ {} (:at 1649183171575) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                          |h $ {} (:at 1649183171902) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649183173014) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                              |b $ {} (:at 1649183174094) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |H $ {} (:at 1649252473954) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252477131) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                              |b $ {} (:at 1649252492178) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252492752) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                  |b $ {} (:at 1649252496009) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |h $ {} (:at 1649252496925) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                              |b $ {} (:at 1649175233410) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175594949) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
                                                  |b $ {} (:at 1649175233410) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |h $ {} (:at 1649236307879) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |l $ {} (:at 1649236580522) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |o $ {} (:at 1650198319197) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                          |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                          |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                              |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                  |h $ {} (:at 1649175860407) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649175861559) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                      |L $ {} (:at 1649175861823) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649175862189) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649182690865) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649182691993) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                              |b $ {} (:at 1649182692995) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649182692995) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1649182692995) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                                  |h $ {} (:at 1649185110922) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |X $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |polyline) (:type :leaf)
                                                          |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                                  |b $ {} (:at 1650208894445) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650208894445) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                                      |b $ {} (:at 1650208894445) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                                      |h $ {} (:at 1650208894445) (:by |rJG4IHzWf) (:text |style-active-line) (:type :leaf)
                                                                      |l $ {} (:at 1650208894445) (:by |rJG4IHzWf) (:text |style-shadow-line) (:type :leaf)
                                                              |g $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                  |b $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                              |l $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |:points) (:type :leaf)
                                                                  |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |h $ {} (:at 1649176279380) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649176281171) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |h $ {} (:at 1649176285885) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649176285885) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                                              |a $ {} (:at 1649472915652) (:by |rJG4IHzWf) (:text |-1) (:type :leaf)
                                                                              |h $ {} (:at 1649185179983) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                                      |Z $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                                                          |b $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |h $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                                                                  |b $ {} (:at 1650211900123) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                                                              |j $ {} (:at 1649184392210) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649184392210) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                                                  |b $ {} (:at 1649184392210) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                              |k $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                  |b $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                              |l $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                                  |b $ {} (:at 1649183057590) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649183057590) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                                      |b $ {} (:at 1649183057590) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                                                                      |h $ {} (:at 1649183057590) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                                                      |l $ {} (:at 1650197443666) (:by |rJG4IHzWf) (:text |40) (:type :leaf)
                                                              |o $ {} (:at 1650197455238) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650197455994) (:by |rJG4IHzWf) (:text |:on) (:type :leaf)
                                                                  |b $ {} (:at 1650197457672) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650197458036) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:text |:pointertap) (:type :leaf)
                                                                          |b $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                              |b $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                                  |b $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                              |h $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:text |on-expr-click) (:type :leaf)
                                                                                  |b $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                                  |h $ {} (:at 1650197558804) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                                                  |l $ {} (:at 1650197566942) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                                                  |o $ {} (:at 1650197487511) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                      |a $ {} (:at 1650197641639) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650197641639) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                          |a $ {} (:at 1650210037542) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                          |h $ {} (:at 1650197641639) (:by |rJG4IHzWf) (:text |shape-focus) (:type :leaf)
                                                      |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                          |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                  |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649182710136) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                                          |a $ {} (:at 1649472927516) (:by |rJG4IHzWf) (:text |-1) (:type :leaf)
                                                                          |h $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                                          |h $ {} (:at 1649229811639) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649229811639) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                                              |b $ {} (:at 1649229811639) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                          |l $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                              |h $ {} (:at 1650213567529) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                          |q $ {} (:at 1649229174567) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                          |s $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |t $ {} (:at 1649472804258) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                          |u $ {} (:at 1649473428792) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                              |i $ {} (:at 1649175224556) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649175728820) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649175730027) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                      |T $ {} (:at 1649175217709) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175274417) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                          |b $ {} (:at 1649175220808) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                      |b $ {} (:at 1649183166808) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649183171249) (:by |rJG4IHzWf) (:text |not=) (:type :leaf)
                                          |b $ {} (:at 1649183171575) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                          |h $ {} (:at 1649183171902) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649183173014) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                              |b $ {} (:at 1649183174094) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |H $ {} (:at 1649252473954) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252477131) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                              |b $ {} (:at 1649252492178) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252492752) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                  |b $ {} (:at 1649252496009) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |h $ {} (:at 1649252496925) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                              |b $ {} (:at 1649175233410) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175594949) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
                                                  |b $ {} (:at 1649175233410) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                  |h $ {} (:at 1649236307879) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                  |l $ {} (:at 1649236580522) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |o $ {} (:at 1650198322019) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                          |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                          |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                              |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                  |h $ {} (:at 1649175860407) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649175861559) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                      |L $ {} (:at 1649175861823) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649175862189) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649182690865) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649182691993) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                              |b $ {} (:at 1649182692995) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649182692995) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1649182692995) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                                  |h $ {} (:at 1649185110922) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |X $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |polyline) (:type :leaf)
                                                          |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                                  |b $ {} (:at 1650208907638) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650208907638) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                                      |b $ {} (:at 1650208907638) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                                      |h $ {} (:at 1650208907638) (:by |rJG4IHzWf) (:text |style-active-line) (:type :leaf)
                                                                      |l $ {} (:at 1650208907638) (:by |rJG4IHzWf) (:text |style-shadow-line) (:type :leaf)
                                                              |g $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                  |b $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649228063663) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                              |l $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |:points) (:type :leaf)
                                                                  |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |h $ {} (:at 1649176279380) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649176262196) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649176281171) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |h $ {} (:at 1649176285885) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649176285885) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                                              |a $ {} (:at 1649229193537) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                                                              |h $ {} (:at 1649185179983) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                                      |Z $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                                                          |b $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |h $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                                                                  |b $ {} (:at 1650211904056) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                                                              |j $ {} (:at 1649184392210) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649184392210) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                                                  |b $ {} (:at 1649184392210) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                              |k $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                  |b $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649228065310) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                              |l $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649176304798) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                                  |b $ {} (:at 1649183057590) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649183057590) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                                      |b $ {} (:at 1650212722594) (:by |rJG4IHzWf) (:text |160) (:type :leaf)
                                                                      |h $ {} (:at 1649183057590) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                                                      |l $ {} (:at 1650212764998) (:by |rJG4IHzWf) (:text |30) (:type :leaf)
                                                              |o $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |:on) (:type :leaf)
                                                                  |b $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |:pointertap) (:type :leaf)
                                                                          |b $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                              |b $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                                  |b $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                              |h $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |on-expr-click) (:type :leaf)
                                                                                  |b $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                                  |h $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                                                  |l $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                                                  |o $ {} (:at 1650198021828) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                      |a $ {} (:at 1650198004817) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650198004817) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                          |b $ {} (:at 1650198004817) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650198004817) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                              |b $ {} (:at 1650198004817) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                              |h $ {} (:at 1650198004817) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |h $ {} (:at 1650198004817) (:by |rJG4IHzWf) (:text |shape-focus) (:type :leaf)
                                                      |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                          |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                  |b $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649182710136) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |h $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                                          |a $ {} (:at 1649229183498) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                                                          |h $ {} (:at 1649175973760) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                                          |h $ {} (:at 1649229811639) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649229811639) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                                              |b $ {} (:at 1649229811639) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |h $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                          |l $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                              |h $ {} (:at 1650213571735) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                          |q $ {} (:at 1649472737852) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649472739205) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |T $ {} (:at 1649229174567) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                          |s $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649175228087) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |t $ {} (:at 1649472820649) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                          |u $ {} (:at 1649473444729) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                              |j $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                      |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                          |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                      |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649230904875) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |>) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                              |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                          |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                  |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                                                  |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                      |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
                                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236310052) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236583170) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |o $ {} (:at 1650198347325) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                                  |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                                          |b $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:text |with-linear?) (:type :leaf)
                                                              |b $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                                              |b $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:text |all-block?) (:type :leaf)
                                                                  |b $ {} (:at 1650213236573) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                      |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |wrap-expr-with-linear) (:type :leaf)
                                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236310933) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236584039) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |o $ {} (:at 1649472549818) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                                          |q $ {} (:at 1650198159145) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                                  |l $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                                      |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |wrap-block-expr) (:type :leaf)
                                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236312443) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236584868) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                  |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                              |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                  |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                      |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                                  |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                                          |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                          |l $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                              |g $ {} (:at 1650211051550) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |l $ {} (:at 1650213575516) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                          |o $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |&max) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                              |h $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                                                  |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |q $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649230900909) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |s $ {} (:at 1649472825331) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                          |t $ {} (:at 1649473842105) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                              |l $ {} (:at 1649175351628) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649215398192) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649215399129) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                      |T $ {} (:at 1649175356148) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175356629) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                          |b $ {} (:at 1649175358161) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                          |h $ {} (:at 1649175358536) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175359280) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                              |b $ {} (:at 1649175361772) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                      |b $ {} (:at 1649215794233) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649231063293) (:by |rJG4IHzWf) (:text |&=) (:type :leaf)
                                          |b $ {} (:at 1649229253526) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                          |h $ {} (:at 1649229256357) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                  |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                              |X $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                                                  |X $ {} (:at 1649215821460) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649215822710) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649215825101) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                                          |b $ {} (:at 1649215826037) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                      |b $ {} (:at 1649215826907) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649215826907) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
                                                          |b $ {} (:at 1649215826907) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236314411) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236586697) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |o $ {} (:at 1650198504166) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                                  |b $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                                          |b $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:text |with-linear?) (:type :leaf)
                                                              |b $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                                              |b $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:text |all-block?) (:type :leaf)
                                                                  |b $ {} (:at 1650213240867) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                      |b $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:text |wrap-expr-with-linear) (:type :leaf)
                                                          |b $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236315330) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236587622) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |o $ {} (:at 1649475140793) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                                          |q $ {} (:at 1650198470586) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                                  |h $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                                      |b $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:text |wrap-block-expr) (:type :leaf)
                                                          |b $ {} (:at 1649215811976) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236316471) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236588644) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |h $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                  |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |h $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                          |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                              |h $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                  |h $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                      |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                              |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                                  |h $ {} (:at 1649185314058) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649229805788) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649229805788) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                                          |b $ {} (:at 1649229805788) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |h $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                              |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                          |l $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                              |h $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |l $ {} (:at 1649230924749) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                          |o $ {} (:at 1649230274951) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649230276569) (:by |rJG4IHzWf) (:text |&max) (:type :leaf)
                                              |T $ {} (:at 1649229271992) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                              |b $ {} (:at 1649230277186) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649230279106) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                                                  |b $ {} (:at 1649230280448) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |s $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649175350784) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |t $ {} (:at 1649472831634) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                          |u $ {} (:at 1649476240872) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649476242544) (:by |rJG4IHzWf) (:text |either) (:type :leaf)
                                              |T $ {} (:at 1649474003508) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                                              |b $ {} (:at 1649477267976) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1649477271108) (:by |rJG4IHzWf) (:text |if-let) (:type :leaf)
                                                  |T $ {} (:at 1649477272455) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649477272899) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                                      |T $ {} (:at 1649476246855) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649476249307) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                                                          |b $ {} (:at 1649476251138) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                                  |b $ {} (:at 1649477273584) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649477281934) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                                      |b $ {} (:at 1649477287315) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                      |h $ {} (:at 1649477288136) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                              |m $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                      |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                      |h $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                          |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                  |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                              |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                                                  |l $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                                          |b $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:text |with-linear?) (:type :leaf)
                                                              |b $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                                              |b $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:text |all-block?) (:type :leaf)
                                                                  |b $ {} (:at 1650213244356) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                      |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |wrap-expr-with-linear) (:type :leaf)
                                                          |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236318710) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236590565) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |o $ {} (:at 1649475122068) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                                          |q $ {} (:at 1650198145807) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                                  |o $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                                      |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |wrap-block-expr) (:type :leaf)
                                                          |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                          |h $ {} (:at 1649236319946) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                          |l $ {} (:at 1649236591601) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                  |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                      |h $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                          |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                              |h $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                  |h $ {} (:at 1650208839678) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1650208840843) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                                      |L $ {} (:at 1650208841097) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1650208841192) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650208842810) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                              |b $ {} (:at 1650208845501) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650208845501) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                                  |b $ {} (:at 1650208845501) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                                  |h $ {} (:at 1650208845501) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                      |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                          |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                              |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                  |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                                      |h $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |e $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |polyline) (:type :leaf)
                                                              |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                  |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                                      |b $ {} (:at 1650208851722) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650208851357) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                                          |b $ {} (:at 1650208854268) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                                          |h $ {} (:at 1650208857586) (:by |rJG4IHzWf) (:text |style-active-line) (:type :leaf)
                                                                          |l $ {} (:at 1650208862250) (:by |rJG4IHzWf) (:text |style-shadow-line) (:type :leaf)
                                                                  |h $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                      |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |h $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |l $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |:points) (:type :leaf)
                                                                      |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                              |h $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |h $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                              |h $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                                                  |a $ {} (:at 1649229284640) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                                                                  |h $ {} (:at 1649215484357) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                                          |f $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                                                              |b $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                  |b $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                                                                      |b $ {} (:at 1650211908448) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                                                                  |h $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                                                      |b $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                  |l $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                                      |b $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                                          |b $ {} (:at 1650212745888) (:by |rJG4IHzWf) (:text |300) (:type :leaf)
                                                                          |h $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                                                          |l $ {} (:at 1650212753727) (:by |rJG4IHzWf) (:text |30) (:type :leaf)
                                                                  |o $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                      |b $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |h $ {} (:at 1649215488825) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |q $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |:on) (:type :leaf)
                                                                      |b $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                          |b $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |:pointertap) (:type :leaf)
                                                                              |b $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                                  |b $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:type :expr)
                                                                                    :data $ {}
                                                                                      |T $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                                      |b $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                                  |h $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:type :expr)
                                                                                    :data $ {}
                                                                                      |T $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |on-expr-click) (:type :leaf)
                                                                                      |b $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                                      |h $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                                                                      |l $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                                                                      |o $ {} (:at 1650198084794) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                          |g $ {} (:at 1650198072593) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650198072593) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                              |b $ {} (:at 1650208848138) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                              |h $ {} (:at 1650198072593) (:by |rJG4IHzWf) (:text |shape-focus) (:type :leaf)
                                                          |h $ {} (:at 1649215457180) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1649215459310) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                                              |L $ {} (:at 1649215460531) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649215460825) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                  |b $ {} (:at 1649215462190) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649215463687) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                      |b $ {} (:at 1649215583981) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |D $ {} (:at 1649215584673) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |L $ {} (:at 1649215585490) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                          |T $ {} (:at 1649229291486) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649229291486) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                                              |b $ {} (:at 1649229291486) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                                                              |h $ {} (:at 1649229291486) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                                                              |T $ {} (:at 1649229795144) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649229795144) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                                                  |b $ {} (:at 1649229795144) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |h $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                              |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                          |l $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                              |h $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                              |l $ {} (:at 1650210926138) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                                          |q $ {} (:at 1649230228488) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649230228488) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |b $ {} (:at 1649230228488) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                              |h $ {} (:at 1649230228488) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649230228488) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                                                  |b $ {} (:at 1649230228488) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                          |s $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649215408274) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |t $ {} (:at 1649472839054) (:by |rJG4IHzWf) (:text |winding-okay?) (:type :leaf)
                                          |u $ {} (:at 1649473875088) (:by |rJG4IHzWf) (:text |winding-x) (:type :leaf)
                              |o $ {} (:at 1649175369227) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649175369808) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                  |b $ {} (:at 1649175390914) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649175390914) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1649175390914) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649175390914) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                          |b $ {} (:at 1649177088497) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |5 $ {} (:at 1649177126906) (:by |rJG4IHzWf) (:text |create-list) (:type :leaf)
                                              |D $ {} (:at 1649177127994) (:by |rJG4IHzWf) (:text |:container) (:type :leaf)
                                              |L $ {} (:at 1649177090186) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649177090461) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |T $ {} (:at 1649175411745) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649175413703) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                                  |b $ {} (:at 1649175414764) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                                  |h $ {} (:at 1649175415166) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649175416094) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649175416772) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                      |h $ {} (:at 1649175417814) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649175421410) (:by |rJG4IHzWf) (:text |comp-error) (:type :leaf)
                                                          |b $ {} (:at 1649175427408) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                                      |g $ {} (:at 1649182340910) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649182340910) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                          |b $ {} (:at 1649182340910) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                      |l $ {} (:at 1649175390914) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649229349839) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                                          |b $ {} (:at 1649229328401) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
          |wrap-leaf $ {} (:at 1649093163815) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649093163815) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649093163815) (:by |rJG4IHzWf) (:text |wrap-leaf) (:type :leaf)
              |h $ {} (:at 1649093163815) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649093166256) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                  |b $ {} (:at 1649236368559) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                  |h $ {} (:at 1649236606075) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                  |l $ {} (:at 1649335919541) (:by |rJG4IHzWf) (:text |head?) (:type :leaf)
              |l $ {} (:at 1649094815328) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649094816731) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1649094816965) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649094817280) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649094818147) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                          |b $ {} (:at 1649094820730) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649094820730) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                              |b $ {} (:at 1650211971738) (:by |rJG4IHzWf) (:text |8.5) (:type :leaf)
                              |h $ {} (:at 1649094820730) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649094820730) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                  |b $ {} (:at 1649094820730) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                      |b $ {} (:at 1649159720741) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649159721590) (:by |rJG4IHzWf) (:text |height) (:type :leaf)
                          |b $ {} (:at 1649227506377) (:by |rJG4IHzWf) (:text |leaf-height) (:type :leaf)
                  |T $ {} (:at 1649093169458) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649093172781) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1649093173153) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649093176081) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                          |b $ {} (:at 1649163113703) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649163115160) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                              |L $ {} (:at 1649163115503) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649163115850) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1650209579585) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650209581021) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                      |b $ {} (:at 1650209581611) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650209581762) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1650211526798) (:by |rJG4IHzWf) (:text |-4) (:type :leaf)
                                          |h $ {} (:at 1650209583621) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                              |T $ {} (:at 1649094823853) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649094825363) (:by |rJG4IHzWf) (:text |rect) (:type :leaf)
                                  |L $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                          |b $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |h $ {} (:at 1650209578197) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |l $ {} (:at 1649184686291) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649184686291) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                  |b $ {} (:at 1649184686291) (:by |rJG4IHzWf) (:text |-0.5) (:type :leaf)
                                                  |h $ {} (:at 1649227523470) (:by |rJG4IHzWf) (:text |height) (:type :leaf)
                                      |h $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                          |b $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1650209592821) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1650209593358) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                                  |T $ {} (:at 1649094864660) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                                  |b $ {} (:at 1650210265966) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                                              |h $ {} (:at 1649159725355) (:by |rJG4IHzWf) (:text |height) (:type :leaf)
                                      |k $ {} (:at 1649163107535) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649163108904) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                          |b $ {} (:at 1649336134782) (:by |rJG4IHzWf) (:text |0.9) (:type :leaf)
                                      |o $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649094834826) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                          |b $ {} (:at 1649094846200) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649094848638) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                              |b $ {} (:at 1649243502361) (:by |rJG4IHzWf) (:text |190) (:type :leaf)
                                              |h $ {} (:at 1649243521231) (:by |rJG4IHzWf) (:text |70) (:type :leaf)
                                              |l $ {} (:at 1649336290050) (:by |rJG4IHzWf) (:text |14) (:type :leaf)
                                      |p $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |:line-style) (:type :leaf)
                                          |b $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                  |b $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                              |e $ {} (:at 1649335724028) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649335724028) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                                  |b $ {} (:at 1649337460078) (:by |rJG4IHzWf) (:text |0.18) (:type :leaf)
                                              |h $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                                  |b $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                      |b $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
                                                      |h $ {} (:at 1649335714282) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                                      |l $ {} (:at 1649335753423) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                      |q $ {} (:at 1649236375533) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649236376347) (:by |rJG4IHzWf) (:text |:on) (:type :leaf)
                                          |b $ {} (:at 1649236376954) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649236377262) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649236377603) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649236380942) (:by |rJG4IHzWf) (:text |:pointertap) (:type :leaf)
                                                  |b $ {} (:at 1649236381272) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236381558) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1649236381822) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649236382061) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                          |b $ {} (:at 1649236382548) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                      |h $ {} (:at 1650000075656) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1650000076220) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                                          |L $ {} (:at 1650000076607) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1650000077069) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650000078760) (:by |rJG4IHzWf) (:text |event) (:type :leaf)
                                                                  |b $ {} (:at 1650000080701) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650000080701) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                                      |b $ {} (:at 1650000080701) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                      |h $ {} (:at 1650000080701) (:by |rJG4IHzWf) (:text |.-data) (:type :leaf)
                                                                      |l $ {} (:at 1650000080701) (:by |rJG4IHzWf) (:text |.-originalEvent) (:type :leaf)
                                                          |T $ {} (:at 1649998281816) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1649998282397) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                              |L $ {} (:at 1650000072575) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1650000088789) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                                                                  |b $ {} (:at 1650000089423) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650000089791) (:by |rJG4IHzWf) (:text |.-metaKey) (:type :leaf)
                                                                      |b $ {} (:at 1650000092829) (:by |rJG4IHzWf) (:text |event) (:type :leaf)
                                                                  |h $ {} (:at 1650000089423) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1650000096869) (:by |rJG4IHzWf) (:text |.-ctrlKey) (:type :leaf)
                                                                      |b $ {} (:at 1650000092829) (:by |rJG4IHzWf) (:text |event) (:type :leaf)
                                                              |P $ {} (:at 1649998344209) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649998344209) (:by |rJG4IHzWf) (:text |prompt-at!) (:type :leaf)
                                                                  |b $ {} (:at 1649998348701) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |D $ {} (:at 1649998351894) (:by |rJG4IHzWf) (:text |&let) (:type :leaf)
                                                                      |L $ {} (:at 1649998349770) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649998350110) (:by |rJG4IHzWf) (:text |pos) (:type :leaf)
                                                                          |b $ {} (:at 1649998353449) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649998358713) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                                              |b $ {} (:at 1649998359127) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                              |h $ {} (:at 1649998360951) (:by |rJG4IHzWf) (:text |.-data) (:type :leaf)
                                                                              |l $ {} (:at 1649998364378) (:by |rJG4IHzWf) (:text |.-global) (:type :leaf)
                                                                      |T $ {} (:at 1649998345697) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649998346500) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                          |b $ {} (:at 1649998374735) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649998376267) (:by |rJG4IHzWf) (:text |.-x) (:type :leaf)
                                                                              |b $ {} (:at 1649998377897) (:by |rJG4IHzWf) (:text |pos) (:type :leaf)
                                                                          |h $ {} (:at 1649998374735) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649998380634) (:by |rJG4IHzWf) (:text |.-y) (:type :leaf)
                                                                              |b $ {} (:at 1649998377897) (:by |rJG4IHzWf) (:text |pos) (:type :leaf)
                                                                  |h $ {} (:at 1649998382196) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649998382723) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1649998383620) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649998453085) (:by |rJG4IHzWf) (:text |:initial) (:type :leaf)
                                                                          |b $ {} (:at 1649998458753) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                                                                      |h $ {} (:at 1649998482696) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649998484086) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                                          |b $ {} (:at 1649998484432) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649998484719) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                              |b $ {} (:at 1649998484952) (:by |rJG4IHzWf) (:type :expr)
                                                                                :data $ {}
                                                                                  |T $ {} (:at 1649998487349) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                                                                  |b $ {} (:at 1649998496293) (:by |rJG4IHzWf) (:text |code-font) (:type :leaf)
                                                                  |l $ {} (:at 1649998460795) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649998461245) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                      |b $ {} (:at 1649998461837) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649998465959) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                                                                      |h $ {} (:at 1649998468544) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |D $ {} (:at 1649998756116) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                          |T $ {} (:at 1649998757623) (:by |rJG4IHzWf) (:text |:cirru-edit-node) (:type :leaf)
                                                                          |b $ {} (:at 1649998759560) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |D $ {} (:at 1649998761334) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |L $ {} (:at 1649998762424) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                                                              |T $ {} (:at 1649998473250) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                                                              |T $ {} (:at 1649236383114) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649236383975) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                  |b $ {} (:at 1649236389071) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                                                                  |h $ {} (:at 1649236390766) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                              |X $ {} (:at 1649236758216) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649236758216) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649236758216) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649236758216) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                      |b $ {} (:at 1649236758216) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                      |h $ {} (:at 1649236758216) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |h $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |rect) (:type :leaf)
                                      |b $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |b $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                              |b $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                  |h $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |*) (:type :leaf)
                                                      |b $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |-0.5) (:type :leaf)
                                                      |h $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |height) (:type :leaf)
                                          |h $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                              |b $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                  |b $ {} (:at 1650210172756) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1650210173275) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                                      |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                                      |b $ {} (:at 1650211539387) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                                                  |h $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |height) (:type :leaf)
                                          |l $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                              |b $ {} (:at 1649236784709) (:by |rJG4IHzWf) (:text |0.8) (:type :leaf)
                                          |q $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |:line-style) (:type :leaf)
                                              |b $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                  |b $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                                      |b $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                  |h $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                                      |b $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                          |b $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
                                                          |h $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                                          |l $ {} (:at 1649237455906) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                                  |l $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236806373) (:by |rJG4IHzWf) (:text |:alpha) (:type :leaf)
                                                      |b $ {} (:at 1649237464929) (:by |rJG4IHzWf) (:text |0.8) (:type :leaf)
                              |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |text) (:type :leaf)
                                  |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |:text) (:type :leaf)
                                          |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                                      |h $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                          |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |a $ {} (:at 1650211638077) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                              |h $ {} (:at 1649184696464) (:by |rJG4IHzWf) (:text |-8) (:type :leaf)
                                      |l $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                          |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                  |b $ {} (:at 1649335553968) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649335563109) (:by |rJG4IHzWf) (:text |pick-leaf-color) (:type :leaf)
                                                      |P $ {} (:at 1649335566111) (:by |rJG4IHzWf) (:text |s) (:type :leaf)
                                                      |Y $ {} (:at 1649335932972) (:by |rJG4IHzWf) (:text |head?) (:type :leaf)
                                              |h $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |:font-size) (:type :leaf)
                                                  |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |14) (:type :leaf)
                                              |l $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text |:font-family) (:type :leaf)
                                                  |b $ {} (:at 1649163118544) (:by |rJG4IHzWf) (:text "||Roboto Mono") (:type :leaf)
                      |h $ {} (:at 1649093222902) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649093480617) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                          |b $ {} (:at 1649094822399) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                      |l $ {} (:at 1649159707083) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649228866080) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                          |b $ {} (:at 1649228870209) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                      |o $ {} (:at 1649473367607) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649473370477) (:by |rJG4IHzWf) (:text |:winding-x) (:type :leaf)
                          |b $ {} (:at 1649477938104) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
          |wrap-linear-expr $ {} (:at 1649160135483) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649160135483) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649173408296) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
              |h $ {} (:at 1649160135483) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649160162664) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                  |b $ {} (:at 1649236330789) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                  |h $ {} (:at 1649236613694) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                  |l $ {} (:at 1650198208733) (:by |rJG4IHzWf) (:text |smaller?) (:type :leaf)
              |l $ {} (:at 1649160159302) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649173713050) (:by |rJG4IHzWf) (:text |loop) (:type :leaf)
                  |X $ {} (:at 1649173713370) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649173714943) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173714751) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                          |b $ {} (:at 1649173718284) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173718284) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                      |b $ {} (:at 1649173718983) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173720148) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                          |b $ {} (:at 1649173721049) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |h $ {} (:at 1649173721523) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173724323) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                          |b $ {} (:at 1649227553518) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                      |l $ {} (:at 1649173725885) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649228993917) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                          |b $ {} (:at 1649228996549) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                      |o $ {} (:at 1649173728846) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173729676) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                          |b $ {} (:at 1649173729939) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                  |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                      |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                              |b $ {} (:at 1650208309443) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1650208310152) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                  |L $ {} (:at 1650208310398) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1650208310525) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1650208312827) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                          |b $ {} (:at 1650208321400) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650208321400) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                              |b $ {} (:at 1650208321400) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                              |h $ {} (:at 1650208321400) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |polyline) (:type :leaf)
                                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:style) (:type :leaf)
                                                  |b $ {} (:at 1650208298899) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1650208300379) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                      |L $ {} (:at 1650208304111) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                                      |P $ {} (:at 1650208308188) (:by |rJG4IHzWf) (:text |style-active-line) (:type :leaf)
                                                      |T $ {} (:at 1650208208644) (:by |rJG4IHzWf) (:text |style-shadow-line) (:type :leaf)
                                              |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649184810346) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |l $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:points) (:type :leaf)
                                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                          |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                      |l $ {} (:at 1650209840596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1650209841151) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |L $ {} (:at 1650209842229) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1650209842688) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                              |b $ {} (:at 1650209845820) (:by |rJG4IHzWf) (:text |smaller?) (:type :leaf)
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |circle) (:type :leaf)
                                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                  |X $ {} (:at 1650210238069) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1650210238069) (:by |rJG4IHzWf) (:text |:radius) (:type :leaf)
                                                      |b $ {} (:at 1650211877495) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                          |b $ {} (:at 1649181981816) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |h $ {} (:at 1649184808762) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                  |k $ {} (:at 1649236931392) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236931392) (:by |rJG4IHzWf) (:text |:fill) (:type :leaf)
                                                      |b $ {} (:at 1649236931392) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649236931392) (:by |rJG4IHzWf) (:text |hslx) (:type :leaf)
                                                          |b $ {} (:at 1649236931392) (:by |rJG4IHzWf) (:text |260) (:type :leaf)
                                                          |h $ {} (:at 1649236931392) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                                          |l $ {} (:at 1649236931392) (:by |rJG4IHzWf) (:text |60) (:type :leaf)
                                                  |o $ {} (:at 1649236352703) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649236354671) (:by |rJG4IHzWf) (:text |:on) (:type :leaf)
                                                      |b $ {} (:at 1649236355005) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649236355291) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                          |b $ {} (:at 1649236355543) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649236357914) (:by |rJG4IHzWf) (:text |:pointertap) (:type :leaf)
                                                              |b $ {} (:at 1649236358352) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649236358602) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                  |b $ {} (:at 1649236358881) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649236360123) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                      |b $ {} (:at 1649236360640) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                                                  |h $ {} (:at 1649998830899) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649998838282) (:by |rJG4IHzWf) (:text |on-expr-click) (:type :leaf)
                                                                      |b $ {} (:at 1649998838966) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                                                                      |c $ {} (:at 1649998967527) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                                      |e $ {} (:at 1649998935607) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                                                      |h $ {} (:at 1649998851490) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                      |m $ {} (:at 1649236740093) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649236740093) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |b $ {} (:at 1650198393820) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1650198404287) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                                              |H $ {} (:at 1650208324532) (:by |rJG4IHzWf) (:text |focused?) (:type :leaf)
                                              |L $ {} (:at 1650198396605) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1650198396605) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                                  |b $ {} (:at 1650198396605) (:by |rJG4IHzWf) (:text |smaller?) (:type :leaf)
                                          |h $ {} (:at 1649236740093) (:by |rJG4IHzWf) (:text |shape-focus) (:type :leaf)
                                      |o $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |create-list) (:type :leaf)
                                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:container) (:type :leaf)
                                          |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                          |l $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                          |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                          |l $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649229013518) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                              |b $ {} (:at 1649229015650) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                      |l $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                              |X $ {} (:at 1649236336397) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649236339070) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                  |b $ {} (:at 1649236339433) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649236340342) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                      |b $ {} (:at 1649236342513) (:by |rJG4IHzWf) (:text |coord) (:type :leaf)
                                      |h $ {} (:at 1649236344023) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |wrap-leaf) (:type :leaf)
                                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                              |h $ {} (:at 1649236345443) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                              |l $ {} (:at 1649236600599) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |o $ {} (:at 1649335974891) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649335975697) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                  |b $ {} (:at 1649335976314) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                                  |h $ {} (:at 1649335976824) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                      |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |is-linear?) (:type :leaf)
                                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |wrap-linear-expr) (:type :leaf)
                                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                              |h $ {} (:at 1649236346828) (:by |rJG4IHzWf) (:text |next-coord) (:type :leaf)
                                              |l $ {} (:at 1649236601583) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |o $ {} (:at 1650198222816) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                      |o $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                          |b $ {} (:at 1649480356547) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649480358950) (:by |rJG4IHzWf) (:text |comp-error) (:type :leaf)
                                              |b $ {} (:at 1649480361904) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                              |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:width) (:type :leaf)
                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                              |o $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:tree) (:type :leaf)
                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                          |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                  |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                      |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |container) (:type :leaf)
                                          |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                                      |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                              |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                              |l $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |x-position) (:type :leaf)
                                  |h $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |width) (:type :leaf)
                                  |l $ {} (:at 1650213609949) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                              |o $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |&max) (:type :leaf)
                                  |b $ {} (:at 1649229028158) (:by |rJG4IHzWf) (:text |y-stack) (:type :leaf)
                                  |h $ {} (:at 1649229032816) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649229035374) (:by |rJG4IHzWf) (:text |:y-stack) (:type :leaf)
                                      |b $ {} (:at 1649229038960) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                              |q $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                  |b $ {} (:at 1649173732793) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
        :ns $ {} (:at 1573356292089) (:by |rJG4IHzWf) (:id |f6f_c9zNwa) (:type :expr)
          :data $ {}
            |T $ {} (:at 1573356292089) (:by |rJG4IHzWf) (:id |tWOjg3fxXR) (:text |ns) (:type :leaf)
            |j $ {} (:at 1573356292089) (:by |rJG4IHzWf) (:id |Vb5vBTh9hI) (:text |app.container) (:type :leaf)
            |r $ {} (:at 1573356347927) (:by |rJG4IHzWf) (:id |3VbBx-fHXQ) (:type :expr)
              :data $ {}
                |T $ {} (:at 1573356351680) (:by |rJG4IHzWf) (:id |oBn18qRQ5E) (:text |:require) (:type :leaf)
                |j $ {} (:at 1573356351873) (:by |rJG4IHzWf) (:id |LBKI3FBT6k) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1573356354451) (:by |rJG4IHzWf) (:id |gUxiyKu2p_) (:text |phlox.core) (:type :leaf)
                    |r $ {} (:at 1573356355219) (:by |rJG4IHzWf) (:id |L8gWpo7GX) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1573356355436) (:by |rJG4IHzWf) (:id |wt5cup8kOO) (:type :expr)
                      :data $ {}
                        |r $ {} (:at 1573923373027) (:by |rJG4IHzWf) (:id |9m4uBsLYPV) (:text |defcomp) (:type :leaf)
                        |s $ {} (:at 1585451959484) (:by |rJG4IHzWf) (:id |3uyI6vfbih) (:text |>>) (:type :leaf)
                        |t $ {} (:at 1581005886470) (:by |rJG4IHzWf) (:id |2StPLKO_-) (:text |hslx) (:type :leaf)
                        |v $ {} (:at 1573974176863) (:by |rJG4IHzWf) (:id |UuPRXn8T3i) (:text |rect) (:type :leaf)
                        |x $ {} (:at 1573974179009) (:by |rJG4IHzWf) (:id |YXhIPtW-10) (:text |circle) (:type :leaf)
                        |y $ {} (:at 1573974179800) (:by |rJG4IHzWf) (:id |BNLnDwbsYE) (:text |text) (:type :leaf)
                        |yT $ {} (:at 1573974254119) (:by |rJG4IHzWf) (:id |_pYCrKPUDN) (:text |container) (:type :leaf)
                        |yb $ {} (:at 1574181633700) (:by |rJG4IHzWf) (:id |4FlBzzEaJm) (:text |graphics) (:type :leaf)
                        |yj $ {} (:at 1574007057783) (:by |rJG4IHzWf) (:id |skOUV8vT9K) (:text |create-list) (:type :leaf)
                        |yr $ {} (:at 1585459054262) (:by |rJG4IHzWf) (:id |HHencqMfVm) (:text |g) (:type :leaf)
                        |z $ {} (:at 1649097796698) (:by |rJG4IHzWf) (:text |polyline) (:type :leaf)
                |q $ {} (:at 1649336989890) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649336993164) (:by |rJG4IHzWf) (:text |phlox.comp.button) (:type :leaf)
                    |b $ {} (:at 1649336994594) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1649336995185) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1649336997244) (:by |rJG4IHzWf) (:text |comp-button) (:type :leaf)
                |y $ {} (:at 1584277714237) (:by |rJG4IHzWf) (:id |27tYhuzp) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1584277720691) (:by |rJG4IHzWf) (:id |a7osesFdE) (:text |phlox.comp.drag-point) (:type :leaf)
                    |r $ {} (:at 1584277721407) (:by |rJG4IHzWf) (:id |yvqthb0fX) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1584277721636) (:by |rJG4IHzWf) (:id |GcGHVov0z) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1584277724392) (:by |rJG4IHzWf) (:id |5n0jdRwIz) (:text |comp-drag-point) (:type :leaf)
                |yT $ {} (:at 1584278014152) (:by |rJG4IHzWf) (:id |VqAYgo1Ei) (:text |phlox.comp.sl) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1584278017284) (:by |rJG4IHzWf) (:id |a7osesFdE) (:text |phlox.comp.slider) (:type :leaf)
                    |r $ {} (:at 1584277721407) (:by |rJG4IHzWf) (:id |yvqthb0fX) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1584277721636) (:by |rJG4IHzWf) (:id |GcGHVov0z) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1584278022816) (:by |rJG4IHzWf) (:id |5n0jdRwIz) (:text |comp-slider) (:type :leaf)
                |yj $ {} (:at 1584291730235) (:by |rJG4IHzWf) (:id |Gfe5bsG4) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1584291736089) (:by |rJG4IHzWf) (:id |6ypb8QlIM) (:text |app.math) (:type :leaf)
                    |r $ {} (:at 1584291736852) (:by |rJG4IHzWf) (:id |1ua-y5V3j) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1584291737029) (:by |rJG4IHzWf) (:id |0G9T10qsj) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1584291737731) (:by |rJG4IHzWf) (:id |Rqie3r_XR) (:text |divide-path) (:type :leaf)
                        |r $ {} (:at 1584291742311) (:by |rJG4IHzWf) (:id |JF_I7zdF) (:text |multiply-path) (:type :leaf)
                |z $ {} (:at 1649174902552) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649174903736) (:by |rJG4IHzWf) (:text |app.config) (:type :leaf)
                    |b $ {} (:at 1649174905123) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1649174905325) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |h $ {} (:at 1649227433367) (:by |rJG4IHzWf) (:text |leaf-gap) (:type :leaf)
                        |o $ {} (:at 1649229087173) (:by |rJG4IHzWf) (:text |leaf-height) (:type :leaf)
                        |q $ {} (:at 1649229089518) (:by |rJG4IHzWf) (:text |line-height) (:type :leaf)
                        |s $ {} (:at 1649851053648) (:by |rJG4IHzWf) (:text |code-font) (:type :leaf)
                        |t $ {} (:at 1649852402085) (:by |rJG4IHzWf) (:text |api-host) (:type :leaf)
                        |u $ {} (:at 1650211870379) (:by |rJG4IHzWf) (:text |dot-radius) (:type :leaf)
                |zP $ {} (:at 1649398234988) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649398238054) (:by |rJG4IHzWf) (:text |phlox.complex) (:type :leaf)
                    |b $ {} (:at 1649398238412) (:by |rJG4IHzWf) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1649398239475) (:by |rJG4IHzWf) (:text |complex) (:type :leaf)
                |zY $ {} (:at 1649963524451) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649963631590) (:by |rJG4IHzWf) (:text |pointed-prompt.core) (:type :leaf)
                    |b $ {} (:at 1649963524451) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1649963524451) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1649963524451) (:by |rJG4IHzWf) (:text |prompt-at!) (:type :leaf)
        :proc $ {} (:at 1573356292089) (:by |rJG4IHzWf) (:id |rUhR8tJuOO) (:type :expr)
          :data $ {}
      |app.main $ {}
        :defs $ {}
          |*store $ {} (:at 1573662553239) (:by |rJG4IHzWf) (:id |AkON77umvN) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629647999395) (:by |rJG4IHzWf) (:id |QrixaEkyrv) (:text |defatom) (:type :leaf)
              |j $ {} (:at 1573662553239) (:by |rJG4IHzWf) (:id |EnTc6QJt8r) (:text |*store) (:type :leaf)
              |r $ {} (:at 1573662562450) (:by |rJG4IHzWf) (:id |RVoaE8yaWr) (:text |schema/store) (:type :leaf)
          |dispatch! $ {} (:at 1573662594481) (:by |rJG4IHzWf) (:id |sLk88XumR2) (:type :expr)
            :data $ {}
              |T $ {} (:at 1573662594481) (:by |rJG4IHzWf) (:id |zSmgo_y3E3) (:text |defn) (:type :leaf)
              |j $ {} (:at 1573662594481) (:by |rJG4IHzWf) (:id |kHfX0sHiTx) (:text |dispatch!) (:type :leaf)
              |r $ {} (:at 1573662594481) (:by |rJG4IHzWf) (:id |387phBHKoJ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1573662598886) (:by |rJG4IHzWf) (:id |2DY9NULqK) (:text |op) (:type :leaf)
                  |j $ {} (:at 1573662603266) (:by |rJG4IHzWf) (:id |8vVkdB96TF) (:text |op-data) (:type :leaf)
              |x $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |ewvOS_Zx7) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |dpDHJunLw) (:text |if) (:type :leaf)
                  |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |c-RMIh_zf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629648008108) (:by |rJG4IHzWf) (:id |o_yZjVbgO) (:text |list?) (:type :leaf)
                      |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |CHRt3-gg3) (:text |op) (:type :leaf)
                  |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |ulJSoQRq_) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |HQKdhrEws) (:text |recur) (:type :leaf)
                      |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |hu7dGOr2D) (:text |:states) (:type :leaf)
                      |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |OIIZ78sxI) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |vfZuaVCXW) (:text |[]) (:type :leaf)
                          |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |C2gUIDXec) (:text |op) (:type :leaf)
                          |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |8ro0e97ti) (:text |op-data) (:type :leaf)
                  |v $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |3tHQssLJ3) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |an9LSJ7_u) (:text |do) (:type :leaf)
                      |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |wACYFsHXY) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |cwY72mLJdU) (:text |when) (:type :leaf)
                          |j $ {} (:at 1582981186729) (:by |rJG4IHzWf) (:id |YBlQX4snd) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1582981188225) (:by |rJG4IHzWf) (:id |lRyyVjWdO) (:text |and) (:type :leaf)
                              |L $ {} (:at 1582981189285) (:by |rJG4IHzWf) (:id |GjoomtUel) (:text |dev?) (:type :leaf)
                              |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |MhVb6um0pF) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |pSENSMgd_Y) (:text |not=) (:type :leaf)
                                  |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |7t3S8ZEq92) (:text |op) (:type :leaf)
                                  |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |wVvfsIU6_b) (:text |:states) (:type :leaf)
                          |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |ZuNSUP-0ko) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |D9UCg7zI0u) (:text |println) (:type :leaf)
                              |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |cb33x0o0Se) (:text "|\"dispatch!") (:type :leaf)
                              |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |BLz1ZGq3zM) (:text |op) (:type :leaf)
                      |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |7YMvHUB1lJ) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |gyTJbZ9egK) (:text |let) (:type :leaf)
                          |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |XFGsrCFnIv) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |ob03ntejUO) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |vmJQX69uA0) (:text |op-id) (:type :leaf)
                                  |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |zMtP-usaf8) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |FFR178O-8r) (:text |shortid/generate) (:type :leaf)
                              |j $ {} (:at 1582981199882) (:by |rJG4IHzWf) (:id |w8tsXDStG) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1582981199882) (:by |rJG4IHzWf) (:id |7OhAn0CKs) (:text |op-time) (:type :leaf)
                                  |j $ {} (:at 1582981199882) (:by |rJG4IHzWf) (:id |s_ASyr5jB) (:type :expr)
                                    :data $ {}
                                      |j $ {} (:at 1649235231256) (:by |rJG4IHzWf) (:id |AIUDQ7OlL) (:text |js/Date.now) (:type :leaf)
                          |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |qoigS2hPgP) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |EwYkYt_jmj) (:text |reset!) (:type :leaf)
                              |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |59wL4YqsDT) (:text |*store) (:type :leaf)
                              |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |6qwz0d-pEa) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |5pxkB4oPjR) (:text |updater) (:type :leaf)
                                  |j $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |MHeRxXG2LC) (:text |@*store) (:type :leaf)
                                  |r $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |QRyELzzbsc) (:text |op) (:type :leaf)
                                  |v $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |zw-6ZcUrE6) (:text |op-data) (:type :leaf)
                                  |x $ {} (:at 1582981164272) (:by |rJG4IHzWf) (:id |fB7vmjiVcA) (:text |op-id) (:type :leaf)
                                  |y $ {} (:at 1582981203656) (:by |rJG4IHzWf) (:id |CVOTUAw4) (:text |op-time) (:type :leaf)
          |load-files! $ {} (:at 1649786377448) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649786377448) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649786377448) (:by |rJG4IHzWf) (:text |load-files!) (:type :leaf)
              |h $ {} (:at 1649786377448) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649786379991) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
              |l $ {} (:at 1649786406577) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649786407541) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                  |T $ {} (:at 1649852257557) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649852258309) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                      |P $ {} (:at 1649852270413) (:by |rJG4IHzWf) (:text |api-host) (:type :leaf)
                      |b $ {} (:at 1649852260709) (:by |rJG4IHzWf) (:text "|\"/compact-data") (:type :leaf)
                  |X $ {} (:at 1649789594878) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649789595255) (:by |rJG4IHzWf) (:text |js/fetch) (:type :leaf)
                  |b $ {} (:at 1649786408169) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649786409055) (:by |rJG4IHzWf) (:text |.then) (:type :leaf)
                      |b $ {} (:at 1649786410481) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649786414431) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |T $ {} (:at 1649786413213) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649786411960) (:by |rJG4IHzWf) (:text |res) (:type :leaf)
                          |b $ {} (:at 1649786415101) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649786418096) (:by |rJG4IHzWf) (:text |.!text) (:type :leaf)
                              |b $ {} (:at 1649786420261) (:by |rJG4IHzWf) (:text |res) (:type :leaf)
                  |h $ {} (:at 1649786421942) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649786423434) (:by |rJG4IHzWf) (:text |.then) (:type :leaf)
                      |b $ {} (:at 1649786424352) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649786425313) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1649786425730) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649786427015) (:by |rJG4IHzWf) (:text |text) (:type :leaf)
                          |h $ {} (:at 1649786845451) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649786846096) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |L $ {} (:at 1649786846588) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649786846747) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649786847431) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                      |b $ {} (:at 1649786847847) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649786847847) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                                          |b $ {} (:at 1649786847847) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649786847847) (:by |rJG4IHzWf) (:text |parse-cirru-edn) (:type :leaf)
                                              |b $ {} (:at 1649786847847) (:by |rJG4IHzWf) (:text |text) (:type :leaf)
                              |T $ {} (:at 1649786852221) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649786853290) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |L $ {} (:at 1649786853544) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649786855008) (:by |rJG4IHzWf) (:text |some?) (:type :leaf)
                                      |b $ {} (:at 1649786855466) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |T $ {} (:at 1649786812188) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649786859998) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                                      |P $ {} (:at 1649786862121) (:by |rJG4IHzWf) (:text |:load-files) (:type :leaf)
                                      |Y $ {} (:at 1649786863169) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |b $ {} (:at 1649786864536) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649786866911) (:by |rJG4IHzWf) (:text |js/console.log) (:type :leaf)
                                      |b $ {} (:at 1649786873326) (:by |rJG4IHzWf) (:text "|\"unknown data:") (:type :leaf)
                                      |h $ {} (:at 1649786871726) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
          |main! $ {} (:at 1548266583359) (:by |rJG4IHzWf) (:id |N84ryjxHeb) (:type :expr)
            :data $ {}
              |T $ {} (:at 1548266583359) (:by |rJG4IHzWf) (:id |VtP_sQu6yt) (:text |defn) (:type :leaf)
              |j $ {} (:at 1548266583359) (:by |rJG4IHzWf) (:id |FGCdoroBzi) (:text |main!) (:type :leaf)
              |r $ {} (:at 1548266583359) (:by |rJG4IHzWf) (:id |-eUWWIx9hK) (:type :expr)
                :data $ {}
              |x $ {} (:at 1548267246722) (:by |rJG4IHzWf) (:id |MTVV2LuMpb) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1573356695965) (:by |rJG4IHzWf) (:id |coiTygxk6) (:text |;) (:type :leaf)
                  |T $ {} (:at 1548267254997) (:by |rJG4IHzWf) (:id |MTVV2LuMpbleaf) (:text |js/console.log) (:type :leaf)
                  |j $ {} (:at 1548267256875) (:by |rJG4IHzWf) (:id |ZwMWs9oSlk) (:text |PIXI) (:type :leaf)
              |y $ {} (:at 1649073354199) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649073354199) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |b $ {} (:at 1649073354199) (:by |rJG4IHzWf) (:text |dev?) (:type :leaf)
                  |h $ {} (:at 1649073354199) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073354199) (:by |rJG4IHzWf) (:text |load-console-formatter!) (:type :leaf)
              |y5 $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                  |b $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |new) (:type :leaf)
                      |b $ {} (:at 1649073768544) (:by |rJG4IHzWf) (:text |FontFaceObserver) (:type :leaf)
                      |h $ {} (:at 1649091887940) (:by |rJG4IHzWf) (:text "|\"Roboto Mono") (:type :leaf)
                  |h $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |.!load) (:type :leaf)
                  |l $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |.!then) (:type :leaf)
                      |b $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |event) (:type :leaf)
                          |h $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
                          |l $ {} (:at 1649350672058) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649350672058) (:by |rJG4IHzWf) (:text "|js/window._phloxTree. renderer.plugins.accessibility.destroy") (:type :leaf)
              |y9 $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |add-watch) (:type :leaf)
                  |b $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
                  |h $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |:change) (:type :leaf)
                  |l $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                      |b $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |b $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |prev) (:type :leaf)
                      |h $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073362527) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
              |yP $ {} (:at 1649073338860) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649073338860) (:by |rJG4IHzWf) (:text |render-control!) (:type :leaf)
              |yR $ {} (:at 1649073338860) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649073338860) (:by |rJG4IHzWf) (:text |start-control-loop!) (:type :leaf)
                  |b $ {} (:at 1649073338860) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                  |h $ {} (:at 1649073338860) (:by |rJG4IHzWf) (:text |on-control-event) (:type :leaf)
              |yS $ {} (:at 1649786354392) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649786372030) (:by |rJG4IHzWf) (:text |load-files!) (:type :leaf)
                  |b $ {} (:at 1649786376718) (:by |rJG4IHzWf) (:text |dispatch!) (:type :leaf)
              |yT $ {} (:at 1573356701317) (:by |rJG4IHzWf) (:id |Ne9TCWzxn3) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1573356701317) (:by |rJG4IHzWf) (:id |IfyvqEEnht) (:text |println) (:type :leaf)
                  |j $ {} (:at 1573356701317) (:by |rJG4IHzWf) (:id |CJeUmXUALP) (:text "|\"App Started") (:type :leaf)
          |mount-target $ {} (:at 1650134830589) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650134830589) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1650134830589) (:by |rJG4IHzWf) (:text |mount-target) (:type :leaf)
              |h $ {} (:at 1650134830589) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650134839697) (:by |rJG4IHzWf) (:text |js/document.querySelector) (:type :leaf)
                  |b $ {} (:at 1650135198403) (:by |rJG4IHzWf) (:text "|\".app") (:type :leaf)
          |reload! $ {} (:at 1548266585003) (:by |rJG4IHzWf) (:id |TCdLCY5i8m) (:type :expr)
            :data $ {}
              |T $ {} (:at 1548266585003) (:by |rJG4IHzWf) (:id |JuPUVmkxIC) (:text |defn) (:type :leaf)
              |j $ {} (:at 1548266585003) (:by |rJG4IHzWf) (:id |026fHp4ZaB) (:text |reload!) (:type :leaf)
              |n $ {} (:at 1649073422740) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |r $ {} (:at 1649073423959) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649073425039) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |L $ {} (:at 1649073425648) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073430307) (:by |rJG4IHzWf) (:text |nil?) (:type :leaf)
                      |b $ {} (:at 1649073432545) (:by |rJG4IHzWf) (:text |build-errors) (:type :leaf)
                  |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                      |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |clear-phlox-caches!) (:type :leaf)
                      |e $ {} (:at 1650135087121) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650135089941) (:by |rJG4IHzWf) (:text |respo/clear-cache!) (:type :leaf)
                      |h $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |remove-watch) (:type :leaf)
                          |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
                          |h $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |:change) (:type :leaf)
                      |l $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |add-watch) (:type :leaf)
                          |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
                          |h $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |:change) (:type :leaf)
                          |l $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                              |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                  |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |prev) (:type :leaf)
                              |h $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
                      |o $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
                      |q $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |replace-control-loop!) (:type :leaf)
                          |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |8) (:type :leaf)
                          |h $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |on-control-event) (:type :leaf)
                      |s $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |hud!) (:type :leaf)
                          |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text "|\"ok~") (:type :leaf)
                          |h $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text "|\"Ok") (:type :leaf)
                      |t $ {} (:at 1649786824413) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649786824413) (:by |rJG4IHzWf) (:text |load-files!) (:type :leaf)
                          |b $ {} (:at 1649786824413) (:by |rJG4IHzWf) (:text |dispatch!) (:type :leaf)
                  |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |hud!) (:type :leaf)
                      |b $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text "|\"error") (:type :leaf)
                      |h $ {} (:at 1649073418117) (:by |rJG4IHzWf) (:text |build-errors) (:type :leaf)
          |render-app! $ {} (:at 1649073380135) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649073380135) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649073380135) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
              |h $ {} (:at 1649073380135) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:text |render!) (:type :leaf)
                  |b $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:text |comp-container) (:type :leaf)
                      |b $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:text |@*store) (:type :leaf)
                  |h $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:text |dispatch!) (:type :leaf)
                  |l $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649073390593) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
              |o $ {} (:at 1650134821548) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650135067613) (:by |rJG4IHzWf) (:text |respo/render!) (:type :leaf)
                  |b $ {} (:at 1650134830157) (:by |rJG4IHzWf) (:text |mount-target) (:type :leaf)
                  |h $ {} (:at 1650134850477) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650134853919) (:by |rJG4IHzWf) (:text |comp-navbar) (:type :leaf)
                      |X $ {} (:at 1650136838534) (:by |rJG4IHzWf) (:text |@*store) (:type :leaf)
                      |b $ {} (:at 1650136763379) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1650136764098) (:by |rJG4IHzWf) (:text |>>) (:type :leaf)
                          |T $ {} (:at 1650136751660) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1650136753780) (:by |rJG4IHzWf) (:text |:states) (:type :leaf)
                              |T $ {} (:at 1650134886842) (:by |rJG4IHzWf) (:text |@*store) (:type :leaf)
                          |b $ {} (:at 1650136780114) (:by |rJG4IHzWf) (:text |:dom) (:type :leaf)
                  |l $ {} (:at 1650134882116) (:by |rJG4IHzWf) (:text |dispatch!) (:type :leaf)
        :ns $ {} (:at 1548266580449) (:by |rJG4IHzWf) (:id |D4DqluvTAk) (:type :expr)
          :data $ {}
            |T $ {} (:at 1548266580449) (:by |rJG4IHzWf) (:id |fwtKgxrifd) (:text |ns) (:type :leaf)
            |j $ {} (:at 1548266580449) (:by |rJG4IHzWf) (:id |aclVzW2ZMa) (:text |app.main) (:type :leaf)
            |r $ {} (:at 1548267234269) (:by |rJG4IHzWf) (:id |U5qFU2tKe5) (:type :expr)
              :data $ {}
                |T $ {} (:at 1548267234910) (:by |rJG4IHzWf) (:id |-xyO2Bf8yC) (:text |:require) (:type :leaf)
                |j $ {} (:at 1548267235111) (:by |rJG4IHzWf) (:id |DvhLn3bymM) (:type :expr)
                  :data $ {}
                    |X $ {} (:at 1548267268346) (:by |rJG4IHzWf) (:id |qznRs1mwFp) (:text "|\"pixi.js") (:type :leaf)
                    |b $ {} (:at 1548267239536) (:by |rJG4IHzWf) (:id |NO5f-q2IA) (:text |:as) (:type :leaf)
                    |j $ {} (:at 1548267236197) (:by |rJG4IHzWf) (:id |NtrVcrcEfT) (:text |PIXI) (:type :leaf)
                |n $ {} (:at 1580870001923) (:by |rJG4IHzWf) (:id |lhzkh54Iv) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1580870003957) (:by |rJG4IHzWf) (:id |YqcIW91Ph) (:text "|\"shortid") (:type :leaf)
                    |r $ {} (:at 1580870004943) (:by |rJG4IHzWf) (:id |bb83IpWM) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1580870005954) (:by |rJG4IHzWf) (:id |pA3FHFWF) (:text |shortid) (:type :leaf)
                |r $ {} (:at 1573356495638) (:by |rJG4IHzWf) (:id |70_vYqeHy) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1573356502361) (:by |rJG4IHzWf) (:id |_Nb2_gSl0U) (:text |phlox.core) (:type :leaf)
                    |r $ {} (:at 1573356503682) (:by |rJG4IHzWf) (:id |lM9042lPt) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1573356503870) (:by |rJG4IHzWf) (:id |WU_dcbkCef) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1573356508921) (:by |rJG4IHzWf) (:id |ovsTsA76H_) (:text |render!) (:type :leaf)
                        |q $ {} (:at 1649073320545) (:by |rJG4IHzWf) (:text |clear-phlox-caches!) (:type :leaf)
                        |s $ {} (:at 1649146357124) (:by |rJG4IHzWf) (:text |on-control-event) (:type :leaf)
                |v $ {} (:at 1573356509898) (:by |rJG4IHzWf) (:id |DdaQXD4Rr) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1574511248266) (:by |rJG4IHzWf) (:id |1ITZaMJT0H) (:text |app.container) (:type :leaf)
                    |r $ {} (:at 1573356520731) (:by |rJG4IHzWf) (:id |j7zdNb9gA-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1573356520963) (:by |rJG4IHzWf) (:id |8SBPKNAyoz) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1573356527039) (:by |rJG4IHzWf) (:id |Js6jUZ1OJR) (:text |comp-container) (:type :leaf)
                |x $ {} (:at 1573662565143) (:by |rJG4IHzWf) (:id |F0TNQKzRks) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1574511250853) (:by |rJG4IHzWf) (:id |jlxCTGZFs) (:text |app.schema) (:type :leaf)
                    |r $ {} (:at 1573662571099) (:by |rJG4IHzWf) (:id |eMKH_OEYc) (:text |:as) (:type :leaf)
                    |v $ {} (:at 1573662571751) (:by |rJG4IHzWf) (:id |7_HCaYNx7s) (:text |schema) (:type :leaf)
                |y $ {} (:at 1580869953066) (:by |rJG4IHzWf) (:id |FhmPsM5t) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1649146348073) (:by |rJG4IHzWf) (:id |nz2r5I7eC) (:text |phlox.config) (:type :leaf)
                    |r $ {} (:at 1580869958070) (:by |rJG4IHzWf) (:id |nG85S_jR-) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1580869958242) (:by |rJG4IHzWf) (:id |2SIj9T6xu) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1580869959270) (:by |rJG4IHzWf) (:id |CvTPNGgeC) (:text |dev?) (:type :leaf)
                        |n $ {} (:at 1649073324936) (:by |rJG4IHzWf) (:text |mobile?) (:type :leaf)
                |yT $ {} (:at 1580869989534) (:by |rJG4IHzWf) (:id |PHpTwdXol) (:type :expr)
                  :data $ {}
                    |j $ {} (:at 1580869993228) (:by |rJG4IHzWf) (:id |EMSgITAj) (:text |app.updater) (:type :leaf)
                    |r $ {} (:at 1580869994026) (:by |rJG4IHzWf) (:id |jjeqvljWE) (:text |:refer) (:type :leaf)
                    |v $ {} (:at 1580869994260) (:by |rJG4IHzWf) (:id |hkGlO9gqn) (:type :expr)
                      :data $ {}
                        |j $ {} (:at 1580869995575) (:by |rJG4IHzWf) (:id |EeOM4z_pE) (:text |updater) (:type :leaf)
                |yb $ {} (:at 1649073754068) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649073754068) (:by |rJG4IHzWf) (:text "|\"fontfaceobserver-es") (:type :leaf)
                    |b $ {} (:at 1649073759975) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |h $ {} (:at 1649073754068) (:by |rJG4IHzWf) (:text |FontFaceObserver) (:type :leaf)
                |yj $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:text "|\"./calcit.build-errors") (:type :leaf)
                    |b $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |h $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:text |build-errors) (:type :leaf)
                |yr $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:text "|\"bottom-tip") (:type :leaf)
                    |b $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |h $ {} (:at 1649073444820) (:by |rJG4IHzWf) (:text |hud!) (:type :leaf)
                |z $ {} (:at 1649073328586) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649073328586) (:by |rJG4IHzWf) (:text |touch-control.core) (:type :leaf)
                    |b $ {} (:at 1649073328586) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1649073328586) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1649073328586) (:by |rJG4IHzWf) (:text |render-control!) (:type :leaf)
                        |b $ {} (:at 1649073328586) (:by |rJG4IHzWf) (:text |start-control-loop!) (:type :leaf)
                        |h $ {} (:at 1649073328586) (:by |rJG4IHzWf) (:text |replace-control-loop!) (:type :leaf)
                |zD $ {} (:at 1649852303090) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649852304465) (:by |rJG4IHzWf) (:text |app.config) (:type :leaf)
                    |b $ {} (:at 1649852305222) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1649852305438) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1649852307838) (:by |rJG4IHzWf) (:text |api-host) (:type :leaf)
                |zP $ {} (:at 1650134856261) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650134858248) (:by |rJG4IHzWf) (:text |app.comp.nav) (:type :leaf)
                    |b $ {} (:at 1650134859136) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1650134859388) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650134868175) (:by |rJG4IHzWf) (:text |comp-navbar) (:type :leaf)
                |zY $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |respo.core) (:type :leaf)
                    |b $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |defcomp) (:type :leaf)
                        |b $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |defeffect) (:type :leaf)
                        |h $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |<>) (:type :leaf)
                        |l $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |>>) (:type :leaf)
                        |o $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |div) (:type :leaf)
                        |q $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |button) (:type :leaf)
                        |s $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |textarea) (:type :leaf)
                        |t $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |span) (:type :leaf)
                        |u $ {} (:at 1650134992446) (:by |rJG4IHzWf) (:text |input) (:type :leaf)
                |zb $ {} (:at 1650135061375) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135062531) (:by |rJG4IHzWf) (:text |respo.core) (:type :leaf)
                    |b $ {} (:at 1650135063182) (:by |rJG4IHzWf) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1650135064045) (:by |rJG4IHzWf) (:text |respo) (:type :leaf)
                |ze $ {} (:at 1650134998028) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650134998028) (:by |rJG4IHzWf) (:text |respo.comp.space) (:type :leaf)
                    |b $ {} (:at 1650134998028) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1650134998028) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1650134998028) (:by |rJG4IHzWf) (:text |=<) (:type :leaf)
        :proc $ {} (:at 1548266580449) (:by |rJG4IHzWf) (:id |E53mYF93tU) (:type :expr)
          :data $ {}
      |app.math $ {}
        :defs $ {}
          |add-path $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |5j3OxYUFDS) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |_aal6lOEOr) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |VYre4RGeQB) (:text |add-path) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |vDVm-FIACP) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |dmZZN5xmz0) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |mmMZFECkyl) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |tPTZ_sh4DC) (:text |a) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |CeLgDw6SLI) (:text |b) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |b2Sf9r6L-Q) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |XtGUxQdHz0) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |6Xu-PiZahE) (:text |x) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |zDKNNdOAgn) (:text |y) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |J9kjAqyFr4) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |HDC5UeL7DC) (:text |[]) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |H8e3l1B-bW) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |u4A1FmHDJZ) (:text |+) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |o0JuQ5BE1C) (:text |a) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |aLYdDhC0xW) (:text |x) (:type :leaf)
                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |X6VCzrk6zr) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |WzZvqP-Ke-) (:text |+) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |51d-l1q1ZB) (:text |b) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |DX_68Noxwp) (:text |y) (:type :leaf)
          |divide-path $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |mQd30V2rpH) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |4n1yQ9A9CC) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |w5QdRZFjCU) (:text |divide-path) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |cmKNK_BCLE) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Nj-Pw3FR0V) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |aL_sI37t2e) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9twtRMCJuz) (:text |x) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |K2GpxBpJd_) (:text |y) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |1_W8nsifyH) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9usiKBpXvs) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |DqKroYQnMR) (:text |a) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |8p-WSzjTSL) (:text |b) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |_a5Rhym0tW) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9pUa3DTwbt) (:text |let) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |NlM2pV72Ov) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |-56BdcjZ0w) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |fIpj3K7wQz) (:text |inverted) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |sCdVlMvKzZ) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |K0C1O3N_pt) (:text |/) (:type :leaf)
                              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0wPnE8cwBF) (:text |1) (:type :leaf)
                              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Kf7baXCp51) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0QTKjXIabK) (:text |+) (:type :leaf)
                                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |68Lub9795I) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |sGCSrzxNVp) (:text |*) (:type :leaf)
                                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |8-mNwSvIme) (:text |a) (:type :leaf)
                                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |zV5TfrcX3k) (:text |a) (:type :leaf)
                                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |fJzJ1AidTx) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |1whfAFDDqW) (:text |*) (:type :leaf)
                                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |vRLHZeCTnG) (:text |b) (:type :leaf)
                                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Sb3G0BZwDl) (:text |b) (:type :leaf)
                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |PrzAom5dd4) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |DBRdGt2phQ) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |qiNjb5SNOm) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |BEX8Rh02tL) (:text |*) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |1Xz43lXp4A) (:text |inverted) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |oimAcre9aU) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |f9aNyxnjp0) (:text |+) (:type :leaf)
                              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |56dcIXkUuH) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |jERLBdVy8W) (:text |*) (:type :leaf)
                                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |p8RJjBMMcf) (:text |x) (:type :leaf)
                                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |lkeDOcMIFU) (:text |a) (:type :leaf)
                              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |HwXAdGYzui) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Gc3qGznDtS) (:text |*) (:type :leaf)
                                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |ybcjGeuk0C) (:text |y) (:type :leaf)
                                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |-la5nbjuIG) (:text |b) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |s3mkHMNnYU) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |XQRNtcIA2J) (:text |*) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |25nJF-32aY) (:text |inverted) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |unSgoQP9VC) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |7XycM0wwt8) (:text |-) (:type :leaf)
                              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0TQw7qd_Gm) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |a-crKwOC4_) (:text |*) (:type :leaf)
                                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |PqEQX23zRV) (:text |y) (:type :leaf)
                                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |zT-MbNe2cI) (:text |a) (:type :leaf)
                              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |BxADh7Xvid) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |blchRxaMtQ) (:text |*) (:type :leaf)
                                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |hPSs9fq4kx) (:text |x) (:type :leaf)
                                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |hzTck-4Sia) (:text |b) (:type :leaf)
          |divide-x $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |3dmavUy7Yy) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |kSHZnuMkg6) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |uk86WcMQu1) (:text |divide-x) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |RkCCF2p18Z) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |jJ4slkQvq6) (:text |point) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |cIp1wiPL-R) (:text |x) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |EOlFgOqaiJ) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |y-EuCq7JPX) (:text |[]) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |t9PPW4Xfre) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |t4vr3W2RMY) (:text |/) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |JZyx-WMe_G) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |RNSWqJv-q4) (:text |first) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |_wlkbrL176) (:text |point) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |aiNe1Coaqr) (:text |x) (:type :leaf)
                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |WDmi4JIKUH) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |xCO1GenEvT) (:text |/) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |SjUMATf8J6) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |ip30ASu-TK) (:text |peek) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |AzZ_zeOrII) (:text |point) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |N5jm5TbMMA) (:text |x) (:type :leaf)
          |invert-y $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |RMqYf-FiaC) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |5RarFr4KMu) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |gCWH7dU4Qt) (:text |invert-y) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |m23eSXbODi) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |_RqeNO_euc) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |k7Ec8j_DYO) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |wcQzHvSOny) (:text |x) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |BbmJvdERYn) (:text |y) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |AHxJFRaqAx) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0QowVcBjJ3) (:text |[]) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |byXXOQbesO) (:text |x) (:type :leaf)
                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9m20uenFOc) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |csfkIX2wsq) (:text |unchecked-negate) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |ofdL2lJWDu) (:text |y) (:type :leaf)
          |multiply-path $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |fRXVCr0-K) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |IlYX14zub) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |yYbntF3j1) (:text |multiply-path) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |7w1FGsUOT) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |hrXcF3U22) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |_n8ZpRlgB) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |1aMEbk_rm) (:text |a) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |mOdRMHSx0) (:text |b) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |NfGPJiXWa) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |-4KTmnoOC) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |PlYxxM3N7) (:text |x) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |c8mflJQEEu) (:text |y) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |iHqD86YeLA) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |jP66yb080v) (:text |[]) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |3Tl5l7U1IC) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |gUsW2YIlGG) (:text |-) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |KKB-Fznry5) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |U9X08X6vWu) (:text |*) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |lzKvGyznYA) (:text |a) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |jH2D5ci_-O) (:text |x) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |1QFXAlKf6t) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |nGifh5a2Ke) (:text |*) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |GqG7tDj32D) (:text |b) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |XgUJe1x5uU) (:text |y) (:type :leaf)
                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |XWc2ZTg6L8) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |yh7wjWgZYv) (:text |+) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |7kTHKqLCV2) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |GOTOV0yMWl) (:text |*) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |xDl1Fu1X6m) (:text |a) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |D9i1VO3sF9) (:text |y) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |IZSZnmTeSw) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |vCJRuWNH-3) (:text |*) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |vpRgWKwVrX) (:text |b) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |NkjP_NzP_N) (:text |x) (:type :leaf)
          |rand-color $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |uoTp2Kiz2V) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |TQFEgKeYNL) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |slwbyoOYBj) (:text |rand-color) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Wrr4HSMlOn) (:type :expr)
                :data $ {}
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |MND2DYKFEj) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9AM6izYVrb) (:text |rand-int) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |3Pzn4x-mRO) (:text |0xffffff) (:type :leaf)
          |rand-point $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9Xs2Tm2woP) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |7yaJ8nQ4Cm) (:text |defn$) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |O6_4C4gcRd) (:text |rand-point) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |m7X0t_cLE_) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |KeLEV5kTix) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |IXkLeM6zcq) (:text |n) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |DZXt8Tpisf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |MHrJtLoU6-) (:text |rand-point) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |xGxfBZa2CQ) (:text |n) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |JxD9X73SsH) (:text |n) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |GhA3KQBCJ9) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |BBEXyzR5Ca) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |sLPrt_TxA7) (:text |n) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |RtCpRysLnj) (:text |m) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |xiHFnR16Eh) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |yvLtFgJr--) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9hMmr6mgh7) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |_ssGSOEXSD) (:text |-) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |3hDwoE68Sf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |ivTzKx5mXc) (:text |js/Math.round) (:type :leaf)
                              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |VzsZZ1mBxu) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0B3UqS4x4J) (:text |*) (:type :leaf)
                                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |pB3VM3bqo4) (:text |0.2) (:type :leaf)
                                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |x_9hRTeGr3) (:text |n) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |x6MNsh-HGM) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |z9RAFriWDf) (:text |rand-int) (:type :leaf)
                              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |rRSdWxtUOB) (:text |n) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Vv5YtKvDjR) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |RZZxH4-HkZ) (:text |-) (:type :leaf)
                          |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |RUQYzwMJQP) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |ehaiQ90P0L) (:text |js/Math.round) (:type :leaf)
                              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |wziZ_yix6O) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |rxCrFjNoJz) (:text |*) (:type :leaf)
                                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |f122XpaUko) (:text |0.2) (:type :leaf)
                                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |cAFrpWPZSi) (:text |m) (:type :leaf)
                          |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Ab50Apvw_o) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0QVrC07dCq) (:text |rand-int) (:type :leaf)
                              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |5rIHXUrKUI) (:text |m) (:type :leaf)
          |rough-size $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |AEferYmOcg) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |o_-zBlcOfg) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |eLfEVPxgVl) (:text |rough-size) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |3SQwKdOMuw) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |YFBbJfSPgw) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |EzvEz01J9p) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |07CQzR0rVw) (:text |x) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |VLRKBkN3xv) (:text |y) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |nq-gQ36EmF) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |KTatQbf8P1) (:text |+) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |v_TqOuC1bJ) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |kDb1VAiqHh) (:text |js/Math.abs) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |OZWRxJpTl6) (:text |x) (:type :leaf)
                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Do5LZwLIv9) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |x3Yb0cEDH2) (:text |js/Math.abs) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |9aMJ94hsyA) (:text |y) (:type :leaf)
          |subtract-path $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |2oMe6BTRAK) (:type :expr)
            :data $ {}
              |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |FoWrXs5gdI) (:text |defn) (:type :leaf)
              |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |ouYtkKyWIr) (:text |subtract-path) (:type :leaf)
              |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |JYjx0u5hRw) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |BSZiCc3XdM) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |dB_QVJEYea) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |qJTNJQwiGk) (:text |a) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0A70g4h3AX) (:text |b) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |f_2_evSAVv) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |N1FHf4U8pj) (:text |[]) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |cCzgC0GaIO) (:text |x) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |v3ikQ-k93M) (:text |y) (:type :leaf)
              |v $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |l--_1t1Y5I) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |SYaZy_90_7) (:text |[]) (:type :leaf)
                  |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |CFmI4sxKcR) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |uPIFeTVAWp) (:text |-) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |8M8zBFZOZ9) (:text |a) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |yhks-zdCE-) (:text |x) (:type :leaf)
                  |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Qw0TnHQ-cO) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |4ycAmy8-20) (:text |-) (:type :leaf)
                      |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |Mv0BcV6U2P) (:text |b) (:type :leaf)
                      |r $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |1DjZGptJ4d) (:text |y) (:type :leaf)
        :ns $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |0xcsZ-77B) (:type :expr)
          :data $ {}
            |T $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |MYIGa96xh) (:text |ns) (:type :leaf)
            |j $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |QRRZXVTrP) (:text |app.math) (:type :leaf)
        :proc $ {} (:at 1584291209905) (:by |rJG4IHzWf) (:id |yqkSbSRep) (:type :expr)
          :data $ {}
      |app.schema $ {}
        :defs $ {}
          |inline $ {} (:at 1629647867474) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1629647868982) (:by |rJG4IHzWf) (:text |defmacro) (:type :leaf)
              |j $ {} (:at 1649227148000) (:by |rJG4IHzWf) (:text |inline) (:type :leaf)
              |r $ {} (:at 1629647867474) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629647870306) (:by |rJG4IHzWf) (:text |path) (:type :leaf)
              |v $ {} (:at 1629647870912) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629647873020) (:by |rJG4IHzWf) (:text |read-file) (:type :leaf)
                  |j $ {} (:at 1629647873251) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629647873809) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                      |j $ {} (:at 1629647885279) (:by |rJG4IHzWf) (:text "|\"data/") (:type :leaf)
                      |r $ {} (:at 1629647886051) (:by |rJG4IHzWf) (:text |path) (:type :leaf)
          |store $ {} (:id |HkEjgouFcpBW) (:time 1499755354983) (:type :expr)
            :data $ {}
              |T $ {} (:author |root) (:id |ryBoejdY5arb) (:text |def) (:time 1499755354983) (:type :leaf)
              |j $ {} (:author |root) (:id |H1Iils_Y96BZ) (:text |store) (:time 1499755354983) (:type :leaf)
              |r $ {} (:id |ryviloOFc6B-) (:time 1499755354983) (:type :expr)
                :data $ {}
                  |T $ {} (:author |root) (:id |Bkuogo_F9pr-) (:text |{}) (:time 1499755354983) (:type :leaf)
                  |x $ {} (:at 1582981221225) (:by |rJG4IHzWf) (:id |IS8IwPi0) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1582981222751) (:by |rJG4IHzWf) (:id |IS8IwPi0leaf) (:text |:states) (:type :leaf)
                      |j $ {} (:at 1582981223653) (:by |rJG4IHzWf) (:id |z2QH2rOoI) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1582981224073) (:by |rJG4IHzWf) (:id |AE7ioBp_) (:text |{}) (:type :leaf)
                  |y $ {} (:at 1650135297571) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650135311289) (:by |rJG4IHzWf) (:text |:dom-states) (:type :leaf)
                      |b $ {} (:at 1650135311718) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650135312063) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1650135349635) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1650135350863) (:by |rJG4IHzWf) (:text |:cursor) (:type :leaf)
                              |b $ {} (:at 1650135351204) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1650135351470) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1650135353038) (:by |rJG4IHzWf) (:text |:dom) (:type :leaf)
                  |yD $ {} (:at 1649846250903) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649846253860) (:by |rJG4IHzWf) (:text |:saved-files) (:type :leaf)
                      |b $ {} (:at 1649846254670) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649846255028) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |yT $ {} (:at 1649786329505) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649786331684) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                      |b $ {} (:at 1649786332028) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649786332373) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |z $ {} (:at 1649234074187) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649234075908) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                      |b $ {} (:at 1649234076447) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649234076686) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                  |zD $ {} (:at 1649238023603) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649238024683) (:by |rJG4IHzWf) (:text |:warning) (:type :leaf)
                      |b $ {} (:at 1649238026726) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |zP $ {} (:at 1649849673286) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649849674817) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                      |b $ {} (:at 1649849675138) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649849675334) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
        :ns $ {} (:id |rJxieodtqarW) (:time 1499755354983) (:type :expr)
          :data $ {}
            |T $ {} (:author |root) (:id |HyWslouK56HZ) (:text |ns) (:time 1499755354983) (:type :leaf)
            |j $ {} (:author |root) (:id |SkGsgsOtcTBb) (:text |app.schema) (:time 1499755354983) (:type :leaf)
        :proc $ {} (:id |rkmjesdF9Trb) (:time 1499755354983) (:type :expr)
          :data $ {}
      |app.server $ {}
        :configs $ {}
        :defs $ {}
          |*app-server $ {} (:at 1649772506313) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649772508437) (:by |rJG4IHzWf) (:text |defatom) (:type :leaf)
              |b $ {} (:at 1649772506313) (:by |rJG4IHzWf) (:text |*app-server) (:type :leaf)
              |h $ {} (:at 1649772510696) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
          |main! $ {} (:at 1649770590744) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649770590744) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649770590744) (:by |rJG4IHzWf) (:text |main!) (:type :leaf)
              |h $ {} (:at 1649770590744) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1649770609395) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649770611180) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                  |b $ {} (:at 1649997580202) (:by |rJG4IHzWf) (:text "|\"start web server") (:type :leaf)
              |o $ {} (:at 1649771164306) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649771169625) (:by |rJG4IHzWf) (:text |start-server!) (:type :leaf)
          |on-request $ {} (:at 1649771118613) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649771118613) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649771118613) (:by |rJG4IHzWf) (:text |on-request) (:type :leaf)
              |h $ {} (:at 1649771118613) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649771121354) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
              |l $ {} (:at 1649772963315) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649773017025) (:by |rJG4IHzWf) (:text |case-default) (:type :leaf)
                  |H $ {} (:at 1649773068941) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649773020521) (:by |rJG4IHzWf) (:text |:url) (:type :leaf)
                      |b $ {} (:at 1649773020521) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                  |J $ {} (:at 1649773070005) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649773070538) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                      |L $ {} (:at 1649773071028) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649997434920) (:by |rJG4IHzWf) (:text |eprintln) (:type :leaf)
                          |X $ {} (:at 1649773077611) (:by |rJG4IHzWf) (:text "|\"unknown url") (:type :leaf)
                          |b $ {} (:at 1649773071028) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649773071028) (:by |rJG4IHzWf) (:text |:url) (:type :leaf)
                              |b $ {} (:at 1649773071028) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                      |T $ {} (:at 1649773057115) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649773057524) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1649773059159) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649773059672) (:by |rJG4IHzWf) (:text |:code) (:type :leaf)
                              |b $ {} (:at 1649773062299) (:by |rJG4IHzWf) (:text |404) (:type :leaf)
                          |h $ {} (:at 1649773063347) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649773065269) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                              |b $ {} (:at 1649773301444) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649773302468) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                  |T $ {} (:at 1649773306970) (:by |rJG4IHzWf) (:text "|\"unkown url ") (:type :leaf)
                                  |b $ {} (:at 1649773305811) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649773305811) (:by |rJG4IHzWf) (:text |:url) (:type :leaf)
                                      |b $ {} (:at 1649773305811) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                  |T $ {} (:at 1649773078761) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649773086625) (:by |rJG4IHzWf) (:text "|\"/compact-data") (:type :leaf)
                      |T $ {} (:at 1649773274252) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649773456085) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |L $ {} (:at 1649773456386) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649773456534) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649773457583) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                                  |b $ {} (:at 1649773458068) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649773460183) (:by |rJG4IHzWf) (:text |read-file) (:type :leaf)
                                      |b $ {} (:at 1649774020932) (:by |rJG4IHzWf) (:text "|\"compact.cirru") (:type :leaf)
                          |T $ {} (:at 1649771124452) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649771124949) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                              |b $ {} (:at 1649771125433) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649771127593) (:by |rJG4IHzWf) (:text |:code) (:type :leaf)
                                  |b $ {} (:at 1649771128226) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                              |h $ {} (:at 1649771128834) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649786675001) (:by |rJG4IHzWf) (:text |:headers) (:type :leaf)
                                  |b $ {} (:at 1649852667647) (:by |rJG4IHzWf) (:text |cors-headers) (:type :leaf)
                              |l $ {} (:at 1649771151014) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649771151755) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                                  |b $ {} (:at 1649774025131) (:by |rJG4IHzWf) (:text |content) (:type :leaf)
                  |b $ {} (:at 1649773089014) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649775560756) (:by |rJG4IHzWf) (:text "|\"/compact-inc") (:type :leaf)
                      |b $ {} (:at 1649773169436) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649773203323) (:by |rJG4IHzWf) (:text |case-default) (:type :leaf)
                          |L $ {} (:at 1649773203736) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649773207264) (:by |rJG4IHzWf) (:text |:method) (:type :leaf)
                              |b $ {} (:at 1649773208239) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                          |P $ {} (:at 1649773209498) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649773211912) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                              |b $ {} (:at 1649773213348) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649773215285) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                                  |b $ {} (:at 1649773222270) (:by |rJG4IHzWf) (:text "|\"Unknown method") (:type :leaf)
                                  |h $ {} (:at 1649773226597) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649773226597) (:by |rJG4IHzWf) (:text |:method) (:type :leaf)
                                      |b $ {} (:at 1649773226597) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                              |h $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:text |:code) (:type :leaf)
                                      |b $ {} (:at 1649773241607) (:by |rJG4IHzWf) (:text |400) (:type :leaf)
                                  |h $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649852496455) (:by |rJG4IHzWf) (:text |:headers) (:type :leaf)
                                      |b $ {} (:at 1649852673303) (:by |rJG4IHzWf) (:text |cors-headers) (:type :leaf)
                                  |l $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                                      |b $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:text |format-cirru-edn) (:type :leaf)
                                          |b $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                              |b $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:text |:ok?) (:type :leaf)
                                                  |b $ {} (:at 1649773245332) (:by |rJG4IHzWf) (:text |false) (:type :leaf)
                                              |h $ {} (:at 1649773231851) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649773247851) (:by |rJG4IHzWf) (:text |:message) (:type :leaf)
                                                  |b $ {} (:at 1649773254387) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649773255075) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                      |T $ {} (:at 1649773256122) (:by |rJG4IHzWf) (:text "|\"Unknown method ") (:type :leaf)
                                                      |b $ {} (:at 1649773259004) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649773259004) (:by |rJG4IHzWf) (:text |:method) (:type :leaf)
                                                          |b $ {} (:at 1649773259004) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                          |T $ {} (:at 1649773279679) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649773284325) (:by |rJG4IHzWf) (:text |:PUT) (:type :leaf)
                              |T $ {} (:at 1649775634756) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649775635502) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                  |L $ {} (:at 1649775637576) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649775637704) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649775647954) (:by |rJG4IHzWf) (:text |body) (:type :leaf)
                                          |b $ {} (:at 1649775650524) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649775650524) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                                              |b $ {} (:at 1649775650524) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                                      |b $ {} (:at 1649775657802) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649775658558) (:by |rJG4IHzWf) (:text |changes) (:type :leaf)
                                          |b $ {} (:at 1649775659425) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649775662994) (:by |rJG4IHzWf) (:text |parse-cirru-edn) (:type :leaf)
                                              |b $ {} (:at 1649775665070) (:by |rJG4IHzWf) (:text |body) (:type :leaf)
                                      |h $ {} (:at 1649775676164) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649775682106) (:by |rJG4IHzWf) (:text |new-compact-data) (:type :leaf)
                                          |b $ {} (:at 1649775682645) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649775690653) (:by |rJG4IHzWf) (:text |patch-compact-data) (:type :leaf)
                                              |b $ {} (:at 1649852927604) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1649852931508) (:by |rJG4IHzWf) (:text |parse-cirru-edn) (:type :leaf)
                                                  |T $ {} (:at 1649775693290) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649775693290) (:by |rJG4IHzWf) (:text |read-file) (:type :leaf)
                                                      |b $ {} (:at 1649775693290) (:by |rJG4IHzWf) (:text "|\"compact.cirru") (:type :leaf)
                                              |h $ {} (:at 1649775696108) (:by |rJG4IHzWf) (:text |changes) (:type :leaf)
                                  |P $ {} (:at 1649853109583) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649853114016) (:by |rJG4IHzWf) (:text |write-file) (:type :leaf)
                                      |L $ {} (:at 1649997417561) (:by |rJG4IHzWf) (:text "|\"compact.cirru") (:type :leaf)
                                      |T $ {} (:at 1649853120526) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649853123507) (:by |rJG4IHzWf) (:text |format-cirru-edn) (:type :leaf)
                                          |T $ {} (:at 1649853111366) (:by |rJG4IHzWf) (:text |new-compact-data) (:type :leaf)
                                  |T $ {} (:at 1649775567569) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649775571732) (:by |rJG4IHzWf) (:text |write-file) (:type :leaf)
                                      |b $ {} (:at 1649853105009) (:by |rJG4IHzWf) (:text "|\".compact-inc.cirru") (:type :leaf)
                                      |h $ {} (:at 1649775652405) (:by |rJG4IHzWf) (:text |body) (:type :leaf)
                                  |X $ {} (:at 1649775737761) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649775739829) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                                      |b $ {} (:at 1649775748559) (:by |rJG4IHzWf) (:text "|\"wrote to") (:type :leaf)
                                      |h $ {} (:at 1649775750533) (:by |rJG4IHzWf) (:text "|\".compact-inc.cirru") (:type :leaf)
                                      |l $ {} (:at 1649997425421) (:by |rJG4IHzWf) (:text "|\" and ") (:type :leaf)
                                      |o $ {} (:at 1649997427634) (:by |rJG4IHzWf) (:text "|\"compact.cirru") (:type :leaf)
                                  |b $ {} (:at 1649775588084) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649775732091) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                                      |T $ {} (:at 1649775589363) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                                      |b $ {} (:at 1649775593218) (:by |rJG4IHzWf) (:text "|\"data") (:type :leaf)
                                      |h $ {} (:at 1649775595257) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649775625038) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                                          |b $ {} (:at 1649775596468) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                                  |h $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:text |:code) (:type :leaf)
                                          |b $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                                      |h $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649852490614) (:by |rJG4IHzWf) (:text |:headers) (:type :leaf)
                                          |b $ {} (:at 1649852656610) (:by |rJG4IHzWf) (:text |cors-headers) (:type :leaf)
                                      |l $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649773113492) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                                          |b $ {} (:at 1649773122380) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649773124997) (:by |rJG4IHzWf) (:text |format-cirru-edn) (:type :leaf)
                                              |b $ {} (:at 1649773146645) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649773147027) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                  |X $ {} (:at 1649773161306) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649773163563) (:by |rJG4IHzWf) (:text |:ok?) (:type :leaf)
                                                      |b $ {} (:at 1649773166619) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                                                  |b $ {} (:at 1649773147404) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649775703127) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                                                      |b $ {} (:at 1649775791382) (:by |rJG4IHzWf) (:text "|\"wrote") (:type :leaf)
                          |b $ {} (:at 1649852449528) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649852452717) (:by |rJG4IHzWf) (:text |:OPTIONS) (:type :leaf)
                              |b $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:text |:code) (:type :leaf)
                                      |b $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:text |200) (:type :leaf)
                                  |h $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649852491809) (:by |rJG4IHzWf) (:text |:headers) (:type :leaf)
                                      |b $ {} (:at 1649852660130) (:by |rJG4IHzWf) (:text |cors-headers) (:type :leaf)
                                  |l $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649852455343) (:by |rJG4IHzWf) (:text |:body) (:type :leaf)
                                      |b $ {} (:at 1649852467249) (:by |rJG4IHzWf) (:text "|\"OK") (:type :leaf)
          |patch-compact-data $ {} (:at 1649775760707) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649775760707) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649775760707) (:by |rJG4IHzWf) (:text |patch-compact-data) (:type :leaf)
              |h $ {} (:at 1649775760707) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |H $ {} (:at 1649775766181) (:by |rJG4IHzWf) (:text |compact-data) (:type :leaf)
                  |b $ {} (:at 1649853538102) (:by |rJG4IHzWf) (:text |inc-changes) (:type :leaf)
              |l $ {} (:at 1649852882349) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649852883854) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:text |removed) (:type :leaf)
                          |b $ {} (:at 1649853031392) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649853033646) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |T $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853605745) (:by |rJG4IHzWf) (:text |:removed) (:type :leaf)
                                  |b $ {} (:at 1649853540256) (:by |rJG4IHzWf) (:text |inc-changes) (:type :leaf)
                              |b $ {} (:at 1649853034494) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853036056) (:by |rJG4IHzWf) (:text |#{}) (:type :leaf)
                      |b $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:text |added) (:type :leaf)
                          |b $ {} (:at 1649853038795) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649853039326) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |T $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853607224) (:by |rJG4IHzWf) (:text |:added) (:type :leaf)
                                  |b $ {} (:at 1649853541228) (:by |rJG4IHzWf) (:text |inc-changes) (:type :leaf)
                              |b $ {} (:at 1649853039915) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853040268) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |h $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:text |changed) (:type :leaf)
                          |b $ {} (:at 1649853041956) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649853042480) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |T $ {} (:at 1649852885376) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853608443) (:by |rJG4IHzWf) (:text |:changed) (:type :leaf)
                                  |b $ {} (:at 1649853542293) (:by |rJG4IHzWf) (:text |inc-changes) (:type :leaf)
                              |b $ {} (:at 1649853043265) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649853043795) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |P $ {} (:at 1649853569478) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649997515449) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                      |T $ {} (:at 1649853571664) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                      |b $ {} (:at 1649853575648) (:by |rJG4IHzWf) (:text "|\"inc changes:") (:type :leaf)
                      |h $ {} (:at 1649853599353) (:by |rJG4IHzWf) (:text |changed) (:type :leaf)
                  |T $ {} (:at 1649775886576) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649775953569) (:by |rJG4IHzWf) (:text |update) (:type :leaf)
                      |b $ {} (:at 1649775956669) (:by |rJG4IHzWf) (:text |compact-data) (:type :leaf)
                      |h $ {} (:at 1649775960287) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                      |l $ {} (:at 1649775960637) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649775962679) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1649775962984) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649775968021) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                          |h $ {} (:at 1649776027145) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649776027759) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |T $ {} (:at 1649776029508) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649776029651) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649776031408) (:by |rJG4IHzWf) (:text |c1) (:type :leaf)
                                      |T $ {} (:at 1649775968537) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649775969014) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                          |b $ {} (:at 1649775969972) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                          |h $ {} (:at 1649775970645) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649775974235) (:by |rJG4IHzWf) (:text |unselect-keys) (:type :leaf)
                                              |b $ {} (:at 1649775976280) (:by |rJG4IHzWf) (:text |removed) (:type :leaf)
                                          |l $ {} (:at 1649775977434) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649775988127) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                              |b $ {} (:at 1649775991370) (:by |rJG4IHzWf) (:text |added) (:type :leaf)
                              |b $ {} (:at 1649776033135) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649776035546) (:by |rJG4IHzWf) (:text |loop) (:type :leaf)
                                  |b $ {} (:at 1649776046601) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649776036172) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649776045485) (:by |rJG4IHzWf) (:text |files-data) (:type :leaf)
                                          |T $ {} (:at 1649776038544) (:by |rJG4IHzWf) (:text |c1) (:type :leaf)
                                      |b $ {} (:at 1649776051830) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649776055166) (:by |rJG4IHzWf) (:text |changes) (:type :leaf)
                                          |b $ {} (:at 1649776144636) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649776146195) (:by |rJG4IHzWf) (:text |.to-list) (:type :leaf)
                                              |T $ {} (:at 1649776058475) (:by |rJG4IHzWf) (:text |changed) (:type :leaf)
                                  |h $ {} (:at 1649776059332) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649776059808) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |b $ {} (:at 1649776060110) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649776061253) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                          |b $ {} (:at 1649776063534) (:by |rJG4IHzWf) (:text |changes) (:type :leaf)
                                      |h $ {} (:at 1649776069322) (:by |rJG4IHzWf) (:text |files-data) (:type :leaf)
                                      |l $ {} (:at 1649776069727) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649776071814) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                          |b $ {} (:at 1649776072083) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649776090964) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776149741) (:by |rJG4IHzWf) (:text |pair) (:type :leaf)
                                                  |b $ {} (:at 1649776092250) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776093789) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                                      |X $ {} (:at 1649776155574) (:by |rJG4IHzWf) (:text |changes) (:type :leaf)
                                              |L $ {} (:at 1649776157711) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776170650) (:by |rJG4IHzWf) (:text |target-ns) (:type :leaf)
                                                  |b $ {} (:at 1649776163580) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776164067) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                                      |b $ {} (:at 1649776165623) (:by |rJG4IHzWf) (:text |pair) (:type :leaf)
                                                      |h $ {} (:at 1649776165934) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |P $ {} (:at 1649776157711) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776172738) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                                  |b $ {} (:at 1649776163580) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776164067) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                                      |b $ {} (:at 1649776165623) (:by |rJG4IHzWf) (:text |pair) (:type :leaf)
                                                      |h $ {} (:at 1649776174174) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                              |T $ {} (:at 1649776072219) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776081888) (:by |rJG4IHzWf) (:text |removed-defs) (:type :leaf)
                                                  |b $ {} (:at 1649776082343) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776084953) (:by |rJG4IHzWf) (:text |:removed-defs) (:type :leaf)
                                                      |b $ {} (:at 1649776175891) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |b $ {} (:at 1649776183103) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776185724) (:by |rJG4IHzWf) (:text |added-defs) (:type :leaf)
                                                  |b $ {} (:at 1649776186246) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776188920) (:by |rJG4IHzWf) (:text |:added-defs) (:type :leaf)
                                                      |b $ {} (:at 1649776569095) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |h $ {} (:at 1649776193829) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776200255) (:by |rJG4IHzWf) (:text |changed-defs) (:type :leaf)
                                                  |b $ {} (:at 1649776200882) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776203022) (:by |rJG4IHzWf) (:text |:changed-defs) (:type :leaf)
                                                      |b $ {} (:at 1649776570556) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |l $ {} (:at 1649776242687) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776245217) (:by |rJG4IHzWf) (:text |ns-change) (:type :leaf)
                                                  |b $ {} (:at 1649776247420) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776246619) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                      |b $ {} (:at 1649776248621) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |o $ {} (:at 1649776269072) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776270975) (:by |rJG4IHzWf) (:text |next) (:type :leaf)
                                                  |b $ {} (:at 1649776282514) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649776318683) (:by |rJG4IHzWf) (:text |update) (:type :leaf)
                                                      |b $ {} (:at 1649776348223) (:by |rJG4IHzWf) (:text |files-data) (:type :leaf)
                                                      |h $ {} (:at 1649776351136) (:by |rJG4IHzWf) (:text |target-ns) (:type :leaf)
                                                      |l $ {} (:at 1649776355583) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1649776356067) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                          |T $ {} (:at 1649776353958) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649776354869) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                          |b $ {} (:at 1649776357578) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649776369310) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                              |b $ {} (:at 1649776370304) (:by |rJG4IHzWf) (:text |file) (:type :leaf)
                                                              |h $ {} (:at 1649776372060) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649776374192) (:by |rJG4IHzWf) (:text |update) (:type :leaf)
                                                                  |b $ {} (:at 1649776374807) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                                                  |h $ {} (:at 1649776375233) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649776375749) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                      |b $ {} (:at 1649776376042) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649776376832) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                                      |h $ {} (:at 1649776396139) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649776396139) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                                          |b $ {} (:at 1649776396139) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649776396139) (:by |rJG4IHzWf) (:text |some?) (:type :leaf)
                                                                              |b $ {} (:at 1649776396139) (:by |rJG4IHzWf) (:text |ns-change) (:type :leaf)
                                                                          |h $ {} (:at 1649776396139) (:by |rJG4IHzWf) (:text |ns-change) (:type :leaf)
                                                                          |l $ {} (:at 1649776396139) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                                              |l $ {} (:at 1649776397480) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649776398309) (:by |rJG4IHzWf) (:text |update) (:type :leaf)
                                                                  |b $ {} (:at 1649776399481) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                                                  |h $ {} (:at 1649776400215) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649776400695) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                                      |b $ {} (:at 1649776400993) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1649776401536) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                                      |h $ {} (:at 1649776429181) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |D $ {} (:at 1649776429829) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                                          |L $ {} (:at 1649776430517) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                                          |T $ {} (:at 1649776403698) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649776412732) (:by |rJG4IHzWf) (:text |unselect-keys) (:type :leaf)
                                                                              |h $ {} (:at 1649776421402) (:by |rJG4IHzWf) (:text |removed-defs) (:type :leaf)
                                                                          |b $ {} (:at 1649776433036) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1649776434919) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                                                                              |b $ {} (:at 1649776437448) (:by |rJG4IHzWf) (:text |added-defs) (:type :leaf)
                                                                              |h $ {} (:at 1649776439202) (:by |rJG4IHzWf) (:text |changed-defs) (:type :leaf)
                                          |h $ {} (:at 1649776271652) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649776272375) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                                              |b $ {} (:at 1649776275531) (:by |rJG4IHzWf) (:text |next) (:type :leaf)
                                              |h $ {} (:at 1649776276633) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649776278208) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                                                  |b $ {} (:at 1649776279344) (:by |rJG4IHzWf) (:text |changes) (:type :leaf)
          |reload! $ {} (:at 1649770593210) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649770593210) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649770597672) (:by |rJG4IHzWf) (:text |reload!) (:type :leaf)
              |h $ {} (:at 1649770593210) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1649770599683) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649770602750) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                  |b $ {} (:at 1649770605316) (:by |rJG4IHzWf) (:text "|\"reload...") (:type :leaf)
          |start-server! $ {} (:at 1649771171049) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649772494413) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649771171049) (:by |rJG4IHzWf) (:text |start-server!) (:type :leaf)
              |e $ {} (:at 1649772496345) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |h $ {} (:at 1649772497493) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649772498951) (:by |rJG4IHzWf) (:text |reset!) (:type :leaf)
                  |L $ {} (:at 1649772505786) (:by |rJG4IHzWf) (:text |*app-server) (:type :leaf)
                  |T $ {} (:at 1649771171049) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649771196255) (:by |rJG4IHzWf) (:text |serve-http!) (:type :leaf)
                      |b $ {} (:at 1649771197699) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649771198027) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1649771198307) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649771199079) (:by |rJG4IHzWf) (:text |:port) (:type :leaf)
                              |b $ {} (:at 1649771217335) (:by |rJG4IHzWf) (:text |6101) (:type :leaf)
                          |h $ {} (:at 1649771227348) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649771228258) (:by |rJG4IHzWf) (:text |:host) (:type :leaf)
                              |b $ {} (:at 1649771230960) (:by |rJG4IHzWf) (:text "|\"0.0.0.0") (:type :leaf)
                      |h $ {} (:at 1649771233145) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649771233394) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1649771234518) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649771235909) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
                          |h $ {} (:at 1649771237770) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649771239811) (:by |rJG4IHzWf) (:text |on-request) (:type :leaf)
                              |b $ {} (:at 1649771240761) (:by |rJG4IHzWf) (:text |req) (:type :leaf)
        :ns $ {} (:at 1649770585419) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1649770585419) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1649770585419) (:by |rJG4IHzWf) (:text |app.server) (:type :leaf)
            |h $ {} (:at 1649771178625) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1649771181094) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |b $ {} (:at 1649771181482) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649771184839) (:by |rJG4IHzWf) (:text |http.core) (:type :leaf)
                    |b $ {} (:at 1649771187010) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1649771187359) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1649771190297) (:by |rJG4IHzWf) (:text |serve-http!) (:type :leaf)
                |h $ {} (:at 1649852638895) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1649852640754) (:by |rJG4IHzWf) (:text |app.config) (:type :leaf)
                    |b $ {} (:at 1649852641599) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1649852641832) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1649852643742) (:by |rJG4IHzWf) (:text |cors-headers) (:type :leaf)
      |app.updater $ {}
        :defs $ {}
          |cirru-edit $ {} (:at 1649235112765) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649235112765) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649235112765) (:by |rJG4IHzWf) (:text |cirru-edit) (:type :leaf)
              |h $ {} (:at 1649235112765) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |H $ {} (:at 1649235116413) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                  |U $ {} (:at 1649235117790) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                  |h $ {} (:at 1649235112765) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
              |j $ {} (:at 1649235184990) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649235988458) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                  |T $ {} (:at 1649235185854) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                  |b $ {} (:at 1649235186760) (:by |rJG4IHzWf) (:text "|\"TODO") (:type :leaf)
                  |h $ {} (:at 1649235188457) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                  |l $ {} (:at 1649235189966) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                  |o $ {} (:at 1649235192436) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
              |l $ {} (:at 1649237913913) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649237915052) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1649237915398) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649237915521) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649237916199) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                          |b $ {} (:at 1649237917064) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649237917655) (:by |rJG4IHzWf) (:text |:key) (:type :leaf)
                              |b $ {} (:at 1649237918990) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                      |b $ {} (:at 1649237920089) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649237922746) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                          |b $ {} (:at 1649237922998) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649237925192) (:by |rJG4IHzWf) (:text |:key-code) (:type :leaf)
                              |b $ {} (:at 1649237926214) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                      |h $ {} (:at 1649238515403) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649238516644) (:by |rJG4IHzWf) (:text |meta?) (:type :leaf)
                          |b $ {} (:at 1649256572373) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649256573182) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |T $ {} (:at 1649238517059) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649252338101) (:by |rJG4IHzWf) (:text |:meta?) (:type :leaf)
                                  |b $ {} (:at 1649238522726) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                              |b $ {} (:at 1649238517059) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649256576212) (:by |rJG4IHzWf) (:text |:ctrl?) (:type :leaf)
                                  |b $ {} (:at 1649238522726) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                      |l $ {} (:at 1649238515403) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649252098556) (:by |rJG4IHzWf) (:text |shift?) (:type :leaf)
                          |b $ {} (:at 1649238517059) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649252340113) (:by |rJG4IHzWf) (:text |:shift?) (:type :leaf)
                              |b $ {} (:at 1649238522726) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                  |T $ {} (:at 1649237852019) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649237855875) (:by |rJG4IHzWf) (:text |cond) (:type :leaf)
                      |L $ {} (:at 1649237901874) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649237902674) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649237902233) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649237910946) (:by |rJG4IHzWf) (:text "|\"Backspace") (:type :leaf)
                              |h $ {} (:at 1649237937596) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                          |b $ {} (:at 1649237939007) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649237992141) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649237992411) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649238067435) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                  |b $ {} (:at 1649238069424) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649238073228) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649238075356) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649238076394) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |h $ {} (:at 1649238077675) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |l $ {} (:at 1649238088575) (:by |rJG4IHzWf) (:text "|\"cannot delete root") (:type :leaf)
                              |l $ {} (:at 1649238912701) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649238913285) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                  |L $ {} (:at 1649238914400) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649238915938) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649238915938) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                          |b $ {} (:at 1649238915938) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649238915938) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                              |b $ {} (:at 1649238915938) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                              |h $ {} (:at 1649238915938) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |T $ {} (:at 1649238918737) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649238919179) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |L $ {} (:at 1649238920743) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649238921195) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                                          |T $ {} (:at 1649238919492) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649238920253) (:by |rJG4IHzWf) (:text |list?) (:type :leaf)
                                              |b $ {} (:at 1649238923326) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                          |X $ {} (:at 1649238935780) (:by |rJG4IHzWf) (:text |meta?) (:type :leaf)
                                          |b $ {} (:at 1649238923933) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649238924354) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                              |b $ {} (:at 1649238927816) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |h $ {} (:at 1649238929002) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                      |T $ {} (:at 1649238200146) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649238200681) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                          |b $ {} (:at 1649238201302) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649238201595) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649238209785) (:by |rJG4IHzWf) (:text |parent-coord) (:type :leaf)
                                                  |b $ {} (:at 1649238210057) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649238212268) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                      |b $ {} (:at 1649238213910) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |b $ {} (:at 1649238262146) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649238265549) (:by |rJG4IHzWf) (:text |next-tree) (:type :leaf)
                                                  |b $ {} (:at 1649238266639) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649238270808) (:by |rJG4IHzWf) (:text |dissoc-in) (:type :leaf)
                                                      |b $ {} (:at 1649238271644) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                      |h $ {} (:at 1649238274175) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |h $ {} (:at 1649238281064) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649238283345) (:by |rJG4IHzWf) (:text |next-focus) (:type :leaf)
                                                  |b $ {} (:at 1649238283796) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649238288861) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                      |b $ {} (:at 1649238294849) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |D $ {} (:at 1649238295289) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                          |L $ {} (:at 1649238295938) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                          |T $ {} (:at 1649238289125) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649238289800) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                              |b $ {} (:at 1649238294344) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                      |g $ {} (:at 1649238312067) (:by |rJG4IHzWf) (:text |parent-coord) (:type :leaf)
                                                      |l $ {} (:at 1649238303881) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649238314553) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                                          |X $ {} (:at 1649238345473) (:by |rJG4IHzWf) (:text |parent-coord) (:type :leaf)
                                                          |b $ {} (:at 1649238316745) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1649238319505) (:by |rJG4IHzWf) (:text |dec) (:type :leaf)
                                                              |T $ {} (:at 1649238318342) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649238318342) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                                  |b $ {} (:at 1649238318342) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |h $ {} (:at 1649238324560) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649238325394) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1649238328881) (:by |rJG4IHzWf) (:text |next-tree) (:type :leaf)
                                              |h $ {} (:at 1649238330649) (:by |rJG4IHzWf) (:text |next-focus) (:type :leaf)
                                              |l $ {} (:at 1649238332073) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                      |b $ {} (:at 1649239016165) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649239016692) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |T $ {} (:at 1649238959938) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649238961232) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                              |b $ {} (:at 1649238963775) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                              |h $ {} (:at 1649238965310) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |l $ {} (:at 1649238965673) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649238966237) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                  |b $ {} (:at 1649238968016) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649238969643) (:by |rJG4IHzWf) (:text |leaf) (:type :leaf)
                                                  |h $ {} (:at 1649238970736) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649239002606) (:by |rJG4IHzWf) (:text |.slice) (:type :leaf)
                                                      |b $ {} (:at 1649239003250) (:by |rJG4IHzWf) (:text |leaf) (:type :leaf)
                                                      |e $ {} (:at 1649239031842) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                      |h $ {} (:at 1649239004117) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649239004565) (:by |rJG4IHzWf) (:text |dec) (:type :leaf)
                                                          |b $ {} (:at 1649239004885) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649239005479) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                                              |b $ {} (:at 1649239005985) (:by |rJG4IHzWf) (:text |leaf) (:type :leaf)
                                          |b $ {} (:at 1649239025068) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |h $ {} (:at 1649239023026) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |P $ {} (:at 1649242009290) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649242010752) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649242012166) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                              |b $ {} (:at 1649242012926) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649242021366) (:by |rJG4IHzWf) (:text |>=) (:type :leaf)
                                  |T $ {} (:at 1649242133755) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                  |b $ {} (:at 1649242023248) (:by |rJG4IHzWf) (:text |65) (:type :leaf)
                              |h $ {} (:at 1649242012926) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649242030175) (:by |rJG4IHzWf) (:text |<=) (:type :leaf)
                                  |T $ {} (:at 1649242135204) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                  |b $ {} (:at 1649242033346) (:by |rJG4IHzWf) (:text |90) (:type :leaf)
                              |l $ {} (:at 1649256583341) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649256583636) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                  |b $ {} (:at 1649256585898) (:by |rJG4IHzWf) (:text |meta?) (:type :leaf)
                          |b $ {} (:at 1649242035197) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649242040597) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |b $ {} (:at 1649242041081) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649242043651) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649242043651) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                      |b $ {} (:at 1649242043651) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649242043651) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                          |b $ {} (:at 1649242043651) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649242043651) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649242083771) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649242084250) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649242084925) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649242086255) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                      |b $ {} (:at 1649242087459) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                  |h $ {} (:at 1649242105508) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649242106116) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |T $ {} (:at 1649242088663) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649242094788) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                                          |b $ {} (:at 1649242095482) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649242097553) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649242099633) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649242100270) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                              |b $ {} (:at 1649242102596) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |h $ {} (:at 1649242104213) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                                      |b $ {} (:at 1649242108186) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649242111556) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |l $ {} (:at 1649242112344) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649259687480) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |T $ {} (:at 1649242114345) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |b $ {} (:at 1649242115622) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649242125695) (:by |rJG4IHzWf) (:text "|\"not text") (:type :leaf)
                      |R $ {} (:at 1649249956887) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649249960303) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649249960735) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649249963830) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                              |h $ {} (:at 1649249966852) (:by |rJG4IHzWf) (:text "|\"ArrowUp") (:type :leaf)
                          |b $ {} (:at 1649249968161) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649250126295) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649250126971) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250130010) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                  |b $ {} (:at 1649250131876) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649250132474) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649250164375) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |T $ {} (:at 1649250133619) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |b $ {} (:at 1649250135092) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |h $ {} (:at 1649250139348) (:by |rJG4IHzWf) (:text "|\"already at top") (:type :leaf)
                              |l $ {} (:at 1649250139875) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649250165748) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |T $ {} (:at 1649250140719) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |b $ {} (:at 1649250141573) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250143271) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                      |b $ {} (:at 1649250144586) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |h $ {} (:at 1649250145863) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |S $ {} (:at 1649250245179) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649250246248) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649250246460) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649250247285) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                              |h $ {} (:at 1649250250422) (:by |rJG4IHzWf) (:text "|\"ArrowLeft") (:type :leaf)
                          |X $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                  |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |h $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |l $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text "|\"already at root") (:type :leaf)
                              |l $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |>) (:type :leaf)
                                      |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                          |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                  |h $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |h $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                          |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                              |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |h $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |dec) (:type :leaf)
                                              |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                  |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |l $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |h $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649250499714) (:by |rJG4IHzWf) (:text "|\"already at first elelement") (:type :leaf)
                      |ST $ {} (:at 1649250507745) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649250502522) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649250502522) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649250502522) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                              |h $ {} (:at 1649250502522) (:by |rJG4IHzWf) (:text "|\"ArrowRight") (:type :leaf)
                          |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                  |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |l $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text "|\"already at root") (:type :leaf)
                              |l $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                  |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |parent) (:type :leaf)
                                          |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                              |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                              |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649250540223) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                  |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |>=) (:type :leaf)
                                          |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                              |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |dec) (:type :leaf)
                                              |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                                  |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |parent) (:type :leaf)
                                      |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text "|\"already at last elelement") (:type :leaf)
                                      |l $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                  |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |h $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                                  |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                      |b $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649250510580) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |Sj $ {} (:at 1649250615895) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649250616935) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649250617005) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649250618011) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                              |h $ {} (:at 1649250622184) (:by |rJG4IHzWf) (:text "|\"ArrowDown") (:type :leaf)
                          |b $ {} (:at 1649250623662) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649250628685) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |b $ {} (:at 1649250629668) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250629812) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250630834) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                      |b $ {} (:at 1649250633413) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250633413) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                          |b $ {} (:at 1649250633413) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649250633413) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649250637564) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649250637970) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649250639140) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250640130) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                      |b $ {} (:at 1649250641095) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                  |h $ {} (:at 1649250641470) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250642694) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649250643437) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |h $ {} (:at 1649250644998) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649250653944) (:by |rJG4IHzWf) (:text "|\"already reached leaf") (:type :leaf)
                                  |l $ {} (:at 1649250655041) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649250660377) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |b $ {} (:at 1649250660739) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250663091) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                          |b $ {} (:at 1649250664597) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                      |h $ {} (:at 1649250676753) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250676753) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649250676753) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649250676753) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649250682220) (:by |rJG4IHzWf) (:text "|\"it's empty") (:type :leaf)
                                      |l $ {} (:at 1649250683755) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649250685557) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649250686332) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649250686725) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649250687374) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                              |b $ {} (:at 1649250688779) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |h $ {} (:at 1649250689224) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                          |l $ {} (:at 1649250690592) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |Sr $ {} (:at 1649252053949) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649252057864) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649252062000) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649252062965) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                              |h $ {} (:at 1649252065381) (:by |rJG4IHzWf) (:text "|\"Enter") (:type :leaf)
                          |b $ {} (:at 1649252071801) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649252074394) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649252074638) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649252076418) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                  |b $ {} (:at 1649252081561) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649256243510) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649256243986) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |L $ {} (:at 1649256244272) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256245253) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                      |b $ {} (:at 1649256246414) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |P $ {} (:at 1649256246981) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256247556) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649256258362) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649256260868) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649256261802) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                      |h $ {} (:at 1649256269340) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649256269489) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649256269845) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                      |l $ {} (:at 1649256271130) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |T $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |h $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649252088721) (:by |rJG4IHzWf) (:text "|\"at root") (:type :leaf)
                              |l $ {} (:at 1649252105215) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649252105573) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649252107282) (:by |rJG4IHzWf) (:text |shift?) (:type :leaf)
                                  |h $ {} (:at 1649252245704) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649252246342) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |T $ {} (:at 1649252107880) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649252116036) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                          |b $ {} (:at 1649252119001) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649252120015) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252121749) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                              |b $ {} (:at 1649252124563) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649252125710) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252126792) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1649252127144) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252128334) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                              |h $ {} (:at 1649252128702) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252286257) (:by |rJG4IHzWf) (:text |&list:assoc-before) (:type :leaf)
                                                  |b $ {} (:at 1649252234936) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                  |h $ {} (:at 1649252238737) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649252239610) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                      |b $ {} (:at 1649252240577) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |l $ {} (:at 1649252242089) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                      |b $ {} (:at 1649252249278) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649252250139) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |l $ {} (:at 1649252245704) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649252246342) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |T $ {} (:at 1649252107880) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649252116036) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                          |b $ {} (:at 1649252119001) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649252120015) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252121749) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                              |b $ {} (:at 1649252124563) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649252125710) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252126792) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1649252127144) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252128334) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                              |h $ {} (:at 1649252128702) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252289505) (:by |rJG4IHzWf) (:text |&list:assoc-after) (:type :leaf)
                                                  |b $ {} (:at 1649252234936) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                  |h $ {} (:at 1649252238737) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649252239610) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                      |b $ {} (:at 1649252240577) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |l $ {} (:at 1649252242089) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                      |b $ {} (:at 1649252265247) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649252268445) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                          |T $ {} (:at 1649252260241) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649252264885) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                              |T $ {} (:at 1649252249278) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |b $ {} (:at 1649252269254) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252270316) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649252270844) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252271408) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                  |b $ {} (:at 1649252272209) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649252250139) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |St $ {} (:at 1649252053949) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649252057864) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649252062000) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649252062965) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                              |h $ {} (:at 1649256761332) (:by |rJG4IHzWf) (:text "|\" ") (:type :leaf)
                          |b $ {} (:at 1649252071801) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649252074394) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649252074638) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649252076418) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                  |b $ {} (:at 1649252081561) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649256243510) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649256243986) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |L $ {} (:at 1649256244272) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256245253) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                      |b $ {} (:at 1649256246414) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |P $ {} (:at 1649256246981) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256247556) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649256258362) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649256260868) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649256261802) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                      |h $ {} (:at 1649256269340) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649256269489) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                          |b $ {} (:at 1649256269845) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                      |l $ {} (:at 1649256271130) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |T $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |h $ {} (:at 1649252084764) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649252088721) (:by |rJG4IHzWf) (:text "|\"at root") (:type :leaf)
                              |l $ {} (:at 1649252105215) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649252105573) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649252107282) (:by |rJG4IHzWf) (:text |shift?) (:type :leaf)
                                  |h $ {} (:at 1649256809993) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649256810986) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |L $ {} (:at 1649256811986) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649256812108) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649256813027) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |b $ {} (:at 1649256816441) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649256816441) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                                  |b $ {} (:at 1649256816441) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                  |h $ {} (:at 1649256816441) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |T $ {} (:at 1649259813736) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649259814276) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |L $ {} (:at 1649259814844) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649259815913) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                              |b $ {} (:at 1649259817948) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                          |T $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                                                  |b $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                  |h $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |l $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                      |b $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                                      |h $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                                              |h $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |l $ {} (:at 1649256835661) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                          |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                                  |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                  |h $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                      |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |l $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                      |h $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649259828540) (:by |rJG4IHzWf) (:text |&list:assoc-before) (:type :leaf)
                                                          |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                          |h $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                              |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |l $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                              |h $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                                  |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                      |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |h $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                                      |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                          |b $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |l $ {} (:at 1649259824227) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |l $ {} (:at 1649252245704) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649252246342) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |T $ {} (:at 1649252107880) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649252116036) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                          |b $ {} (:at 1649252119001) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649252120015) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252121749) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                              |b $ {} (:at 1649252124563) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649252125710) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252126792) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1649252127144) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252128334) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                              |h $ {} (:at 1649252128702) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252289505) (:by |rJG4IHzWf) (:text |&list:assoc-after) (:type :leaf)
                                                  |b $ {} (:at 1649252234936) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                  |h $ {} (:at 1649252238737) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649252239610) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                      |b $ {} (:at 1649252240577) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |l $ {} (:at 1649252242089) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                      |b $ {} (:at 1649252265247) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649252268445) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                          |T $ {} (:at 1649252260241) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649252264885) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                              |T $ {} (:at 1649252249278) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |b $ {} (:at 1649252269254) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649252270316) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                                              |b $ {} (:at 1649252270844) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649252271408) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                  |b $ {} (:at 1649252272209) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649252250139) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |Sv $ {} (:at 1649254926802) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649254926371) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649254926371) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                              |b $ {} (:at 1649254926371) (:by |rJG4IHzWf) (:text "|\"Tab") (:type :leaf)
                              |h $ {} (:at 1649254930383) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                          |b $ {} (:at 1649254931436) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649254932511) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649254934216) (:by |rJG4IHzWf) (:text |shift?) (:type :leaf)
                              |g $ {} (:at 1649255043725) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649255043989) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649255049582) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649255051723) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                                      |b $ {} (:at 1649255053167) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                  |h $ {} (:at 1649255054732) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649255056380) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649255058423) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |h $ {} (:at 1649255059174) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649255075830) (:by |rJG4IHzWf) (:text "|\"not working for root") (:type :leaf)
                                  |l $ {} (:at 1649255077774) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649255080809) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                      |b $ {} (:at 1649255081093) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649255081244) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649255090990) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |b $ {} (:at 1649255093710) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649255094707) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                                  |b $ {} (:at 1649255101590) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                  |h $ {} (:at 1649255103670) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649255105477) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649255105818) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                          |b $ {} (:at 1649255108890) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649255109773) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                              |b $ {} (:at 1649255111587) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                          |h $ {} (:at 1649256896920) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649256898357) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                              |L $ {} (:at 1649256898708) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649256898858) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649256900316) (:by |rJG4IHzWf) (:text |parent) (:type :leaf)
                                                      |b $ {} (:at 1649256900666) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649256902202) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                                          |b $ {} (:at 1649256903566) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                          |h $ {} (:at 1649256904264) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649256905723) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                              |b $ {} (:at 1649256906969) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |T $ {} (:at 1649256911020) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1649256911514) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                  |L $ {} (:at 1649256911978) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649256912119) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                                      |b $ {} (:at 1649256913143) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                      |h $ {} (:at 1649256913473) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649256914678) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                                          |b $ {} (:at 1649256915393) (:by |rJG4IHzWf) (:text |parent) (:type :leaf)
                                                  |P $ {} (:at 1649256943455) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649256945233) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |T $ {} (:at 1649256918613) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649256930767) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                                                          |b $ {} (:at 1649256931914) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                          |h $ {} (:at 1649256935524) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649256935524) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                              |b $ {} (:at 1649256935524) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |l $ {} (:at 1649256939668) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649256939668) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                                              |b $ {} (:at 1649256939668) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                              |h $ {} (:at 1649256939668) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                      |b $ {} (:at 1649256946016) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649256948646) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                          |b $ {} (:at 1649256949499) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                      |h $ {} (:at 1649256950777) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                                  |T $ {} (:at 1649255114011) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649255114011) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                      |b $ {} (:at 1649255114011) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                      |h $ {} (:at 1649255114011) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                      |l $ {} (:at 1649255116598) (:by |rJG4IHzWf) (:text "|\"not working for leaf") (:type :leaf)
                                          |l $ {} (:at 1649255196305) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649255196977) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |T $ {} (:at 1649255175827) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649255126972) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                                  |b $ {} (:at 1649255160499) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                                  |h $ {} (:at 1649255189263) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649255191250) (:by |rJG4IHzWf) (:text |butlast) (:type :leaf)
                                                      |T $ {} (:at 1649255170401) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                  |l $ {} (:at 1649255170878) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649255171136) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1649255171446) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649255172772) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                      |h $ {} (:at 1649255180157) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649255180553) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                                          |b $ {} (:at 1649255182348) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649255183515) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649255182837) (:by |rJG4IHzWf) (:text |i) (:type :leaf)
                                                                  |b $ {} (:at 1649255184456) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649255185034) (:by |rJG4IHzWf) (:text |last) (:type :leaf)
                                                                      |b $ {} (:at 1649255186092) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                                          |h $ {} (:at 1649255247506) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |D $ {} (:at 1649255248172) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                                              |L $ {} (:at 1649255255227) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                              |T $ {} (:at 1649255193367) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649255230251) (:by |rJG4IHzWf) (:text |splice-after) (:type :leaf)
                                                                  |h $ {} (:at 1649255232509) (:by |rJG4IHzWf) (:text |i) (:type :leaf)
                                                                  |l $ {} (:at 1649255243024) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1649255243484) (:by |rJG4IHzWf) (:text |get) (:type :leaf)
                                                                      |b $ {} (:at 1649255243947) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                                                      |h $ {} (:at 1649255244282) (:by |rJG4IHzWf) (:text |i) (:type :leaf)
                                                              |b $ {} (:at 1649255250131) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649255250943) (:by |rJG4IHzWf) (:text |dissoc) (:type :leaf)
                                                                  |b $ {} (:at 1649255251311) (:by |rJG4IHzWf) (:text |i) (:type :leaf)
                                              |b $ {} (:at 1649255200656) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                              |h $ {} (:at 1649255202575) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                              |l $ {} (:at 1649254942809) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649254953040) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649254955609) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649254959218) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                      |b $ {} (:at 1649254957022) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |h $ {} (:at 1649254961436) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649254962017) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649254962260) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                          |b $ {} (:at 1649254962981) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649254963413) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                          |h $ {} (:at 1649254964248) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649254967360) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1649254968065) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                                  |h $ {} (:at 1649254969291) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649254970265) (:by |rJG4IHzWf) (:text |conj) (:type :leaf)
                                      |b $ {} (:at 1649254973486) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649254973759) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                  |l $ {} (:at 1649254976375) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |Sx $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649256613283) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649256615724) (:by |rJG4IHzWf) (:text |and) (:type :leaf)
                              |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |=) (:type :leaf)
                                  |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                  |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                      |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                              |b $ {} (:at 1649256616277) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649256617192) (:by |rJG4IHzWf) (:text |not) (:type :leaf)
                                  |b $ {} (:at 1649256618205) (:by |rJG4IHzWf) (:text |meta?) (:type :leaf)
                          |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                      |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                          |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                              |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                  |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |string?) (:type :leaf)
                                      |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                  |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                                          |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                          |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                              |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |target) (:type :leaf)
                                              |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |key) (:type :leaf)
                                      |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |l $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                                  |l $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649259732705) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |T $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |b $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649256474600) (:by |rJG4IHzWf) (:text "|\"not text") (:type :leaf)
                      |T $ {} (:at 1649237856304) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649237878303) (:by |rJG4IHzWf) (:text |true) (:type :leaf)
                          |T $ {} (:at 1649237879111) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649237879672) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                              |L $ {} (:at 1649237880302) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649237880302) (:by |rJG4IHzWf) (:text |js/console.log) (:type :leaf)
                                  |b $ {} (:at 1649997686957) (:by |rJG4IHzWf) (:text "|\"unknown event:") (:type :leaf)
                                  |h $ {} (:at 1649997689598) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                              |T $ {} (:at 1649235124330) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649235137522) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |T $ {} (:at 1649235133643) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                  |b $ {} (:at 1649235136146) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
          |splice-after $ {} (:at 1649255256536) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1649255256536) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1649255256536) (:by |rJG4IHzWf) (:text |splice-after) (:type :leaf)
              |h $ {} (:at 1649255256536) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1649255259575) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                  |T $ {} (:at 1649255256536) (:by |rJG4IHzWf) (:text |i) (:type :leaf)
                  |b $ {} (:at 1649255262312) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
              |l $ {} (:at 1649255267367) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1649255268540) (:by |rJG4IHzWf) (:text |loop) (:type :leaf)
                  |b $ {} (:at 1649255302874) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1649255318533) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649255319082) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                          |b $ {} (:at 1649255319857) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |T $ {} (:at 1649255303180) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649255305466) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                          |b $ {} (:at 1649255305839) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649255306925) (:by |rJG4IHzWf) (:text |reverse) (:type :leaf)
                              |b $ {} (:at 1649255308415) (:by |rJG4IHzWf) (:text |ys) (:type :leaf)
                  |h $ {} (:at 1649255321100) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649255324112) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                      |b $ {} (:at 1649255325334) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649255326734) (:by |rJG4IHzWf) (:text |empty?) (:type :leaf)
                          |b $ {} (:at 1649255328699) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                      |h $ {} (:at 1649255329829) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                      |l $ {} (:at 1649255348759) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649255350817) (:by |rJG4IHzWf) (:text |recur) (:type :leaf)
                          |T $ {} (:at 1649255331092) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649255339531) (:by |rJG4IHzWf) (:text |&list:assoc-after) (:type :leaf)
                              |b $ {} (:at 1649255918215) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                              |h $ {} (:at 1649255340897) (:by |rJG4IHzWf) (:text |i) (:type :leaf)
                              |l $ {} (:at 1649255346510) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649255346363) (:by |rJG4IHzWf) (:text |first) (:type :leaf)
                                  |b $ {} (:at 1649255347718) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                          |b $ {} (:at 1649255356932) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649255358493) (:by |rJG4IHzWf) (:text |rest) (:type :leaf)
                              |b $ {} (:at 1649255359324) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
          |updater $ {} (:id |SkS1lout5aBb) (:time 1499755354983) (:type :expr)
            :data $ {}
              |T $ {} (:author |root) (:id |H1U1esuY5TBZ) (:text |defn) (:time 1499755354983) (:type :leaf)
              |j $ {} (:author |root) (:id |SJwJxj_Y5aHZ) (:text |updater) (:time 1499755354983) (:type :leaf)
              |r $ {} (:id |SkdkeiOK5TBZ) (:time 1499755354983) (:type :expr)
                :data $ {}
                  |T $ {} (:author |root) (:id |r1YyxidF96rW) (:text |store) (:time 1499755354983) (:type :leaf)
                  |j $ {} (:author |root) (:id |r1cJxouK5aSZ) (:text |op) (:time 1499755354983) (:type :leaf)
                  |r $ {} (:author |root) (:id |Bkj1ljdY5Tr-) (:text |op-data) (:time 1499755354983) (:type :leaf)
                  |v $ {} (:at 1519489491135) (:by |root) (:id |S1gUCbfy_G) (:text |op-id) (:type :leaf)
                  |x $ {} (:at 1519489492110) (:by |root) (:id |ryzsAWMkdG) (:text |op-time) (:type :leaf)
              |x $ {} (:at 1580869931366) (:by |rJG4IHzWf) (:id |s_R_AYO4o) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1629647951331) (:by |rJG4IHzWf) (:id |Uqicc0fZj) (:text |case-default) (:type :leaf)
                  |j $ {} (:at 1580869931366) (:by |rJG4IHzWf) (:id |zBWc-0aP9) (:text |op) (:type :leaf)
                  |n $ {} (:at 1629647954553) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1629647954553) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                      |j $ {} (:at 1629647954553) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649997278711) (:by |rJG4IHzWf) (:text |eprintln) (:type :leaf)
                          |j $ {} (:at 1629647954553) (:by |rJG4IHzWf) (:text "|\"unknown op") (:type :leaf)
                          |r $ {} (:at 1629647954553) (:by |rJG4IHzWf) (:text |op) (:type :leaf)
                          |v $ {} (:at 1629647954553) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                      |r $ {} (:at 1629647954553) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                  |p $ {} (:at 1649786890692) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649786893898) (:by |rJG4IHzWf) (:text |:load-files) (:type :leaf)
                      |b $ {} (:at 1649846264015) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649846265105) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                          |P $ {} (:at 1649846267112) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |T $ {} (:at 1649786898185) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649786899230) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                              |b $ {} (:at 1649846270494) (:by |rJG4IHzWf) (:text |) (:type :leaf)
                              |h $ {} (:at 1649786905398) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                              |l $ {} (:at 1649786917108) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                          |b $ {} (:at 1649786898185) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649786899230) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                              |b $ {} (:at 1649846270494) (:by |rJG4IHzWf) (:text |) (:type :leaf)
                              |h $ {} (:at 1649846274726) (:by |rJG4IHzWf) (:text |:saved-files) (:type :leaf)
                              |l $ {} (:at 1649786917108) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                  |r $ {} (:at 1649235079864) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649235083430) (:by |rJG4IHzWf) (:text |:cirru-edit) (:type :leaf)
                      |b $ {} (:at 1649849888097) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649849889891) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |L $ {} (:at 1649849890548) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649849890677) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649849891933) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                                  |b $ {} (:at 1649850010689) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649850017191) (:by |rJG4IHzWf) (:text |prepend) (:type :leaf)
                                      |T $ {} (:at 1649849892312) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849898497) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                          |b $ {} (:at 1649849901636) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                      |b $ {} (:at 1649850015606) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                              |b $ {} (:at 1649849902479) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649849904573) (:by |rJG4IHzWf) (:text |def-target) (:type :leaf)
                                  |b $ {} (:at 1649849904840) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649849914068) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                      |b $ {} (:at 1649849914739) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                      |l $ {} (:at 1649849920227) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849921714) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                          |b $ {} (:at 1649849923772) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                          |P $ {} (:at 1649849970665) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649849970665) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649849970665) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649996772981) (:by |rJG4IHzWf) (:text |tuple?) (:type :leaf)
                                  |b $ {} (:at 1649849970665) (:by |rJG4IHzWf) (:text |def-target) (:type :leaf)
                              |h $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |let[]) (:type :leaf)
                                  |b $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |b $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |h $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |warning) (:type :leaf)
                                  |h $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |cirru-edit) (:type :leaf)
                                      |b $ {} (:at 1649850106751) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1649996561874) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                          |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |def-target) (:type :leaf)
                                          |b $ {} (:at 1649850109903) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                      |h $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                                          |b $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                      |l $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                                  |l $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |b $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |some?) (:type :leaf)
                                          |b $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |warning) (:type :leaf)
                                      |h $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |js/console.warn) (:type :leaf)
                                          |b $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |warning) (:type :leaf)
                                  |o $ {} (:at 1649849984963) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649849986937) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                      |L $ {} (:at 1649849987707) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                      |P $ {} (:at 1649849988623) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849994043) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                                          |b $ {} (:at 1649850007281) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                                          |h $ {} (:at 1649850124158) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649850126222) (:by |rJG4IHzWf) (:text |::) (:type :leaf)
                                              |L $ {} (:at 1649850127872) (:by |rJG4IHzWf) (:text |'quote) (:type :leaf)
                                              |T $ {} (:at 1649850031546) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                                      |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                          |o $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                                          |q $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |s $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |:warning) (:type :leaf)
                                          |t $ {} (:at 1649849973121) (:by |rJG4IHzWf) (:text |warning) (:type :leaf)
                              |l $ {} (:at 1649850047248) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649850049281) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                  |b $ {} (:at 1649850050030) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                  |h $ {} (:at 1649850051874) (:by |rJG4IHzWf) (:text |:warning) (:type :leaf)
                                  |l $ {} (:at 1649850053884) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649850058277) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                      |b $ {} (:at 1649850062657) (:by |rJG4IHzWf) (:text "|\"target not found at:") (:type :leaf)
                                      |h $ {} (:at 1649850064525) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                  |rT $ {} (:at 1649999058091) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649999061911) (:by |rJG4IHzWf) (:text |:cirru-edit-node) (:type :leaf)
                      |b $ {} (:at 1649999065726) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649999087524) (:by |rJG4IHzWf) (:text |let-sugar) (:type :leaf)
                          |b $ {} (:at 1649999094750) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649999088628) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649999067139) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649999090131) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |T $ {} (:at 1649999340190) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                      |b $ {} (:at 1649999073770) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                                  |b $ {} (:at 1649999092565) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                              |b $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                                  |b $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:text |prepend) (:type :leaf)
                                      |b $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                                          |b $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                      |h $ {} (:at 1649999229049) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                              |h $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:text |def-target) (:type :leaf)
                                  |b $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                      |b $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                      |h $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:text |get-in) (:type :leaf)
                                          |b $ {} (:at 1649999231596) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                          |h $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |tuple?) (:type :leaf)
                                  |b $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |def-target) (:type :leaf)
                              |h $ {} (:at 1649999361561) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |D $ {} (:at 1649999369582) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                                  |L $ {} (:at 1649999370351) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                  |P $ {} (:at 1649999382132) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                                  |T $ {} (:at 1649999357662) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1649999358827) (:by |rJG4IHzWf) (:text |::) (:type :leaf)
                                      |L $ {} (:at 1649999360278) (:by |rJG4IHzWf) (:text |'quote) (:type :leaf)
                                      |T $ {} (:at 1649999317573) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649999320483) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                                          |b $ {} (:at 1649999324708) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649999324708) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                              |b $ {} (:at 1649999324708) (:by |rJG4IHzWf) (:text |def-target) (:type :leaf)
                                              |h $ {} (:at 1649999324708) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                          |h $ {} (:at 1649999342154) (:by |rJG4IHzWf) (:text |focus) (:type :leaf)
                                          |l $ {} (:at 1649999346107) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                              |l $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                  |b $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                  |h $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |:warning) (:type :leaf)
                                  |l $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                      |b $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text "|\"target not found at:") (:type :leaf)
                                      |h $ {} (:at 1649999235262) (:by |rJG4IHzWf) (:text |def-path) (:type :leaf)
                  |s $ {} (:at 1649849664112) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649849666625) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                      |b $ {} (:at 1649849666909) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649849682225) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                          |b $ {} (:at 1649849683031) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |h $ {} (:at 1649849684934) (:by |rJG4IHzWf) (:text |:def-path) (:type :leaf)
                          |l $ {} (:at 1649849686327) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                  |t $ {} (:at 1649236417648) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649236419279) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                      |b $ {} (:at 1649236419583) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649236420697) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                          |b $ {} (:at 1649236422391) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |h $ {} (:at 1649236423256) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                          |l $ {} (:at 1649236424471) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                  |u $ {} (:at 1649337106547) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649337109197) (:by |rJG4IHzWf) (:text |:replace-tree) (:type :leaf)
                      |b $ {} (:at 1649337110164) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649337111773) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                          |b $ {} (:at 1649337112542) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |h $ {} (:at 1649337316524) (:by |rJG4IHzWf) (:text |:code-tree) (:type :leaf)
                          |l $ {} (:at 1649337120732) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                          |o $ {} (:at 1649337121820) (:by |rJG4IHzWf) (:text |:focus) (:type :leaf)
                          |q $ {} (:at 1649337122210) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649337122407) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                          |s $ {} (:at 1649337127723) (:by |rJG4IHzWf) (:text |:warning) (:type :leaf)
                          |t $ {} (:at 1649337128485) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |v $ {} (:at 1649963829674) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649963830383) (:by |rJG4IHzWf) (:text |:warn) (:type :leaf)
                      |b $ {} (:at 1649963831166) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649963832686) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                          |b $ {} (:at 1649963833956) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |h $ {} (:at 1649963835055) (:by |rJG4IHzWf) (:text |:warning) (:type :leaf)
                          |l $ {} (:at 1649963843596) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                  |vD $ {} (:at 1649964175859) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649964177135) (:by |rJG4IHzWf) (:text |:add-ns) (:type :leaf)
                      |b $ {} (:at 1649964286256) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1649964287352) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |L $ {} (:at 1649964287626) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964289143) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964287936) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                  |b $ {} (:at 1649964291397) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649964291397) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                                      |b $ {} (:at 1649964291397) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                                      |h $ {} (:at 1649964291397) (:by |rJG4IHzWf) (:text "|\"TODO_NS") (:type :leaf)
                          |T $ {} (:at 1649964177558) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964182074) (:by |rJG4IHzWf) (:text |assoc-in) (:type :leaf)
                              |b $ {} (:at 1649964179826) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |h $ {} (:at 1649964184659) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964185387) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649964186243) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                                  |h $ {} (:at 1649964292830) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                              |l $ {} (:at 1649964216558) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964217626) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1649964217947) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649964218436) (:by |rJG4IHzWf) (:text |:ns) (:type :leaf)
                                      |b $ {} (:at 1649964219710) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649964269707) (:by |rJG4IHzWf) (:text |::) (:type :leaf)
                                          |X $ {} (:at 1649964271678) (:by |rJG4IHzWf) (:text |'quote) (:type :leaf)
                                          |b $ {} (:at 1649964236163) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649964274054) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |T $ {} (:at 1649964808891) (:by |rJG4IHzWf) (:text "|\"ns") (:type :leaf)
                                              |b $ {} (:at 1649964809224) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                  |h $ {} (:at 1649964227140) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649964227847) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                      |b $ {} (:at 1649964228337) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649964228675) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |vL $ {} (:at 1649964301870) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649964303178) (:by |rJG4IHzWf) (:text |:rm-ns) (:type :leaf)
                      |b $ {} (:at 1649964312715) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649964313987) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                          |b $ {} (:at 1649964314690) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964315408) (:by |rJG4IHzWf) (:text |some?) (:type :leaf)
                              |b $ {} (:at 1649964316844) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                          |h $ {} (:at 1649964317705) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964324410) (:by |rJG4IHzWf) (:text |dissoc-in) (:type :leaf)
                              |b $ {} (:at 1649964325688) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |h $ {} (:at 1649964325956) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964326120) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649964327771) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                                  |h $ {} (:at 1649964330421) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                          |l $ {} (:at 1649964335841) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                  |vP $ {} (:at 1649964531781) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649964533685) (:by |rJG4IHzWf) (:text |:add-def) (:type :leaf)
                      |b $ {} (:at 1649964535990) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649964549170) (:by |rJG4IHzWf) (:text |let[]) (:type :leaf)
                          |X $ {} (:at 1649964549912) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964550665) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                              |b $ {} (:at 1649964553143) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                          |e $ {} (:at 1649964557465) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1649964558215) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |T $ {} (:at 1649964557199) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                              |b $ {} (:at 1649964559455) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964559734) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649964564889) (:by |rJG4IHzWf) (:text "|\"TODO_NS") (:type :leaf)
                                  |h $ {} (:at 1649964567473) (:by |rJG4IHzWf) (:text "|\"TODO_DEF") (:type :leaf)
                          |j $ {} (:at 1649964578609) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649964581584) (:by |rJG4IHzWf) (:text |update) (:type :leaf)
                              |b $ {} (:at 1649964585887) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |h $ {} (:at 1649964593431) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                              |l $ {} (:at 1649964594098) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649964594393) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                  |b $ {} (:at 1649964594631) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649964595469) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |h $ {} (:at 1649964596143) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649964596583) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |b $ {} (:at 1649964597049) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649964599503) (:by |rJG4IHzWf) (:text |contains?) (:type :leaf)
                                          |b $ {} (:at 1649964605699) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                          |h $ {} (:at 1649964606664) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                      |e $ {} (:at 1649964619570) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649965044156) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                          |b $ {} (:at 1649964623190) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                          |h $ {} (:at 1649965045895) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1649965046512) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |L $ {} (:at 1649965047238) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                              |T $ {} (:at 1649964630158) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                          |l $ {} (:at 1649964630821) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649964631081) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1649964631338) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649964631875) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                              |h $ {} (:at 1649964632766) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649964633243) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                  |b $ {} (:at 1649964633489) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649964634533) (:by |rJG4IHzWf) (:text |contains?) (:type :leaf)
                                                      |b $ {} (:at 1649964635226) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                      |h $ {} (:at 1649964641951) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                  |h $ {} (:at 1649964645406) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                  |l $ {} (:at 1649964646027) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649964650908) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                                      |b $ {} (:at 1649964652180) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                      |h $ {} (:at 1649964660584) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                      |l $ {} (:at 1649964664508) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1649964665260) (:by |rJG4IHzWf) (:text |::) (:type :leaf)
                                                          |b $ {} (:at 1649964666566) (:by |rJG4IHzWf) (:text |'quote) (:type :leaf)
                                                          |h $ {} (:at 1649964667498) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1649964670463) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                              |b $ {} (:at 1649964811648) (:by |rJG4IHzWf) (:text "|\"defn") (:type :leaf)
                                                              |h $ {} (:at 1649964683921) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                              |l $ {} (:at 1649964688593) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1649964689763) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                      |h $ {} (:at 1649964611966) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                  |vR $ {} (:at 1649965092473) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1649965096128) (:by |rJG4IHzWf) (:text |:rm-def) (:type :leaf)
                      |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |let[]) (:type :leaf)
                          |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                              |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                          |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |or) (:type :leaf)
                              |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                              |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text "|\"TODO_NS") (:type :leaf)
                                  |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text "|\"TODO_DEF") (:type :leaf)
                          |o $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |update) (:type :leaf)
                              |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |:files) (:type :leaf)
                              |l $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                  |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                  |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                      |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |contains?) (:type :leaf)
                                          |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                          |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                      |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |update-in) (:type :leaf)
                                          |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                                          |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
                                              |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |:defs) (:type :leaf)
                                          |l $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                              |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                              |l $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                                                  |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |contains?) (:type :leaf)
                                                      |b $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                      |h $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                  |h $ {} (:at 1649965106283) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1649965107986) (:by |rJG4IHzWf) (:text |dissoc) (:type :leaf)
                                                      |T $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                                      |b $ {} (:at 1649965110751) (:by |rJG4IHzWf) (:text |def-name) (:type :leaf)
                                                  |l $ {} (:at 1649965113472) (:by |rJG4IHzWf) (:text |defs) (:type :leaf)
                                      |l $ {} (:at 1649965099741) (:by |rJG4IHzWf) (:text |files) (:type :leaf)
                  |vT $ {} (:at 1582981296158) (:by |rJG4IHzWf) (:id |zMkR-WOan) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1582981296158) (:by |rJG4IHzWf) (:id |IpRMltG4P) (:text |:states) (:type :leaf)
                      |b $ {} (:at 1629647937231) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1629647938990) (:by |rJG4IHzWf) (:text |update-states) (:type :leaf)
                          |j $ {} (:at 1629647940709) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |r $ {} (:at 1629647941905) (:by |rJG4IHzWf) (:text |op-data) (:type :leaf)
                  |w $ {} (:at 1580869940154) (:by |rJG4IHzWf) (:id |FHl_ktz1Y) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1580869940154) (:by |rJG4IHzWf) (:id |tG2U_VwJq) (:text |:hydrate-storage) (:type :leaf)
                      |j $ {} (:at 1580869940154) (:by |rJG4IHzWf) (:id |_BBu440tb) (:text |op-data) (:type :leaf)
        :ns $ {} (:id |B1Z1gjdFqaBZ) (:time 1499755354983) (:type :expr)
          :data $ {}
            |T $ {} (:author |root) (:id |SkG1lo_t9pHZ) (:text |ns) (:time 1499755354983) (:type :leaf)
            |j $ {} (:author |root) (:id |B17kxjdFq6r-) (:text |app.updater) (:time 1499755354983) (:type :leaf)
            |r $ {} (:at 1629647934184) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |D $ {} (:at 1629647935135) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |T $ {} (:at 1629647926714) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1629647933788) (:by |rJG4IHzWf) (:text |phlox.cursor) (:type :leaf)
                    |j $ {} (:at 1629647929559) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |r $ {} (:at 1629647929753) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1629647931811) (:by |rJG4IHzWf) (:text |update-states) (:type :leaf)
        :proc $ {} (:id |HJ41lsuY5pSZ) (:time 1499755354983) (:type :expr)
          :data $ {}
      |app.widget $ {}
        :configs $ {}
        :defs $ {}
          |button $ {} (:at 1650135673103) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1650135708805) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1650135673103) (:by |rJG4IHzWf) (:text |button) (:type :leaf)
              |h $ {} (:at 1650135673103) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1650135710329) (:by |rJG4IHzWf) (:text |merge) (:type :leaf)
                  |b $ {} (:at 1650135724185) (:by |rJG4IHzWf) (:text |ui/button) (:type :leaf)
                  |h $ {} (:at 1650135733449) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1650135733805) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1650135734125) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1650135736389) (:by |rJG4IHzWf) (:text |:background) (:type :leaf)
                          |b $ {} (:at 1650135738575) (:by |rJG4IHzWf) (:text |:black) (:type :leaf)
        :ns $ {} (:at 1650135669875) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1650135669875) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1650135669875) (:by |rJG4IHzWf) (:text |app.widget) (:type :leaf)
            |h $ {} (:at 1650135713065) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1650135713818) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |b $ {} (:at 1650135714088) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1650135717449) (:by |rJG4IHzWf) (:text |respo-ui.core) (:type :leaf)
                    |b $ {} (:at 1650135720135) (:by |rJG4IHzWf) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1650135720512) (:by |rJG4IHzWf) (:text |ui) (:type :leaf)
  :users $ {}
    |rJG4IHzWf $ {} (:avatar nil) (:id |rJG4IHzWf) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |root $ {} (:avatar nil) (:id |root) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
