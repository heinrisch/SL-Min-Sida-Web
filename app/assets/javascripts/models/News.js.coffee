class Model.NewsItem extends Base.Model

class Collection.News extends Base.Collection
 	model: Model.NewsItem

 	url: =>
 		base = "http://012.se/rss"
 		time = '?time=1'

 		if @params and @params == 'trending'
 			return base + '?time=24' + '&trending=1'

 		if @params
 			time = '?time=24'
 			time = '?time=6' if @params.split('+').length > 3
 			time = '?time=1' if @params.split('+').length > 6

 		time = '?time=24' if @trending
 		base += time

 		base += '&requests=' + @params if @params

 		base

 	initialize: (options) =>
 		@params = options.parameters
