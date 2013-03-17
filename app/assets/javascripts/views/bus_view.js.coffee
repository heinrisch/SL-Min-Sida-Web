class View.Bus extends Backbone.View

  attributes:{
    class:"fine"
  }
 
  initialize: =>
    console.log 'initlializing bus view'
   
  render: =>
    @$el.html(JST["bus"]({model: @model}))
    @
