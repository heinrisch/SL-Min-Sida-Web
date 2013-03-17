class View.MainView extends Backbone.View

  attributes:{
    class:"fine"
  }
 
  initialize: =>
    console.log 'creating main view'
    dps = new Model.DPS({siteId: 5509});
    dps.fetch()

    $.when(dps).then(=>
      console.log dps.buses()

      dps.buses().each((b) =>
        view = new View.Bus({model: b})
        @$el.append(view.render().el)
      )
    )
   
  render: =>
    @$el.html("header")
    @
