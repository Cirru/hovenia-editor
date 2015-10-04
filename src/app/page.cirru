
var
  React $ require :react
  Immutable $ require :immutable

var
  data $ require :../../data/demo.json
  stencil $ require :../config/stencil

var
  Fractal $ React.createFactory $ require :./fractal

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :getInitialState $ \ ()
    {}
      :coord $ []
      :tree $ Immutable.fromJS data

  :render $ \ ()
    div ({})
      Fractal $ {}
        :tree @state.tree
        :coord @state.coord
