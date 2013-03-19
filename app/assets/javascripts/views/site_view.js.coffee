class View.Site extends Backbone.View
  className: 'site'

  tagName: 'li'

  events: {
    'click' : 'onClick'
  }

  initialize: (options) =>
    console.log 'initlializing site view'
    @name = options.name
    @id = options.id
   
  render: =>
    @$el.html(JST["site"]({name: @name}))
    @

  onClick: =>
    @trigger('onClick', {id: @id})
