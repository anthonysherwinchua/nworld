class Nworld.Views.Checkouts.NewView
  render: ->
    client_token = $('#token').data('token')
    braintree.setup client_token, 'dropin', container: "bt-dropin"
