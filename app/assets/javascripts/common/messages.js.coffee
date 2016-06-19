$(document).ready ->
  $(".alert").delay(5000).slideUp()

  $(".disabled").on 'click', (e)->
    e.preventDefault();

  return
