$ ->
  action = 'add'
  row = null
  $('#item-form').on 'show', ->
    action = $('#item-form').attr 'action'
    row = $('input:checked').closest('tr')
    #если режим редактирования - загружаем данные на форму
    values =
      label:
        edit: do $(row).children().eq(1).html
        add: ''
      type:
        edit: $(row).children().eq(2).attr('id-dic')
        add: -1
      img:
        edit: $(row).find('a').attr 'href'
        add: ''

    $('#label').val values.label[action]
    $('#type').val values.type[action]
    $('img.foto').attr 'src', values.img[action]
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
    uploadImage file, 'img.foto'
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
        foto: $('img.foto').attr 'src'
      success: (res) ->
        console.log res.data
        #обновление данных
        admin_data 'vallere'
      error: (data) ->
        console.log data.responseText