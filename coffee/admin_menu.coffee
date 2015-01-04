$ ->
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
    $.ajax
      type: 'POST'
      url: './php/admin/admin_data.php'
      data:
        action: action
      async: false
      dataType: 'json'
      success: (res) ->
        console.log res.data
        table = $('tbody')
        $(table).parent().attr 'action', action
        $.each res.data, ->
          row = $('<tr></tr>').attr 'row-id', @id
          $(row).append($("<td><input type='checkbox'></td>"))
          $.each @, (key, value) ->
            unless key == 'id'
              if key == 'foto'
                $(row).append($("<td><a href='#'>фото</a></td>"))
              else
                $(row).append($("<td>#{value}</td>"))
          $(table).append(row)
      error: (data) ->
        console.log data.responseText
