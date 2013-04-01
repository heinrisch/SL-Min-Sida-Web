class View.MainView extends Backbone.View
  className: 'main'

  id: 'main'
 
  views: []

  initialize: =>
    for view in @views
      view.remove()

    @views = []

    @views.push new View.News({collection: new Collection.News()})

    @render()

   
  render: =>
    @$el.html('')
    for view in @views
      @$el.append(view.render().el)

    if not @inputbar
      @inputbar = new View.InputBar() 
      $('body').append(@inputbar.render().el)
      @inputbar.on('layout', => 
        console.log 'trying to reorder!'
        for v in @views
          v.reorder()
      )
      @inputbar.on('search', (o) =>
        @onSearch(o.searchTerm)
      ) 
    @

  onSearch: (term) =>
    model = new Model.GetSite({searchTerm: term})
    view = new View.PickStation({model: model})
    @$el.append(view.render().el)
    view.on('add', (param) =>
      view.remove()
      path = Backbone.history.fragment
      path += '+' if path != ''
      path += param.id
      @inputbar.remove()
      app.router.navigate('#' + path, {trigger: true, replace: true})
    )
