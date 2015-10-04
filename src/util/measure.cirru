
var
  canvas $ document.createElement :canvas
  ctx $ canvas.getContext :2d

= exports.textWidth $ \ (text style)
  = ctx.font style
  var result $ ctx.measureText text
  , result.width
