class View.Bus extends Backbone.View
  className: 'bus'

  initialize: =>
    console.log 'initlializing bus view'
   
  render: =>
    @$el.html(JST["bus"]({model: @model}))
    @
