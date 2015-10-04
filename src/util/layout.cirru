
var
  Immutable $ require :immutable

var
  math $ require :./math

var bind $ \ (v k) (k v)

= exports.expandCoord $ \ (coord)
  = coord $ Immutable.List coord
  coord.flatMap $ \ (index)
    var
      values $ Immutable.Repeat true index
    ... values (toList) (unshift false)

var toCoordHelper $ \ (result count path)
  cond (> path.size 0)
    bind (path.last) $ \ (cursor)
      cond cursor
        toCoordHelper result (+ count 1) (path.butLast)
        toCoordHelper (result.unshift count) 0 (path.butLast)
    , result

= exports.toCoord $ \ (path)
  bind (toCoordHelper (Immutable.List) 0 path) $ \ (coord)
    coord.toJS

= exports.findOriginPoint $ \ (path stencil)
  var
    reverseDown $ math.inverse stencil.down
    reverseRight $ math.inverse stencil.right
    reverseDownFactor $ math.divide stencil.top reverseDown
    reverseRightFactor $ math.divide stencil.top reverseRight
  var
    helper $ \ (result nodePath vector)
      cond (is nodePath.size 0) result
        bind
          math.multiply
            cond (nodePath.last) reverseDownFactor reverseRightFactor
            , vector
          \ (newVector)
            helper
              math.add result newVector
              nodePath.butLast
              , newVector
  helper stencil.zero (path.push true) reverseDown

= exports.findOriginVector $ \ (path stencil)
  var
    reverseDown $ math.inverse stencil.down
    reverseRight $ math.inverse stencil.right
    reverseDownFactor $ math.divide stencil.top reverseDown
    reverseRightFactor $ math.divide stencil.top reverseRight
  var
    helper $ \ (nodePath vector)
      cond (is nodePath.size 0) vector
        bind (nodePath.last) $ \ (cursor)
          bind
            math.multiply
              cond cursor reverseDownFactor reverseRightFactor
              , vector
            \ (newVector)
              helper (nodePath.butLast) newVector
  math.inverse $ helper path reverseDown
