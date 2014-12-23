$ ->
  $('#animal-request').on 'click', ->
    $.ajax
      type: 'POST'
      url: './php/animal_request.php'

