
var
  React $ require :react
  Immutable $ require :immutable

var
  data $ require :../../data/updater.json

var
  Fractal $ React.createFactory $ require :./fractal

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :getInitialState $ \ ()
    {}
      :coord $ [] 0
      :tree $ Immutable.fromJS data

  :onCoordClick $ \ (coord)
    @setState $ {} (:coord coord)

  :render $ \ ()
    div ({})
      Fractal $ {}
        :tree @state.tree
        :coord @state.coord
        :onCoordClick @onCoordClick
