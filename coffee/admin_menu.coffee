$ ->
  window.admin_data = (action) ->
    $.ajax
      type: 'POST'
      url: './php/admin/admin_data.php'
      data:
        action: action
      async: false
      dataType: 'json'
      success: (res) ->
        console.log res
        table = $('tbody')
        $(table).html ''
        $(table).parent().attr 'action', action
        $.each res.data, ->
          row = $('<tr></tr>').attr 'row-id', @id
          id = @id
          $(row).append($("<td><input type='checkbox'></td>"))
          #console.log @
          $.each @, (key, value) =>
            #console.log '%s %s', key, @["id_#{key}"]
            unless key[0..1] == 'id'
              if key == 'foto' and value == '1'
                $(row).append($("<td><a target='_blank' href='./php/foto.php?id=#{id}&from=#{action}'>фото</a></td>"))
              else
                idKey = @["id_#{key}"]
                idAttr = if idKey? then " id-dic=#{idKey}" else ''
                $(row).append($("<td#{idAttr}>#{value}</td>"))
          $(table).append(row)
      error: (data) ->
        console.log data.responseText
      console.log 'admin menu'
  $('ul.admin-menu li').on 'click', ->
    action = $(@).prop 'id'
    console.log action
    #запрос формы
    $.ajax
      type: 'POST'
      url: './php/admin_menu.php'
      data:
        action: action
      async: false
      success: (html) ->
        $('.admin-content').html html
      error: ->
        console.log 'admin menu error'
    #запрос данных
    admin_data action;
