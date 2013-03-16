class Router.MainRouter extends Backbone.Router
  routes:{
    '' : 'main'
  }

  main: =>
    console.log 'hej'
    $('#app').html('hej')  
