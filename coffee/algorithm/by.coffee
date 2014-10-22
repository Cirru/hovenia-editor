
exports.byId = (list, id) ->
  for item in list
    if item.id is id
      return item

exports.byParent = (list, id) ->
  for item in list
    if item.parent is id
      return item

exports.byBrother = (list, id) ->
  for item in list
    if item.brother is id
      return item