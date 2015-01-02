$ ->
  $.ajax
    type: 'POST'
    url: './php/events_list.php'
    #data: {}
    async: false
    dataType: 'json'
    success: (res) ->
      template = $ '.event-templait'

      $.each res.data, ->
        event = do $(template).clone
        $(event).find('.event-text').html @text
        $(event).find('.event-date').html @date
        $(template).parent().append(event)
        do $(event).show

      console.log res
    error: (data) ->
      console.log data.responseText