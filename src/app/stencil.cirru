
var
  React $ require :react/addons
  Color $ require :color
  keycode $ require :keycode

var
  math $ require :../util/math

var
  ({}~ g circle) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-stencil
  :mixins $ [] React.addons.PureRenderMixin

  :propTypes $ {}
    :base React.PropTypes.object.isRequired
    :top React.PropTypes.object.isRequired
    :down React.PropTypes.object.isRequired
    :right React.PropTypes.object.isRequired
    :onChange React.PropTypes.func.isRequired

  :getInitialState $ \ ()
    {}
      :zero $ {} (:x 0) (:y 0)

  :onPositionChange $ \ (field event)
    var
      touch $ . event.touches 0
      rootEl (@getDOMNode)
      positionX $ - touch.pageX rootEl.clientLeft
      positionY $ - touch.pageY rootEl.clientTop
      newState ({})
      point $ {}
        :x positionX
        :y positionY

    = (. newState field) $ cond (is field :stencilBase) point
      math.minus point @props.base

    event.preventDefault
    @props.onChange newState

  :onZeroMove $ \ (event)
    @onPositionChange :stencilBase event

  :onTopMove $ \ (event)
    @onPositionChange :stencilTop event

  :onDownMove $ \ (event)
    @onPositionChange :stencilDown event

  :onRightMove $ \ (event)
    @onPositionChange :stencilRight event

  :render $ \ ()
    var
      zero @state.zero
      top @props.top
      down @props.down
      right @props.right
      shiftX $ - @props.base.x 0
      shiftY $ - @props.base.y 0
    g ({})
      circle $ {}
        :cx $ + zero.x shiftX
        :cy $ + zero.y shiftY
        :r 12
        :style (@styleCircle $ is @state.pointer :zero)
        :onTouchMove @onZeroMove
      circle $ {}
        :cx $ + zero.x top.x shiftX
        :cy $ + zero.y top.y shiftY
        :r 12
        :style (@styleCircle $ is @state.pointer :top)
        :onTouchMove @onTopMove
      circle $ {}
        :cx $ + zero.x down.x shiftX
        :cy $ + zero.y down.y shiftY
        :r 12
        :style (@styleCircle $ is @state.pointer :down)
        :onTouchMove @onDownMove
      circle $ {}
        :cx $ + zero.x right.x shiftX
        :cy $ + zero.y right.y shiftY
        :r 12
        :style (@styleCircle $ is @state.pointer :right)
        :onTouchMove @onRightMove

  :styleCircle $ \ (isFocus)
    {}
      :fill $ cond isFocus
        ... (Color) (hsl 200 80 40) (hslString)
        ... (Color) (hsl 200 80 70) (hslString)
      :cursor :pointer
