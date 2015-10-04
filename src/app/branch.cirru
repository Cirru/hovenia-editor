
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math

var
  ({}~ circle g line) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-branch

  :propTypes $ {}
    :point React.PropTypes.object.isRequired
    :vector React.PropTypes.object.isRequired
    :isFocused React.PropTypes.bool.isRequired

  :render $ \ ()
    var
      from $ math.minus @props.point @props.vector
    g ({})
      line $ {}
        :x1 from.x
        :y1 from.y
        :x2 @props.point.x
        :y2 @props.point.y
        :style (@styleLine)
      circle
        {} (:cx @props.point.x) (:cy @props.point.y) (:r 10)
          :fill $ ... (Color) (hsl 200 40 50) (hslString)

  :styleLine $ \ ()
    {}
      :stroke $ ... (Color) (hsl 0 20 20) (hslString)
      :strokeWidth 2
