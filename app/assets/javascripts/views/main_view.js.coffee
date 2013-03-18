class View.MainView extends Backbone.View
  className: 'main'

  id: 'main'
 
  dpsViews: []

  initialize: (options) =>
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
    @
