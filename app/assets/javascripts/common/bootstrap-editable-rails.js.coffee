#= require bootstrap-editable
#= require bootstrap-editable-rails

$(document).ready ->

#  $.fn.editable.defaults.mode = 'inline';
  $("[data-xeditable='true']").editable();

  return
