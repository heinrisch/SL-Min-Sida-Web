class View.MainView extends Backbone.View
  className: 'main'

  id: 'main'
 
  views: []

  initialize: (options) =>
    for view in @views
      view.remove()

    @views = []

    @inputbar = new View.InputBar()
    @inputbar.on('layout', => 
        console.log 'trying to reorder!'
        for v in @views
          v.reorder()
      )

    @views.push @inputbar
    @views.push new View.News({collection: new Collection.News({'parameters':options.parameters})})

    @render()

   
  render: =>
    console.log 'rendering main'
    @$el.html('')

    for view in @views
      @$el.append(view.render().el)
    @
