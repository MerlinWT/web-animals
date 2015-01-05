$ ->
  action = 'add'
  row = null
  $('#item-form').on 'show', ->
    action = $('#item-form').attr 'action'
    #если режим редактирования - загружаем данные на форму
    if action = 'edit'
      row = $('input:checked').closest('tr')
      console.log row
      $('#label').val do $(row).children().eq(1).html
      $('#type').val $(row).children().eq(2).attr('id-dic')
      $('img').attr 'src', $(row).find('a').attr 'href'
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
    urls =
      add: './php/edit/vallere_insert.php'
      edit: './php/edit/vallere_update.php'
    $.ajax
      type: 'POST'
      url:  urls[action]
      dataType: 'json'
      data:
        id: $(row).attr 'row-id'
        label: do $('#label').val
        id_vallere_type: do $('#type').val
        foto: $('img').attr 'src'
      success: (res) ->
        console.log res.data
        #обновление данных
        admin_data 'vallere'
      error: (data) ->
        console.log data.responseText