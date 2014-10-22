
rawData = localStorage.getItem('fractal-editor') or '[]'
store = JSON.parse rawData
caret = 'root'

window.onbeforeunload = ->
  rawData = store.toJSON()
  localStorage.setItem 'fractal-editor', rawData

unless store.length
  store.push id: 'root', text: '', left: null, right: null

exports.emit = ->
  console.log 'edit this'

exports.getData = ->
  store

exports.createChild = (id) ->

exports.createBrother = (id) ->

exports.insertChild = () ->

exports.update = ->