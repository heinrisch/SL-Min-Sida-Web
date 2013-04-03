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
    width = 350
    #if mobilecheck()
      #$('#app').css('width', width);
    $('#newsContainer').masonry({
      columnWidth: width
      itemSelector: '.newsItem'
      isAnimated: true
    });
    @render()

  render: =>
    console.log 'render'
    @$el.html('')
    if @views.length > 0
      for v in @views
        @$el.append(v.render().el)
    else
      @addSpinner()
    @

  addSpinner: =>
    console.log 'should add spinner'
    opts = {
      lines: 17
      length: 13
      width: 6
      radius: 30
      corners: 0 
      rotate: 0 
      color: '#000' 
      speed: 1 
      trail: 60 
      shadow: true 
      hwaccel: false 
      className: 'spinner' 
      zIndex: 2e9 
    }
    spinner = new Spinner(opts).spin();
    $(spinner.el).css("position", "absolute")
    $(spinner.el).css("left", "50%")
    $(spinner.el).css("top", "50%")
    @$el.append(spinner.el)
