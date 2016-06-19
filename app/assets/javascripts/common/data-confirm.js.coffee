#= require data-confirm-modal

$(document).ready ->
  dataConfirmModal.setDefaults
    title: "Confirm your action"
    commit: "Continue"
    cancel: "Cancel"
