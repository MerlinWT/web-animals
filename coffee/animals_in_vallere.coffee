$ ->
  $.ajax
    type: 'POST'
    url: './php/animals_in_vallere.php'
  .done (data) ->
    objData = $.parseJSON data
    tmpl = $ '.animal'
    do tmpl.hide
    $.each objData, ->
      #console.log "%s %s", @name, @label
      element = do tmpl.clone
      list = do tmpl.parent
      element.find('.animal-name').html @name
      element.appendTo list
      element.fadeIn 100

