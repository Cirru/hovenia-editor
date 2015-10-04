
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math
  layout $ require :../util/layout

var
  Node $ React.createFactory $ require :./node
  Stencil $ React.createFactory $ require :./stencil

var
  ({}~ svg) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-fractal

  :propTypes $ {}
    :coord React.PropTypes.array.isRequired
    :tree $ . (React.PropTypes.instanceOf Immutable.List) :isRequired

  :getInitialState $ \ ()
    {}
      :stencilBase $ {}
        :x 500
        :y 200
      :stencilTop $ {} (:x -25) (:y -52)
      :stencilDown $ {} (:x -5) (:y 60)
      :stencilRight $ {} (:x 54) (:y 10)

  :getStencil $ \ ()
    {}
      :top @state.stencilTop
      :down @state.stencilDown
      :right @state.stencilRight
      :zero $ {} (:x 0) (:y 0)

  :onCoordClick $ \ (coord)
    @props.onCoordClick coord

  :onStencilChange $ \ (data)
    @setState data

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
          :x @state.stencilBase.x
          :y @state.stencilBase.y
        :vector originVector
        :tree @props.tree
        :coord @props.coord
        :downFactor downFactor
        :rightFactor rightFactor
        :path (Immutable.List)
        :onCoordClick @onCoordClick
      Stencil $ {}
        :base @state.stencilBase
        :top @state.stencilTop
        :down @state.stencilDown
        :right @state.stencilRight
        :onChange @onStencilChange

  :styleRoot $ \ ()
    {}
      :position :absolute
      :width :100%
      :height :100%
      :background $ ... (Color) (hsl 200 40 80 0.8) (hslString)
