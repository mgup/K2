$ ->
  if $('[name="office_order[number]"').length
    updateOfficeOrderPosition = ->
      $('#officeOrderPosition').load(
        $('#officeOrderPosition').data('url'),
        "number=#{$('[name="office_order[number]"').val()}"
      )

    $('[name="office_order[number]"').change(updateOfficeOrderPosition)
    updateOfficeOrderPosition()
