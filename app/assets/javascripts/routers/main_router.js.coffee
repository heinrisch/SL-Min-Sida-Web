class Router.MainRouter extends Backbone.Router
  routes:{
    '' : 'main'
    ':params' : 'parse'
  }

  main: =>
    view = new View.MainView()
    $('#app').html(view.render().el)