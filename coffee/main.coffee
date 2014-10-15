
React = require 'react'

store = require './store'

Fractal = require './components/fractal'

store.emit = ->
  React.renderComponent Fractal(), document.body

store.emit()