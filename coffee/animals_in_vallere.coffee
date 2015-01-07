$ ->
  findFriend = ->
    seach_keys = $('#seach-input').val().split ' '
    $('.animal-info').each ->
      element = $(@).closest('li.animal')
      unless element.hasClass 'tmpl'
        do element.hide
        seach_text = do $(@).html
        $.each seach_keys, ->
          if String(seach_text).indexOf(@) != -1
            element.fadeIn 300


  $( document ).on 'click', '.get-friend', (e) ->
    #перадаем идентификатор животного на форму регистрации заявки
    do e.preventDefault
    $('.alert').slideUp 200
    $('#get-friend-form').find('#id-animal').val $(@).closest('li.animal').find('.id-animal').val()
    $('#get-friend-form').modal 'show' #показываем форму

  #$('#get-friend-form').on 'hide', ->


  $('#seach-input').on 'keyup', ->
    do findFriend

  $.ajax #получам список животных питомника
    type: 'POST'
    url: './php/animals_in_vallere.php'
  .done (data) ->
    objData = $.parseJSON data
    tmpl = $ '.animal'
    do tmpl.hide
    $.each objData, -> #формируем список животный по шаблону
      element = do tmpl.clone
      element.removeClass('tmpl')
      list = do tmpl.parent
      element.find('.animal-name').html @name
      element.find('.animal-info').html @comment
      element.find('img').prop 'src', "php/foto.php?id=#{@id_animal}&from=animal"
      element.find('.id-animal').val @id_animal
      element.appendTo list
      element.fadeIn 500

