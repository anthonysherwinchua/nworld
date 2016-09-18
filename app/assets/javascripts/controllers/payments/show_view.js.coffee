class Nworld.Views.Payments.ShowView
    render: ->
      setTimeout (->
        window.location = $("#redirect").data("url")
        return
      ), 5000

