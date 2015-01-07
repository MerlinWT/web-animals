$ ->
  window.currentDate = ->
    d = new Date()
    month = d.getMonth()+1;
    day = d.getDate();
    "#{0 if day<10}#{day}.#{0 if month<10}#{month}.#{d.getFullYear()}"

  $(document).on 'focus', '.dtp', ->
    control = $(':focus').context.activeElement
    console.log control

    $(control).datepicker
      language: "ru"
      autoclose: true
      todayHighlight: true
###
    $(':focus').datepicker('show')

###