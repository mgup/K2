$ ->
  if $('.semester-div').length
    $('.semester-click').click ->
      $("#study-semester-#{$(this).data('value')}").toggle()
