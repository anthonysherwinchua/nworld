#= require_self
#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require bootstrap-sprockets
#= require data-confirm-modal

window.Nworld ||= {}
Nworl.Views ||= {}

Nworl.init = ->
  dataConfirmModal.setDefaults
    title: "Confirm your action"
    commit: "Continue"
    cancel: "Cancel"

  appData = $('body').data()
  if viewName = appData['view']
    [viewsClass, viewName] = viewName.split(".")
    if appData['environment'] == 'development'
      console.log(viewsClass, viewName)
    if Nworl.Views[viewsClass]?[viewName]?
      (window.view = new Nworl.Views[viewsClass][viewName]).render()
    if Nworl.Views[viewsClass]?["Common"]?
      (new Nworl.Views[viewsClass]["Common"]).render()

  $(document).ready ->
    $(".alert").delay(5000).slideUp()

    $(".disabled").on 'click', (e)->
      e.preventDefault();

    return

  $('.modal').on 'show.bs.modal', (e)->
    return

  $('.modal').on 'hidden.bs.modal', (e)->
    $(".alert").addClass("fade")
    return
  return
