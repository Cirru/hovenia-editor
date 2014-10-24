
React = require 'react'
$ = React.DOM

store = require '../store'
tweenState = require 'react-tween-state'

module.exports = React.createClass
  displayName: 'Line'
  mixins: [tweenState.Mixin]

  getInitialState: ->
    x1: 0, y1: 0, x2: 0, y2: 0

  hasPropsChanged: (from, too) ->
    if @cache.x1 isnt from.x then return yes
    if @cache.y1 isnt from.y then return yes
    if @cache.x2 isnt too.x then return yes
    if @cache.y2 isnt too.y then return yes
    return no

  updateCache: (from, too) ->
    @cache = {}
    @cache.x1 = from.x
    @cache.y1 = from.y
    @cache.x2 = too.x
    @cache.y2 = too.y

  componentDidMount: ->
    @createTween @props

  componentWillReceiveProps: (props) ->
    @createTween props

  createTween: (props) ->
    from = props.from.position
    too = props.to.position
    unless @cache?
      @updateCache from, too
      @state.x1 = @cache.x1
      @state.y1 = @cache.y1
      @state.x2 = @cache.x2
      @state.y2 = @cache.y2
      @setState {}
    else if @hasPropsChanged from, too
      @updateCache from, too
      @tweenState 'x1',
        easing: tweenState.easingTypes.linear
        duration: 400
        endValue: from.x
      @tweenState 'y1',
        easing: tweenState.easingTypes.linear
        duration: 400
        endValue: from.y
      @tweenState 'x2',
        easing: tweenState.easingTypes.linear
        duration: 400
        endValue: too.x
      @tweenState 'y2',
        easing: tweenState.easingTypes.linear
        duration: 400
        endValue: too.y

  onDragOver: (event) ->
    event.preventDefault()

  onDrop: (event) ->
    dragId = event.dataTransfer.getData('text')
    store.dropTo dragId, @props.type, @props.from.id, @props.to.id

  render: ->
    $.line
      className: "line is-#{@props.type}"
      x1: @getTweeningValue 'x1'
      y1: @getTweeningValue 'y1'
      x2: @getTweeningValue 'x2'
      y2: @getTweeningValue 'y2'
      onDragOver: @onDragOver
      onDrop: @onDrop