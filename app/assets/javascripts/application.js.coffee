#= require ./setup
#= require_self
#= require_tree ./routers

app.bind "initialize:after", (options) ->
  app.router = new Router.MainRouter()
  Backbone.history.start()
