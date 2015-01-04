window.dictionary = (prop) ->
  $.ajax
    type: 'POST'
    url: './php/dictionary_list.php'
    data: prop.data
    dataType: 'json'
    success: (res) ->
      select = $ prop.control
      $.each res.data, ->
        item = $('<option></option>').val(@value).html(@text)
        $(select).append(item)
    error: (data) ->
      console.log data.responseText