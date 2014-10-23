
React = require 'react'
layout = require '../algorithm/layout'

$ =  React.DOM
v0 = x: 100, y: 100
p0 = x: (innerWidth / 2), y: (innerHeight / 2)

store = require '../store'
{byId, byParent, byBrother, byKey} = require '../algorithm/by'
{add, minus, inverse} = require '../algorithm/math'
Line = require './line'
Node = require './node'

module.exports = React.createClass
  displayName: 'Fractal'

  createChild: ->
    store.createChild()

  createYounger: ->
    store.createYounger()

  delete: ->
    store.delete()

  render: ->
    idMemory = []
    nodes = []
    lines = []

    focus = byId @props.data, @props.caret
    idMemory.push focus.id
    nodes.push position: p0, data: focus

    drawDown = (from, position, vector, distance) =>
      child = byParent @props.data, from.id
      if child?
        dest = layout.downRight position, vector
        unless child.id in idMemory
          idMemory.push child.id
          nodes.push position: dest, data: child
          lines.push
            type: 'parent'
            from: {position: dest, id: child.id}
            to: {position: position, id: from.id}
          newVector = minus dest, position
          drawDown child, dest, newVector, (distance + 1)
      younger = byBrother @props.data, from.id
      if younger?
        dest = layout.downLeft position, vector
        unless younger.id in idMemory
          idMemory.push younger.id
          nodes.push position: dest, data: younger
          lines.push
            type: 'brother'
            from: {position: dest, id: younger.id}
            to: {position: position, id: from.id}
          newVector = minus dest, position
          drawDown younger, dest, newVector, (distance + 1)

    drawUp = (from, position, vector, distance) =>
      shifted = add position, vector
      if from.parent?
        parent = byId @props.data, from.parent
        unless parent.id in idMemory
          dest = layout.rightUp shifted, vector
          idMemory.push parent.id
          nodes.push position: shifted, data: parent
          lines.push
            type: 'parent'
            from: {position: position, id: from.id}
            to: {position: shifted, id: parent.id}
          newVector = minus dest, shifted
          drawUp parent, shifted, newVector, (distance + 1)
          drawDown from, position, (inverse vector), distance
      else if from.brother?
        older = byId @props.data, from.brother
        unless older.id in idMemory
          dest = layout.leftUp shifted, vector
          idMemory.push older.id
          nodes.push position: shifted, data: older
          lines.push
            type: 'brother'
            from: {position: position, id: from.id}
            to: {position: shifted, id: older.id}
          newVector = minus dest, shifted
          drawUp older, shifted, newVector, (distance + 1)
          drawDown from, position, (inverse vector), distance

    if focus.id is 'root'
      drawDown focus, p0, v0, 1
    else
      drawUp focus, p0, (inverse v0), 1

    nodeComponents = nodes
    .map (node) ->
      key: node.data.id
      component: Node key: node.data.id, data: node.data, position: node.position
    .sort byKey
    .map (wrap) ->
      wrap.component

    lineComponents = lines
    .map (line) ->
      key = "#{line.from.id}-#{line.to.id}"
      key: key
      component: Line
        key: key
        from: line.from
        type: line.type
        to: line.to
    .sort byKey
    .map (wrap) ->
      wrap.component

    $.div
      className: 'fractal'
      $.div className: 'controls',
        unless byParent(@props.data, focus.id)?
          $.div className: 'button', onClick: @createChild, 'child'
        unless byBrother(@props.data, focus.id)?
          if focus.id isnt 'root'
            $.div className: 'button', onClick: @createYounger, 'younger'
        unless focus.id is 'root'
          $.div className: 'button', onClick: @delete, 'delete'
      lineComponents
      nodeComponents