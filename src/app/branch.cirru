
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math

var
  ({}~ circle) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-branch

  :propTypes $ {}
    :point React.PropTypes.object.isRequired
    :vector React.PropTypes.object.isRequired
    :isFocused React.PropTypes.bool.isRequired
    :currentCoord React.PropTypes.array.isRequired
    :onClick React.PropTypes.func.isRequired

  :onClick $ \ ()
    @props.onClick @props.currentCoord

  :render $ \ ()
    circle
      {} (:cx @props.point.x) (:cy @props.point.y) (:r 6)
        :fill $ ... (Color) (hsl 180 40 70) (hslString)
        :onClick @onClick
        :style (@styleRoot)
        :draggable true

  :styleRoot $ \ ()
    {}
      :cursor :pointer
