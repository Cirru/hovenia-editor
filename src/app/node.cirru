
var
  React $ require :react
  Color $ require :color
  Immutable $ require :immutable

var
  math $ require :../util/math
  layout $ require :../util/layout

var
  Leaf $ React.createFactory $ require :./leaf
  Branch $ React.createFactory $ require :./branch

var
  ({}~ g line circle) React.DOM

var isValidPath $ \ (path)
  or
    is (path.get 0) undefined
    is (path.get 0) false

= module.exports $ React.createClass $ {}
  :displayName :app-node

  :propTypes $ {}
    :point React.PropTypes.object.isRequired
    :vector React.PropTypes.object.isRequired
    :tree $ . (React.PropTypes.instanceOf Immutable.List) :isRequired
    :coord React.PropTypes.array.isRequired
    :downFactor React.PropTypes.object.isRequired
    :rightFactor React.PropTypes.object.isRequired
    :path $ . (React.PropTypes.instanceOf Immutable.List) :isRequired

  :onCoordClick $ \ (coord)
    @props.onCoordClick coord

  :onFoldingClick $ \ ()
    @props.onCoordClick $ layout.toCoord @props.path

  :render $ \ ()
    var
      downPath $ @props.path.push true
      rightPath $ @props.path.push false
      downCoord $ layout.toCoord downPath
      rightCoord $ layout.toCoord rightPath
      downNode $ @props.tree.getIn downCoord
      rightNode $ @props.tree.getIn rightCoord
      downVector $ math.multiply @props.downFactor @props.vector
      rightVector $ math.multiply @props.rightFactor @props.vector
      downPoint $ math.add @props.point downVector
      rightPoint $ math.add @props.point rightVector
    var
      currentCoord $ layout.toCoord @props.path
      currentNode $ @props.tree.getIn currentCoord

    var
      currentPath $ layout.expandCoord @props.coord
      sizeDiff $ - @props.path.size currentPath.size

    if (> sizeDiff 7) $ do
      return $ circle $ {}
        :cx @props.point.x
        :cy @props.point.y
        :r 7
        :style (@styleFolding)
        :onClick @onFoldingClick

    g ({})
      cond
        and (? downNode) (isValidPath downPath)
        line $ {}
          :x1 @props.point.x
          :y1 @props.point.y
          :x2 downPoint.x
          :y2 downPoint.y
          :style (@styleDownLine)
        , undefined
      cond
        and (? rightNode) (isValidPath rightPath)
        line $ {}
          :x1 @props.point.x
          :y1 @props.point.y
          :x2 rightPoint.x
          :y2 rightPoint.y
          :style (@styleRightLine)
        , undefined
      cond
        and (? downNode) (isValidPath downPath)
        React.createElement module.exports $ {}
          :point downPoint
          :vector downVector
          :tree @props.tree
          :coord @props.coord
          :downFactor @props.downFactor
          :rightFactor @props.rightFactor
          :path downPath
          :onCoordClick @onCoordClick
        , undefined
      cond
        and (? rightNode) (isValidPath rightPath)
        React.createElement module.exports $ {}
          :point rightPoint
          :vector rightVector
          :tree @props.tree
          :coord @props.coord
          :downFactor @props.downFactor
          :rightFactor @props.rightFactor
          :path rightPath
          :onCoordClick @onCoordClick
        , undefined
      case (typeof currentNode)
        :string $ Leaf $ {} (:point @props.point) (:isFocused false)
          :text currentNode
          :vector @props.vector
          :onClick @onCoordClick
          :currentCoord currentCoord
        :object $ Branch $ {} (:point @props.point) (:isFocused false)
          :vector @props.vector
          :onClick @onCoordClick
          :currentCoord currentCoord

  :styleDownLine $ \ ()
    {}
      :stroke $ ... (Color) (hsl 120 20 60 0.1) (hslString)
      :strokeWidth 2

  :styleRightLine $ \ ()
    {}
      :stroke $ ... (Color) (hsl 120 50 70) (hslString)
      :strokeWidth 2

  :styleFolding $ \ ()
    {}
      :fill $ ... (Color) (hsl 240 80 40 0.9) (hslString)
      :cursor :pointer
