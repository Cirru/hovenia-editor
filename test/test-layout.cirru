
var
  assert $ require :assert
  Immutable $ require :immutable

var
  layout $ require :../src/util/layout

var testExpandCoord $ \ ()
  var
    coord $ [] 0 0 1
    result $ layout.expandCoord coord
    expected $ [] false false false true

  assert.deepEqual (result.toJS) expected :testExpandCoord

var testToCoord $ \ (path)
  var
    path $ Immutable.fromJS $ [] false false false true
    result $ layout.toCoord path
    expected $ [] 0 0 1

  assert.deepEqual result expected :testToCoord

testExpandCoord
testToCoord