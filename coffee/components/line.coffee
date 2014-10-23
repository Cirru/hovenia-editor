
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Line'

  onDragOver: (event) ->
    event.preventDefault()

  onDrop: (event) ->
    store.dropTo @props.data

  render: ->
    $.line
      className: "is-#{@props.type}"
      x1: @props.from.position.x
      y1: @props.from.position.y
      x2: @props.to.position.x
      y2: @props.to.position.y
      onDragOver: @onDragOver
      onDrop: @onDrop