
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math
  layout $ require :../util/layout
  stencil $ require :../config/stencil

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
      :baseY $ + (/ window.innerHeight 2) 100

  :render $ \ ()
    var
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

  :styleRoot $ \ ()
    {}
      :position :absolute
      :width :100%
      :height :100%
      :background $ ... (Color) (hsl 200 40 80 0.8) (hslString)
