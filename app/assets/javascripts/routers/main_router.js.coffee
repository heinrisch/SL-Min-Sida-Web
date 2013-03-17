class Router.MainRouter extends Backbone.Router
  routes:{
    '' : 'main'
    ':params' : 'parse'
  }

  main: =>
    views = new View.MainView({
      stations: ['1508'] 
    })
    $('#app').html(views.render().el)  

  parse: (params) =>
    views = new View.MainView({
      stations: params.split('+') 
    })
    $('#app').html(views.render().el)  
