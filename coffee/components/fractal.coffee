
React = require 'react'
layout = require '../algorithm/layout'

$ =  React.DOM
v0 = x: 60, y: 40
p0 = x: (innerWidth / 2), y: (innerHeight / 2)

{byId, byParent, byBrother} = require '../algorithm/by'
{minus, inverse} = require '../algorithm/math'
Line = require './line'
Node = require './node'

module.exports = React.createClass
  displayName: 'Fractal'

  render: ->
    idMemory = []
    nodes = []
    lines = []

    root = byId @props.data, @props.caret
    center =
      x: innerWidth / 2
      y: innerHeight / 2
    idMemory.push root.id
    nodes.push position: center, data: root

    drawDown = (from, position, vector) ->
      child = byParent from.id
      if child?
        dest = layout.getChild position, vector
        unless child.id in idMemory
          idMemory.push child.id
          nodes.push position: dest, data: child
          lines.push
            type: 'parent'
            from: {position: dest, id: child.id}
            to: {position: position, id: from.id}
          vector = minus dest, position
          drawDown child.id, dest, vector
      younger = byBrother from.id
      if younger?
        dest = layout.getYounger position, vector
        unless younger.id in idMemory
          idMemory.push younger.id
          nodes.push position: dest, data: younger
          lines.push
            type: 'brother'
            from: {position: dest, id: younger.id}
            to: {position: position, id: from.id}
          vector = minus dest, position
          drawDown younger.id, dest, vector

    drawUp = (from, position, vector) ->
      if from.parent?
        parent = byId from.parent
        unless parent.id in idMemory
          dest = layout.getParent from, vector
          idMemory.push parent.id
          nodes.push position: dest, data: parent
          lines.push
            type: 'parent'
            from: {position: position, id: from.id}
            to: {position: dest, id: parent.id}
          vector = minus parent, position
          drawUp parent, dest, vector
          drawDown from, position, (invese vector)
      else if from.brother?
        older = byId from.brother
        unless older.id in idMemory
          dest = layout.getOlder from, vector
          idMemory.push older.id
          nodes.push position: dest, data.older
          lines.push
            type: 'brother'
            from: {position: position, id: from.id}
            to: {position: dest, id: older.id}
          vector = minus older, position
          drawUp older, dest, vector
          drawDown from, position, (invese vector)

    nodeComponents = nodes.map (node) ->
      Node key: node.id, data: node.data, position: node.position

    lineComponents = lines.map (line) ->
      Line key: "#{line.from.id}-#{line.to.id}", data: line

    $.div
      className: 'fractal'
      $.svg
        width: innerWidth
        height: innerHeight
        lineComponents
      nodeComponents