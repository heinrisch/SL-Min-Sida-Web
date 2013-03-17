class Router.MainRouter extends Backbone.Router
  routes:{
    '' : 'main'
  }

  main: =>
    console.log 'hej'
    views = new View.MainView()
    $('#app').html(views.render().el)  
