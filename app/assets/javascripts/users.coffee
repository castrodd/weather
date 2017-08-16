# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('.btn-group').on 'click', ->
    setTimeout (->
      if $('label.btn.active')[0]['children'][0]['id'] == 'option1'
        $('.f').show()
        $('.c').hide()
      else
        $('.f').hide()
        $('.c').show()
      return
    ), 5
  return
