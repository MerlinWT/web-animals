$ ->
  action = 'add'
  row = null
  $('#item-form').on 'show', ->
    action = $('#item-form').attr 'action'
    row = $('input:checked').closest('tr')
    #если режим редактирования - загружаем данные на форму
    values =
      date:
        edit: do $(row).children().eq(1).html
        add: do currentDate
      text:
        edit: do $(row).children().eq(2).html
        add: ''

    $('#date').val values.date[action]
    $('#text').val values.text[action]

  #Отправка формы на сервер
  $('#add').on 'click', ->
    urls =
      add: './php/edit/event_insert.php'
      edit: './php/edit/event_update.php'
    $.ajax
      type: 'POST'
      url: urls[action]
      dataType: 'json'
      data:
        id: $(row).attr 'row-id'
        date: do $('#date').val
        text: do $('#text').val
      success: (res) ->
        console.log res.data
        #обновление данных
        admin_data 'event'
      error: (data) ->
        console.log data.responseText