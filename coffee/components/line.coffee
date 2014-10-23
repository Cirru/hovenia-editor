
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Line'

  onDragOver: (event) ->
    event.preventDefault()

  onDrop: (event) ->
    store.dropTo @props.data

  render: ->
    x1 = @props.from.position.x
    y1 = @props.from.position.y
    x2 = @props.to.position.x
    y2 = @props.to.position.y
    dx = x2 - x1
    dy = y2 - y1
    width = Math.pow(dx**2 + dy**2, 0.5)
    if dx is 0
      theta = 0
    else
      theta = Math.atan(dy/dx)

    angle = theta / Math.PI * 180
    if dx < 0 then angle += 180

    $.div
      className: "line is-#{@props.type}"
      style:
        left: "#{x1}px"
        top: "#{y1}px"
        width: "#{width}px"
        transform: "rotate(#{angle}deg)"
      onDragOver: @onDragOver
      onDrop: @onDrop