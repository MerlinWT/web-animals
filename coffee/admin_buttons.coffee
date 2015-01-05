$ ->
  $('#admin-delete').on 'click', (e) ->
    do e.preventDefault
    action = $('table').attr('action')
    str_values = []
    $('input:checked').each ->
      #console.log $(@).closest('tr')
      str_values.push $(@).closest('tr').attr 'row-id'

    $.ajax
      type: 'POST'
      url: './php/edit/delete_row.php'
      dataType: 'json'
      data:
        table: action
        values: str_values
      success: (res) ->
        console.log res
        $.each str_values, ->
          console.log @
          do $("tr[row-id='#{@}']").remove
      error: (data) ->
        console.log 'err: %s', data.responseText
  $('#admin-edit, #admin-add').on 'click', (e) ->
    do e.preventDefault
    $('#item-form').attr('action', $(@).attr 'action')
    $('#item-form').modal 'show'
