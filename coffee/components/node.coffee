
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Token'

  render: ->
    $.div
      contentEditable: true
      className: 'token'
      style:
        left: @props.position.x
        top: @props.position.y
      @props.data.text