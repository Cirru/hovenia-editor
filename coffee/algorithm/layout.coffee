
{add, multiply} = require './math'

gen = (theta, rate) ->
  x: rate * Math.cos(theta / 180 * Math.PI)
  y: rate * Math.sin(theta / 180 * Math.PI)

exports.downLeft = (position, vector) ->
  factor = gen 60, 0.8
  add position, (multiply vector, factor)

exports.downRight = (position, vector) ->
  factor = gen -60, 0.8
  add position, (multiply vector, factor)

exports.leftUp = (position, vector) ->
  factor = gen -60, 1/0.8
  add position, (multiply vector, factor)

exports.rightUp = (position, vector) ->
  factor = gen 60, 1/0.8
  add position, (multiply vector, factor)