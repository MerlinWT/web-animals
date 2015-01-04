$ ->
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
      where:
        id_vallere_type: 2
    control: '#vallere-list'
  #Отправка формы на сервер
  $('#add').on 'click', ->
    $.ajax
      type: 'POST'
      url: './php/edit/hotel_insert.php'
      dataType: 'json'
      data:
        sd: do $('#sd').val
        ed: do $('#ed').val
        id_animal: do $('#animal-list').val
        id_vallere: do $('#vallere-list').val
      success: (res) ->
        console.log res.data
      error: (data) ->
        console.log data.responseText
