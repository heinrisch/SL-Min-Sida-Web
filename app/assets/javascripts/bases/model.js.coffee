class Base.Model extends Backbone.Model
  fetched: false
  
  constructor: (attributes, options) ->
    deferred = $.Deferred()
    deferred.promise(this)
   
    console.log 'binding' 
    @bind("change", =>
      console.log 'fetched'
      @fetched = true
      deferred.resolve(this)
    )

    super(attributes, options)
