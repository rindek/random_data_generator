//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
jQuery ->
  $(".clone a").live 'click', (e)->
    e.preventDefault()
    current_row = $(@).parents(".cloneable")
    new_row = current_row.clone()
    new_row.insertAfter(current_row)
