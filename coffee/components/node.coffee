
React = require 'react'
$ = React.DOM

module.exports = React.createClass
  displayName: 'Token'

  render: ->
    $.div {}, 'token'