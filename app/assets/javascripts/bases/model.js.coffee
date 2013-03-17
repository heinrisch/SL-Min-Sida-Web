class Base.Model extends Backbone.Model
  fetched: false
  
  constructor: (attributes, options) ->
    deferred = $.Deferred()
    deferred.promise(this)
   
    @bind("change", =>
      @fetched = true
      deferred.resolve(this)
    )

    super(attributes, options)
