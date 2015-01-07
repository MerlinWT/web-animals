$ ->
  $(document).on 'click', 'input[type="checkbox"]', ->
    count = $('input:checked').length
    $('#admin-edit').attr 'disabled', count != 1
    $('#admin-delete').attr 'disabled', count == 0

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
        admin_data action
      error: (data) ->
        console.log 'err: %s', data.responseText
  $('#admin-edit, #admin-add').on 'click', (e) ->
    do e.preventDefault
    $('#item-form').attr('action', $(@).attr 'action')
    $('#item-form').modal 'show'
