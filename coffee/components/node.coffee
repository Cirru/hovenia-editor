
React = require 'react'
$ = React.DOM

store = require '../store'

module.exports = React.createClass
  displayName: 'Token'

  onClick: ->
    store.focusTo @props.data.id

  getInitialState: ->
    marginLeft: 0, marginTop: 0

  componentDidMount: ->
    @adjustMargin()
    el = @refs.node.getDOMNode()
    if el.innerText is ''
      el.focus()

  onKeyUp: (event) ->
    text = event.target.innerText
    store.update text
    @adjustMargin()

  adjustMargin: ->
    dom = @refs.node.getDOMNode()
    width = dom.clientWidth
    height = dom.clientHeight
    @setState marginLeft: width/2, marginTop: height/2

  onDragStart: (event) ->
    event.dataTransfer.setData 'text', @props.data.id

  render: ->
    $.div
      ref: 'node'
      draggable: yes
      contentEditable: true
      className: 'token'
      onClick: @onClick
      onKeyUp: @onKeyUp
      onDragStart: @onDragStart
      style:
        left: @props.position.x
        top: @props.position.y
        marginLeft: "-#{@state.marginLeft}px"
        marginTop: "-#{@state.marginTop}px"
      @props.data.text