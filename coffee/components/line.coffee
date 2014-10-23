
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Line'

  render: ->
    $.line
      x1: @props.from.position.x
      y1: @props.from.position.y
      x2: @props.to.position.x
      y2: @props.to.position.y