ready = ->
  $('.message .close').on('click', 
    -> $(this).closest('.message').hide() # You can use .transition('fade') here instead of hide()
  )
  
  $('.ui.dropdown').dropdown()

  setTimeout (->
    $('.message .close').closest('.message').hide()
    return
  ), 5000


$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('turbolinks:load', ready)