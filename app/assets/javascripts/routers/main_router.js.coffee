class Router.MainRouter extends Backbone.Router
  routes:{
    '' : 'main'
    ':params' : 'main'
  }

  main: (params) =>
  	view = new View.MainView({'parameters' : params})
  	$('#app').html(view.render().el)