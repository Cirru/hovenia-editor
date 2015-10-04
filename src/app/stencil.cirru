
var
  React $ require :react
  Color $ require :color
  keycode $ require :keycode

var
  math $ require :../util/math

var
  ({}~ g circle) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-stencil

  :propTypes $ {}
    :base React.PropTypes.object.isRequired
    :top React.PropTypes.object.isRequired
    :down React.PropTypes.object.isRequired
    :right React.PropTypes.object.isRequired
    :onChange React.PropTypes.func.isRequired

  :getInitialState $ \ ()
    {}
      :zero $ {} (:x 0) (:y 0)
      :pointer :top

  :movePoint $ \ (delta)
    switch @state.pointer
      :top
        @props.onChange $ {}
          :stencilTop $ math.add @props.top delta
      :down
        @props.onChange $ {}
          :stencilDown $ math.add @props.down delta
      :right
        @props.onChange $ {}
          :stencilRight $ math.add @props.right delta
      :zero
        @props.onChange $ {}
          :stencilBase $ math.add @props.base delta
    , undefined

  :onTopClick $ \ ()
    @setState $ {} (:pointer :top)

  :onZeroClick $ \ ()
    @setState $ {} (:pointer :zero)

  :onDownClick $ \ ()
    @setState $ {} (:pointer :down)

  :onRightClick $ \ ()
    @setState $ {} (:pointer :right)

  :onKeyDown $ \ (event)
    var step $ cond event.shiftKey 14 1
    switch (keycode event.keyCode)
      :up $ @movePoint $ {} (:x 0) (:y $ - 0 step)
      :down $ @movePoint $ {} (:x 0) (:y step)
      :left $ @movePoint $ {} (:x $ - 0 step) (:y 0)
      :right $ @movePoint $ {} (:x step) (:y 0)
    , undefined

  :render $ \ ()
    var
      zero @state.zero
      top @props.top
      down @props.down
      right @props.right
      shiftX $ - @props.base.x 8
      shiftY $ - @props.base.y 4
    g ({})
      circle $ {}
        :cx $ + zero.x shiftX
        :cy $ + zero.y shiftY
        :r 4
        :onClick @onZeroClick
        :style (@styleCircle $ is @state.pointer :zero)
        :onKeyDown @onKeyDown
        :tabIndex 1
      circle $ {}
        :cx $ + zero.x top.x shiftX
        :cy $ + zero.y top.y shiftY
        :r 4
        :onClick @onTopClick
        :style (@styleCircle $ is @state.pointer :top)
        :onKeyDown @onKeyDown
        :tabIndex 1
      circle $ {}
        :cx $ + zero.x down.x shiftX
        :cy $ + zero.y down.y shiftY
        :r 4
        :onClick @onDownClick
        :style (@styleCircle $ is @state.pointer :down)
        :onKeyDown @onKeyDown
        :tabIndex 1
      circle $ {}
        :cx $ + zero.x right.x shiftX
        :cy $ + zero.y right.y shiftY
        :r 4
        :onClick @onRightClick
        :style (@styleCircle $ is @state.pointer :right)
        :onKeyDown @onKeyDown
        :tabIndex 1

  :styleCircle $ \ (isFocus)
    {}
      :fill $ cond isFocus
        ... (Color) (hsl 200 80 40) (hslString)
        ... (Color) (hsl 200 80 70) (hslString)
      :cursor :pointer
