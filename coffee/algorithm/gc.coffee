
{byId, byParent, byBrother} = require './by'

module.exports = (store) ->
  copy = [byId store, 'root']

  collect = (id) ->
    parent = byParent store, id
    if parent?
      copy.push parent
      collect parent.id
    brother = byBrother store, id
    if brother?
      copy.push brother
      collect brother.id

  collect 'root'
  copy
