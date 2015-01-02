$ ->
  currentDate = ->
    d = new Date()

    month = d.getMonth()+1;
    day = d.getDate();
    output = "#{0 if day<10}#{day}.#{0 if month<10}#{month}.#{d.getFullYear()}"

  $('#begin-date').val do currentDate
  $('#end-date').val do currentDate

  #Загрузка списка вальеров
  loadValleres = ->
    $.ajax
      type: 'POST'
      url: './php/vallere/hotel_vallere_list.php'
      data:
        sd: do $('#begin-date').val
        ed: do $('#end-date').val
      dataType: 'json'
      async: true
      success: (response) ->
        do console.clear
        console.log response
        option = $('<option></option>')
        $('#valliere').html ''
        $.each response.data, ->
          valere = do $(option).clone
          $(valere).val @.id_vallere
          $(valere).html @.label
          $('#valliere').append valere
        #первый вальер в списке по умолчанию
        $('#vallere-foto').prop 'src', './php/vallere/vallere_foto.php?id=' + $('#valliere option:first-child').val()
      error: (data) ->
        console.log data.responseText

  do loadValleres

  $('#begin-date, #end-date').on 'change', ->
    do loadValleres

  #меняем картинку при выборе вальера
  $('#valliere').on 'change', ->
    $('#vallere-foto').prop 'src', './php/vallere/vallere_foto.php?id=' + $('#valliere option:selected').val()
  #ввод личных данных
  $('#show-form-registrate').on 'click', (e) ->
    e.preventDefault
    $('#form-hotel-registrate').modal 'show'
  #регистрация заявления
  $('#geristrate-hotel').on 'click', ->
    $.ajax
      type: 'POST'
      url: './php/vallere/hotel_vallere_registrate.php'
      data:
        sd: do $('#begin-date').val
        ed: do $('#end-date').val
        idVallere: do $('#valliere option:selected').val
        firstName: do $('#first-name').val
        lastName: do $('#last-name').val
        comment: do $('#comment').val
        contactPhone: do $('#contact-phone').val
      dataType: 'json'
      async: true
      success: (data) ->
        console.log data
        do loadValleres
        $('#form-hotel-registrate').modal 'hide'
      error: (data) ->
        console.log data.responseText