class View.MainView extends Backbone.View
  className: 'main'
 
  dpsViews: []

  initialize: (options) =>
    for station in options.stations
      @dpsViews.push new View.DPS({model: new Model.DPS({siteId: station})})

    @render()

   
  render: =>
    @$el.html('')
    for view in @dpsViews
      @$el.append(view.render().el) 
    @
