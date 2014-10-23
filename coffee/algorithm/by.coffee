
exports.byId = (list, id) ->
  unless id? then return null
  for item in list
    if item.id is id
      return item

exports.byParent = (list, id) ->
  unless id? then return null
  for item in list
    if item.parent is id
      return item

exports.byBrother = (list, id) ->
  unless id? then return null
  for item in list
    if item.brother is id
      return item