class Model.GetSite extends Base.Model

  initialize: (options) =>
    @searchTerm = options.searchTerm

  url: =>
    'https://slwrapper.herokuapp.com/get?searchTerm=' + @searchTerm


  parse: (o) =>
    console.log o
    #More advance here?
    o

  sites: =>
    @get('Hafas').Sites.Site
