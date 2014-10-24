
shortid = require 'shortid'

{byId, byParent, byBrother} = require './algorithm/by'

gc = require './algorithm/gc'

rawData = localStorage.getItem('fractal-editor') or '[]'
store = JSON.parse rawData
caret = 'root'

window.onbeforeunload = ->
  rawData = JSON.stringify (gc store)
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
  caret = node.id
  @emit()

exports.createYounger = ->
  node =
    id: shortid.generate()
    text: ''
    parent: null
    brother: caret
  store.push node
  caret = node.id
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

exports.dropTo = (dragId, type, fromId, toId) ->
  from = byId store, fromId
  node = byId store, dragId

  if type is 'parent'
    node.parent = toId
    node.brother = null
    from.parent = dragId
  else if type is 'brother'
    node.parent = null
    node.brother = toId
    from.brother = dragId

  caret = 'root'
  @emit()
