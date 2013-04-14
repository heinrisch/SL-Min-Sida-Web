class Model.NewsItem extends Base.Model

class Collection.News extends Base.Collection
 	model: Model.NewsItem

 	url: =>
 		base = "http://blooming-inlet-2976.herokuapp.com/rss"
 		time = '?time=24'
 		if @params
 			time = '?time=6' if @params.split('+').length > 3
 			base += time
 			base += '&requests=' + @params if @params
 		else
 			base += time
 		base

 	initialize: (options) =>
 		@params = options.parameters
