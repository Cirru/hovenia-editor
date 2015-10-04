
var
  React $ require :react
  Immutable $ require :immutable

var
  Page $ React.createFactory $ require :./app/page

require :../style/main.css

React.render (Page) document.body
