$ ->
  action = 'add'
  row = null
  $('#item-form').on 'show', (e) ->
    if $(e.target).attr('id') == $(@).attr('id')
      action = $('#item-form').attr 'action'
      row = $('input:checked').closest('tr')
      #если режим редактирования - загружаем данные на форму
      values =
        sd:
          edit: do $(row).children().eq(4).html
          add: do currentDate
        ed:
          edit: do $(row).children().eq(5).html
          add: do currentDate
        vallere:
          edit: $(row).children().eq(1).attr 'id-dic'
          add: -1
        animal:
          edit: $(row).children().eq(3).attr 'id-dic'
          add: -1
      $('#sd').val values.sd[action]
      $('#ed').val values.ed[action]
      $('#vallere-list').val values.vallere[action]
      $('#animal-list').val values.animal[action]
  #тип животного
  dictionary
    data:
      table: 'animal'
      id: 'id_animal'
      value: 'name'
    control: '#animal-list'
  #вальер
  dictionary
    data:
      table: 'vallere'
      id: 'id_vallere'
      value: 'label'
      #where:
      #  id_vallere_type: 2
    control: '#vallere-list'
  #Отправка формы на сервер
  $('#add').on 'click', ->
    urls =
      add: './php/edit/hotel_insert.php'
      edit: './php/edit/hotel_update.php'
    $.ajax
      type: 'POST'
      url: urls[action]
      dataType: 'json'
      data:
        id: $(row).attr 'row-id'
        sd: do $('#sd').val
        ed: do $('#ed').val
        id_animal: do $('#animal-list').val
        id_vallere: do $('#vallere-list').val
      success: (res) ->
        console.log res.data
        #обновление данных
        admin_data 'hotel'
      error: (data) ->
        console.log data.responseText
