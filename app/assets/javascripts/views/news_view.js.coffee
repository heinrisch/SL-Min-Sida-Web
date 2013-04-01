class View.News extends Backbone.View
  className: 'news'

  views: []  

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
    )

    setTimeout(@reorder,1000)
  
  reorder: =>
    totalWidth = $(document).width();

    for v in @views
      v.height = $(v.el).height()
      v.width = $(v.el).width()
      console.log v.height

    @views.sort(@sort)

    currentHeight = 0
    currentWidht = totalWidth
    newViews = []
    while @views.length > 0
      cView = @views[0]
      @views.splice(0,1)
      newViews.push cView
      currentHeight = cView.height
      viewsToRemove = []
      console.log 'Start height: ' + cView.height
      for v in @views
        if currentHeight > v.height
          console.log 'Reducing height: ' + v.height
          newViews.push v
          currentHeight -= v.height
          viewsToRemove.push v
      for v in viewsToRemove
        index = @views.indexOf(v)
        @views.splice(index, 1)

    @views = newViews
    @render()

  sort: (a, b) =>
    if(a.height > b.height)
      return -1
    else if (b.height > a.height)
      return 1

    return 0


  render: =>
    console.log 'render'
    @$el.html('')
    if @views
      for v in @views
        console.log v.height
        @$el.append(v.el)
    @

