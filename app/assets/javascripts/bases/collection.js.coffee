class Base.Collection extends Backbone.Collection
  constructor: (attributes, options) ->
    deferred = $.Deferred()
    deferred.promise(this)

    @bind("reset", =>
      @fetched = true
      deferred.resolve(this)
    )

    super(attributes, options)
