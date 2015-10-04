
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math

var
  ({}~ input) React.DOM
  foreignObject $ React.createFactory :foreignObject

= module.exports $ React.createClass $ {}
  :displayName :app-leaf

  :propTypes $ {}
    :point React.PropTypes.object.isRequired
    :vector React.PropTypes.object.isRequired
    :text React.PropTypes.string.isRequired
    :currentCoord React.PropTypes.array.isRequired
    :isFocused React.PropTypes.bool.isRequired
    :onClick React.PropTypes.func.isRequired

  :onChange $ \ (event)
    console.log :onChange event.target.value

  :onClick $ \ (event)
    @props.onClick @props.currentCoord

  :render $ \ ()
    foreignObject
      {}
        :y $ - @props.point.y 5
        :x $ - @props.point.x 10
        :width :200px
        :height :30px
        :style (@styleRoot)
      input $ {}
        :value @props.text
        :style (@styleInput @props.text)
        :onChange @onChange
        :onClick @onClick

  :styleRoot $ \ ()
    {}
      :transitionDuration :400ms

  :styleInput $ \ (text)
    {}
      :fontSize 14
      :fontFamily ":Menlo, Consolas, monospace"
      :backgroundColor $ ... (Color) (hsl 120 40 70 0.5) (hslString)
      :outline :none
      :border :none
      :width $ * text.length 10
