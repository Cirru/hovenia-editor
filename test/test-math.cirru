
var
  math $ require :../src/util/math

var
  p1 $ {} (:x 3) (:y 2)
  p2 $ {} (:x 1) (:y 3)

console.log $ math.add p1 p2
console.log $ math.minus p1 p2
console.log $ math.multiply p1 p2
console.log $ math.divide p1 p2
