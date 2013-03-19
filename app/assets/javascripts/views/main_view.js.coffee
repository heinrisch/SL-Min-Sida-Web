class View.MainView extends Backbone.View
  className: 'main'

  id: 'main'
 
  dpsViews: []

  initialize: (options) =>
    for view in @dpsViews
      view.remove()

    @dpsViews = []

    for station in options.stations
      @dpsViews.push new View.DPS({model: new Model.DPS({siteId: station})})

    @render()

   
  render: =>
    @$el.html('')
    for view in @dpsViews
      @$el.append(view.render().el)

    if not @inputbar
      @inputbar = new View.InputBar() 
      $('body').append(@inputbar.render().el)
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
