#= require ./setup
#= require_self
#= require_tree ./routers
#= require_tree ./views
#= require_tree ./bases
#= require_tree ./models
#= require_tree ./templates

app.bind "initialize:after", (options) ->
  app.router = new Router.MainRouter()
  Backbone.history.start()
