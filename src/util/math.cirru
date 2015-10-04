
var isNumber $ \ (x)
  is (typeof x) :number

var check $ \ (point)
  if (not (isNumber point.x)) $ do
    throw ":not a number in x"
  if (not (isNumber point.y)) $ do
    throw ":not a number in y"
  return point

var checked $ \ (f)
  \ (p1 p2)
    check $ f (check p1) (check p2)

= exports.add $ checked $ \ (p1 p2)
  {}
    :x $ + p1.x p2.x
    :y $ + p1.y p2.y

= exports.minus $ \ (p1 p2)
  {}
    :x $ - p1.x p2.x
    :y $ - p1.y p2.y

= exports.multiply $ \ (p1 p2)
  {}
    :x $ - (* p1.x p2.x) (* p1.y p2.y)
    :y $ + (* p1.x p2.y) (* p1.y p2.x)

= exports.divide $ \ (p1 p2)
  var
    denominator $ +
      * p2.x p2.x
      * p2.y p2.y
  {}
    :x $ /
      + (* p1.x p2.x) (* p1.y p2.y)
      , denominator
    :y $ /
      - (* p1.y p2.x) (* p1.x p2.y)
      , denominator

