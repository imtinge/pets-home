ready = ->
  $('.message .close').on('click', 
    -> $(this).closest('.message').hide() # You can use .transition('fade') here instead of hide()
  )
  $('.ui.dropdown').dropdown()

$(document).ready(ready)
$(document).on('page:load', ready)