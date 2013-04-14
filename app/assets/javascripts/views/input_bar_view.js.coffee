class View.InputBar extends Backbone.View
  id: 'inputbar'
  
  className: 'inputbar'

  events:
    'click .layout' : 'layout'

  initialize: =>
    console.log 'initlializing input bar view'
   
  render: =>
    @$el.html(JST["input_bar"]())
    @

  layout: =>
    @trigger('layout')
