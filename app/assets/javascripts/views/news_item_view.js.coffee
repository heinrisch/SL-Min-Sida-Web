class View.NewsItem extends Backbone.View
  className: 'newsItem'

  initialize: (news) =>
    console.log 'newsItem view for ' + @model.get('Title')
  
   
  render: =>
    @$el.html(JST['news'](model: @model))
    @

