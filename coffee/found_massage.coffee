$ ->
  messageData = {}

  $('input[type="file"]').on 'change', (e) ->
    #console.log 'Событие'
    #console.log e
    file = e.target.files[0]
    #console.log 'Выбранный файл'
    #console.log file
    data = new FormData
    data.append 'file', file
    #console.log 'Форма'
    #console.log data
    $.ajax
      url: './php/upload.php'
      type: 'POST'
      data: data
      cache: false
      dataType: 'json'
      processData: false
      contentType: false
      success: (data, textStatus, jqXHR) ->
        $('#loaded-file').prop 'src', data.file
      error: (jqXHR, textStatus, errorThrown) ->
        console.log 'Error !!! %s - %s', textStatus, errorThrown
        console.log jqXHR.responseText

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
