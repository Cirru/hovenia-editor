
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Line'

  render: ->
    $.div {}, 'line'