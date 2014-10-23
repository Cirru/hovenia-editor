
React = require 'react'
layout = require '../algorithm/layout'

$ =  React.DOM
v0 = x: 80, y: 60
p0 = x: (innerWidth / 2), y: (innerHeight / 2)

store = require '../store'
{byId, byParent, byBrother} = require '../algorithm/by'
{minus, inverse} = require '../algorithm/math'
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
        dest = layout.getChild position, vector
        unless child.id in idMemory
          idMemory.push child.id
          nodes.push position: dest, data: child
          lines.push
            type: 'parent'
            from: {position: dest, id: child.id}
            to: {position: position, id: from.id}
          vector = minus dest, position
          drawDown child, dest, vector, (distance + 1)
      younger = byBrother @props.data, from.id
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
          drawDown younger, dest, vector, (distance + 1)

    drawUp = (from, position, vector, distance) =>
      if from.parent?
        parent = byId @props.data, from.parent
        unless parent.id in idMemory
          dest = layout.getParent position, vector
          idMemory.push parent.id
          nodes.push position: dest, data: parent
          lines.push
            type: 'parent'
            from: {position: position, id: from.id}
            to: {position: dest, id: parent.id}
          vector = minus dest, position
          drawUp parent, dest, vector, (distance + 1)
          drawDown from, position, (inverse vector), distance
      else if from.brother?
        older = byId @props.data, from.brother
        unless older.id in idMemory
          dest = layout.getOlder position, vector
          idMemory.push older.id
          nodes.push position: dest, data: older
          lines.push
            type: 'brother'
            from: {position: position, id: from.id}
            to: {position: dest, id: older.id}
          vector = minus dest, position
          drawUp older, dest, vector, (distance + 1)
          drawDown from, position, (inverse vector), distance

    drawDown focus, p0, v0, 1
    drawUp focus, p0, (inverse v0), 1

    nodeComponents = nodes.map (node) ->
      Node key: node.data.id, data: node.data, position: node.position

    lineComponents = lines.map (line) ->
      Line
        key: "#{line.from.id}-#{line.to.id}"
        from: line.from
        type: line.type
        to: line.to

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
      $.svg
        width: innerWidth
        height: innerHeight
        lineComponents
      nodeComponents