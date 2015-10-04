
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math
  layout $ require :../util/layout

var
  Node $ React.createFactory $ require :./node

var
  ({}~ svg) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-fractal

  :propTypes $ {}
    :baseX React.PropTypes.number
    :baseY React.PropTypes.number
    :coord React.PropTypes.array.isRequired
    :tree $ . (React.PropTypes.instanceOf Immutable.List) :isRequired

  :getDefaultProps $ \ ()
    {}
      :baseX $ / window.innerWidth 2
      :baseY $ + (/ window.innerHeight 2) 0

  :getInitialState $ \ ()
    {}
      :stencilTop $ {} (:x -24) (:y -50)
      :stencilDown $ {} (:x 0) (:y 42)
      :stencilRight $ {} (:x 30) (:y -5)

  :getStencil $ \ ()
    {}
      :top @state.stencilTop
      :down @state.stencilDown
      :right @state.stencilRight
      :zero $ {} (:x 0) (:y 0)

  :onCoordClick $ \ (coord)
    @props.onCoordClick coord

  :onMouseMove $ \ (event)
    var
      target event.currentTarget
      x $ - event.clientX target.offsetLeft (/ target.clientWidth 2)
      y $ - event.clientY target.offsetTop (/ target.clientHeight 2)

    console.log x y event.shiftKey event.nativeEvent

  :render $ \ ()
    var
      stencil (@getStencil)
      path $ layout.expandCoord @props.coord
      originPoint $ layout.findOriginPoint path stencil
      originVector $ layout.findOriginVector path stencil
      reverseTop $ math.minus stencil.zero stencil.top
      downFactor $ math.divide stencil.down reverseTop
      rightFactor $ math.divide stencil.right reverseTop

    svg ({} (:style $ @styleRoot))
      Node $ {}
        :point $ math.add originPoint $ {}
          :x @props.baseX
          :y @props.baseY
        :vector originVector
        :tree @props.tree
        :coord @props.coord
        :downFactor downFactor
        :rightFactor rightFactor
        :path (Immutable.List)
        :onCoordClick @onCoordClick

  :styleRoot $ \ ()
    {}
      :position :absolute
      :width :100%
      :height :100%
      :background $ ... (Color) (hsl 200 40 80 0.8) (hslString)
