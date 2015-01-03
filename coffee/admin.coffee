$ ->
  console.log $.session.get('auth')
  if $.session.get('auth') == 'true'
    #грузим меню
    $.ajax
      type: 'POST'
      url: './admin_menu.html'
      success: (html) ->
        $('#admin-interface').html html

  auth = ->
    $.ajax
      type: 'POST'
      url: './php/auth.php'
      async: false
      dataType: 'json'
      data:
        user: do $('#input-user').val
        pass: do $('#input-pass').val
      success: (res) ->
        console.log res.result
        $.session.set('auth', res.result)
        location.reload(true)
      error: (data) ->
        console.log data.responseText

  $('#sign-in').on 'click', (e) ->
    do e.preventDefault
    do auth


