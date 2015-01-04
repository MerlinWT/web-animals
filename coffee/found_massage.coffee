$ ->
  messageData = {}

  $('input[type="file"]').on 'change', (e) ->
    file = e.target.files[0]
    uploadImage file, '#loaded-file'


  $('#message-persone').on 'click', ->
    messageData.foundImage = $('#loaded-file').attr 'src'
    messageData.longitude = do found_map.getCenter().lng
    messageData.latitude = do found_map.getCenter().lat
    messageData.comment = do $('#found-comment').val
    console.log messageData
    $('#form-message-persone').modal 'show'


  $('#geristrate-message').on 'click', ->
    messageData.firsName = do $('#first-name').val
    messageData.lastName = do $('#last-name').val
    messageData.phone = do $('#contact-phone').val
    $.ajax
      type: 'POST'
      url: './php/found_message.php'
      data: messageData
      dataType: 'json'
      success: (data) ->
        $('#form-message-persone').modal 'hide'
      error: (data) ->
        console.log data.responseText
