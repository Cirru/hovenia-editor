
React = require 'react'
layout = require '../algorithm/layout'

$ =  React.DOM
v0 = x: 60, y: 40
p0 = x: (innerWidth / 2), y: (innerHeight / 2)

{byId, byParent, byBrother} = require '../algorithm/by'

module.exports = React.createClass
  displayName: 'Fractal'

  render: ->
    idMemory = []
    nodes = []
    lines = []

    center = byId @props.data @props.caret
    idMemory.push center.id

    drawDown = (point, vector) ->

    drawUp = (point, vector) ->

    $.div
      className: 'fractal'
      $.div {},
        nodes
      $.svg {},
        lines