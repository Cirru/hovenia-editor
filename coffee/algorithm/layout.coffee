
{add, multiply} = require 'math'

exports.sovleChild = (position, vector) ->
  add position, (multiply vector, x: 0.8, y: -0.6)

exports.solveBrother = (position, vector) ->
  add position, (multiply vector, x: 0.8, y: 0.6)

exports.sourceParent = (position, vector) ->
  add position, (multiply vector: x: 0.8, y: 0.6)

exports.sourceBrother = (position, vector) ->
  add position, (multiply vector: x: 0.8, y: -0.6)