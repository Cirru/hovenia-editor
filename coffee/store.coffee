
shortid = require 'shortid'

{byId, byParent, byBrother} = require './algorithm/by'

rawData = localStorage.getItem('fractal-editor') or '[]'
store = JSON.parse rawData
caret = 'root'

window.onbeforeunload = ->
  rawData = JSON.stringify store
  localStorage.setItem 'fractal-editor', rawData

unless store.length
  store.push id: 'root', text: '', type: 'root', link: null

exports.emit = ->
  console.log 'edit this'

exports.getData = ->
  store

exports.getCaret = ->
  caret

exports.createChild = ->
  node =
    id: shortid.generate()
    text: ''
    parent: caret
    brother: null
  store.push node
  @emit()

exports.createYounger = ->
  node =
    id: shortid.generate()
    text: ''
    parent: null
    brother: caret
  store.push node
  @emit()

exports.delete = ->
  node = byId store, caret
  nextCaret = node.parent or node.brother
  if nextCaret
    caret = nextCaret
    node.parent = null
    node.brother = null
    @emit()

exports.update = (text) ->
  node = byId store, caret
  node.text = text

exports.focusTo = (id) ->
  caret = id
  @emit()

exports.dropTo = (id) ->