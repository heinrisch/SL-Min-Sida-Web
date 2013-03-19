class View.PickStation extends Backbone.View
  className: 'pickstation'

  initialize: =>
    console.log 'Pick stations view for ' + @model.get('searchTerm')
    @model.fetch() unless @model.fetched
    
    $.when(@model).then(=>
      for site in @model.sites()
        view = new View.Site({name: site.Name, id: site.Number})
        @$el.append(view.render().el)
        view.on('onClick', (options) => @onClick(options.id)) 
    )
  
  onClick: (id) =>
    @trigger('add', {id: id})
   
  render: =>
    @$el.html('')
    @
