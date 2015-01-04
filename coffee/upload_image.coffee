window.uploadImage = (aFile, aImg) ->
  data = new FormData
  data.append 'file', aFile
  $.ajax
    url: './php/upload.php'
    type: 'POST'
    data: data
    cache: false
    dataType: 'json'
    processData: false
    contentType: false
    success: (data, textStatus, jqXHR) ->
      $(aImg).prop 'src', data.file
    error: (jqXHR, textStatus, errorThrown) ->
      console.log 'Error !!! %s - %s', textStatus, errorThrown
      console.log jqXHR.responseText
