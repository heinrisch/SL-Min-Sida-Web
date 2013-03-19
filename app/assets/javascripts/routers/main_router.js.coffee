class Router.MainRouter extends Backbone.Router
  routes:{
    '' : 'main'
    ':params' : 'parse'
  }

  main: =>
    view = new View.MainView({
      stations: ['1508'] 
    })
    $('#app').html(view.render().el)  

  parse: (params) =>
    view = new View.MainView({
      stations: params.split('+') 
    })
    $('#app').html(view.render().el)  
