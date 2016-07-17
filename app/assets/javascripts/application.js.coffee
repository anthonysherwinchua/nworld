#= require_self
#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require bootstrap-sprockets
#= require_tree ./common

window.Nworld ||= {}
Nworld.Views ||= {}

Nworld.init = ->
  appData = $('body').data()
  if viewName = appData['view']
    [viewsClass, viewName] = viewName.split(".")
    if appData['environment'] == 'development'
      console.log(viewsClass, viewName)
    if Nworld.Views[viewsClass]?[viewName]?
      (window.view = new Nworld.Views[viewsClass][viewName]).render()
    if Nworld.Views[viewsClass]?["Common"]?
      (new Nworld.Views[viewsClass]["Common"]).render()

  return
