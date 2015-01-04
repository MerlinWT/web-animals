$ ->
  #тип вальера
  dictionary
    data:
      table: 'vallere_type'
      id: 'id_vallere_type'
      value: 'name'
    control: '#type'
  #загрузка картинки
  $('input[type="file"]').on 'change', (e) ->
    console.log 'image selected'
    file = e.target.files[0]
    uploadImage file, 'img'
  #Отправка формы на сервер
  $('#add').on 'click', ->
    $.ajax
      type: 'POST'
      url: './php/edit/vallere_insert.php'
      dataType: 'json'
      data:
        label: do $('#label').val
        id_vallere_type: do $('#type').val
        foto: $('img').attr 'src'
      success: (res) ->
        console.log res.data
      error: (data) ->
        console.log data.responseText