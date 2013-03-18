class View.DPS extends Backbone.View
  className: 'dps'

  initialize: =>
    console.log 'DPS view for ' + @model.get('siteId')
    @model.fetch() unless @model.fetched
    
    $.when(@model).then(=>
      @model.buses().each((b) =>
        view = new View.Bus({model: b})
        @$el.append(view.render().el)
      )
      @$el.addClass('fetched')
    )
  
   
  render: =>
    @$el.html('')
    @
