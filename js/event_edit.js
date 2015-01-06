// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    var action, row;
    action = 'add';
    row = null;
    $('#item-form').on('show', function() {
      var values;
      action = $('#item-form').attr('action');
      row = $('input:checked').closest('tr');
      values = {
        date: {
          edit: $(row).children().eq(1).html(),
          add: currentDate()
        },
        text: {
          edit: $(row).children().eq(2).html(),
          add: ''
        }
      };
      $('#date').val(values.date[action]);
      return $('#text').val(values.text[action]);
    });
    return $('#add').on('click', function() {
      var urls;
      urls = {
        add: './php/edit/event_insert.php',
        edit: './php/edit/event_update.php'
      };
      return $.ajax({
        type: 'POST',
        url: urls[action],
        dataType: 'json',
        data: {
          id: $(row).attr('row-id'),
          date: $('#date').val(),
          text: $('#text').val()
        },
        success: function(res) {
          console.log(res.data);
          return admin_data('event');
        },
        error: function(data) {
          return console.log(data.responseText);
        }
      });
    });
  });

}).call(this);
