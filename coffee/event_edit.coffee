$ ->
  #Отправка формы на сервер
  $('#add').on 'click', ->
    $.ajax
      type: 'POST'
      url: './php/edit/event_insert.php'
      dataType: 'json'
      data:
        date: do $('#date').val
        text: do $('#text').val
      success: (res) ->
        console.log res.data
        #обновление данных
        admin_data 'event'
      error: (data) ->
        console.log data.responseText