$ ->
  $('#animal-request').on 'click', ->
    $.ajax
      type: 'POST'
      url: './php/animal_request.php'
      data:
        firstName: do $('#first-name').val
        lastName: do $('#last-name').val
        contactPhone: do $('#contact-phone').val
        idAnimal: do $('#id-animal').val
    .done (html) ->
      $('#get-friend-form').modal 'hide'
      $('.alert').slideDown 200