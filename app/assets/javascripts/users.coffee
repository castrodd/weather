# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.btn-group').on 'click', ->
    if $('.active')[0]['textContent'].includes('F')
      $('.f').hide()
      $('.c').show()
    else
      $('.f').show()
      $('.c').hide()
    return
  return
