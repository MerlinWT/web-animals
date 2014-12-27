$ ->
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