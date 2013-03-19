class View.InputBar extends Backbone.View
  id: 'inputbar'
  
  className: 'inputbar'

  events:
    'click #send' : 'search'
    'keyup #search' : 'searchKeyUp'

  initialize: =>
    console.log 'initlializing input bar view'
   
  render: =>
    @$el.html(JST["input_bar"]())
    @

  search: (e) =>
    console.log 'searched'
    searchField = $('#search')
    console.log searchField.val()
    @trigger('search',{searchTerm: searchField.val()})
    searchField.val('')
     
    

  searchKeyUp: (e) =>
    console.log 'keyup'
    if e.keyCode == 13
      @search()
