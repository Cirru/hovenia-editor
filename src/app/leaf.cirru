
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math

var
  ({}~ input line g) React.DOM
  foreignObject $ React.createFactory :foreignObject

= module.exports $ React.createClass $ {}
  :displayName :app-leaf

  :propTypes $ {}
    :point React.PropTypes.object.isRequired
    :vector React.PropTypes.object.isRequired
    :text React.PropTypes.string.isRequired
    :isFocused React.PropTypes.bool.isRequired

  :onChange $ \ (event)
    console.log :onChange event.target.value

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
      foreignObject
        {}
          :y @props.point.y
          :x @props.point.x
          :width :200px
          :height :30px
        input $ {}
          :value @props.text
          :style (@styleInput)
          :onChange @onChange

  :styleInput $ \ ()
    {}
      :fontSize 14
      :backgroundColor $ ... (Color) (hsl 120 40 70 0.5) (hslString)
      :outline :none
      :border :none
      :width :60px

  :styleLine $ \ ()
    {}
      :stroke $ ... (Color) (hsl 120 20 30 0.7) (hslString)
      :strokeWidth 2
