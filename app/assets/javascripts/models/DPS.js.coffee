class Model.DPS extends Base.Model

  initialize: (options) =>
    @siteId = options.siteId

  url: =>
    'http://slwrapper.appspot.com/test?siteId=' + @siteId + '&timeWindow=10'


  parse: (o) =>
    #More advance here?
    o

  buses: =>
    new Collection.Buses(@get('DPS').Buses.DpsBus)
