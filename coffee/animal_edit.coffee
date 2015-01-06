$ ->
  action = 'add'
  row = null
  $('#item-form').on 'show', ->
    action = $('#item-form').attr 'action'
    row = $('input:checked').closest('tr')
    #если режим редактирования - загружаем данные на форму
    values =
      name:
        edit: do $(row).children().eq(1).html
        add: ''
      type:
        edit: $(row).children().eq(2).attr('id-dic')
        add: -1
      comment:
        edit: do $(row).children().eq(3).html
        add: ''
      img:
        edit: $(row).find('a').attr 'href'
        add: ''
    $('#name').val values.name[action]
    $('#type').val values.type[action]
    $('#comment').val values.comment[action]

    $('img').attr 'src', values.img[action]
  ##Справочники
  #тип животного
  dictionary
    data:
      table: 'animal_type'
      id: 'id_animal_type'
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
      add: './php/edit/animal_insert.php'
      edit: './php/edit/animal_update.php'
    $.ajax
      type: 'POST'
      url: urls[action]
      dataType: 'json'
      data:
        id: $(row).attr 'row-id'
        name: do $('#name').val
        id_type: do $('#type').val
        #id_vallere: do $('#vallere-list').val
        comment: do $('#comment').val
        foto: $('img').attr 'src'
      success: (res) ->
        console.log res.data
        #обновление данных
        admin_data 'animal'
      error: (data) ->
        console.log data.responseText