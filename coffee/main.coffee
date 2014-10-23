
React = require 'react'

store = require './store'

Fractal = require './components/fractal'

store.emit = ->
  component = Fractal
    data: store.getData()
    caret: store.getCaret()
  React.renderComponent component, document.body

store.emit()