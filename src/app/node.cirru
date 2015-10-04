
var
  React $ require :react
  Immutable $ require :immutable

var
  math $ require :../util/math
  layout $ require :../util/layout

var
  Leaf $ React.createFactory $ require :./leaf
  Branch $ React.createFactory $ require :./branch

var
  ({}~ g) React.DOM

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

  :render $ \ ()
    var
      downPath $ @props.path.push true
      rightPath $ @props.path.push false
      downCoord $ layout.toCoord downPath
      rightCoord $ layout.toCoord rightPath
      downNode $ @props.tree.getIn (downCoord.toJS)
      rightNode $ @props.tree.getIn (rightCoord.toJS)
      downVector $ math.multiply @props.downFactor @props.vector
      rightVector $ math.multiply @props.rightFactor @props.vector
    var
      currentCoord $ layout.toCoord @props.path
      currentNode $ @props.tree.getIn (currentCoord.toJS)

    g ({})
      cond (? downNode)
        React.createElement module.exports $ {}
          :point $ math.add @props.point downVector
          :vector downVector
          :tree @props.tree
          :coord @props.coord
          :downFactor @props.downFactor
          :rightFactor @props.rightFactor
          :path downPath
        , undefined
      cond (? rightNode)
        React.createElement module.exports $ {}
          :point $ math.add @props.point rightVector
          :vector rightVector
          :tree @props.tree
          :coord @props.coord
          :downFactor @props.downFactor
          :rightFactor @props.rightFactor
          :path rightPath
        , undefined
      case (typeof currentNode)
        :string $ Leaf $ {} (:point @props.point) (:isFocused false)
          :text currentNode
          :vector @props.vector
        :object $ Branch $ {} (:point @props.point) (:isFocused false)
          :vector @props.vector
