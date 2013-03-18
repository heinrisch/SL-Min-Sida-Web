class View.InputBar extends Backbone.View
  id: 'inputbar'
  
  className: 'inputbar'

  initialize: =>
    console.log 'initlializing input bar view'
   
  render: =>
    @$el.html(JST["input_bar"]())
    @
