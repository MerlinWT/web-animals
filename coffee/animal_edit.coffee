$ ->
  ##Справочники
  #тип животного
  dictionary
    data:
      table: 'animal_type'
      id: 'id_animal_type'
      value: 'name'
    control: '#type'
  #вальер
  ###dictionary
    data:
      table: 'vallere'
      id: 'id_vallere'
      value: 'label'
      where:
        id_vallere_type: 1
    control: '#vallere-list'
    ###
  #загрузка картинки
  $('input[type="file"]').on 'change', (e) ->
    console.log 'image selected'
    file = e.target.files[0]
    uploadImage file, 'img'
  #Отправка формы на сервер
  $('#add').on 'click', ->
    $.ajax
      type: 'POST'
      url: './php/edit/animal_insert.php'
      dataType: 'json'
      data:
        name: do $('#name').val
        id_type: do $('#type').val
        #id_vallere: do $('#vallere-list').val
        comment: do $('#comment').val
        foto: $('img').attr 'src'
      success: (res) ->
        console.log res.data
      error: (data) ->
        console.log data.responseText