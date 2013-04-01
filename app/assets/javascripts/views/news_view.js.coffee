class View.News extends Backbone.View
  className: 'news'

  views: []  

  id: 'newsContainer'

  initialize: (news) =>
    console.log 'News view for '
    @collection.fetch() 
    
    $.when(@collection).then(=>
      @collection.each((newsItem) =>
        view = new View.NewsItem({model: newsItem})
        @$el.append(view.render().el)
        @views.push(view)
      )
      @$el.addClass('fetched')
      setTimeout(@reorder, 1000)
    )
  
  reorder: =>
    $('#newsContainer').masonry({
      columnWidth: 350
      itemSelector: '.newsItem'
      isAnimated: true
    });

  render: =>
    console.log 'render'
    @$el.html('')
    if @views
      for v in @views
        console.log v.height
        @$el.append(v.el)
    @

