class Model.NewsItem extends Base.Model

class Collection.News extends Base.Collection
 	model: Model.NewsItem

 	url: =>
 		base = "http://blooming-inlet-2976.herokuapp.com/rss"
 		time = '?time=1'
 		if @params
 			time = '?time=24'
 			time = '?time=6' if @params.split('+').length > 3
 			time = '?time=1' if @params.split('+').length > 6
 			base += time
 			base += '&requests=' + @params if @params
 		else
 			base += time
 		base

 	initialize: (options) =>
 		@params = options.parameters
