$ ->
  $(document).on 'focus', '.dtp', ->
    console.log '!!!'
    $(':focus').datepicker
      language: "ru"
      autoclose: true
      todayHighlight: true
    $(':focus').datepicker('show')