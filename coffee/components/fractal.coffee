
React = require 'react'

$ =  React.DOM

module.exports = React.createClass
  displayName: 'Fractal'

  render: ->
    $.div
      className: 'fractal'
      'fractal'