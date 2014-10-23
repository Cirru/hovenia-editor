
{add, multiply} = require './math'

exports.getChild = (position, vector) ->
  add position, (multiply vector, x: 0.8, y: -0.6)

exports.getYounger = (position, vector) ->
  add position, (multiply vector, x: 0.8, y: 0.6)

exports.getParent = (position, vector) ->
  add position, (multiply vector, x: 0.8, y: 0.6)

exports.getOlder = (position, vector) ->
  add position, (multiply vector, x: 0.8, y: -0.6)