// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    dictionary({
      data: {
        table: 'animal',
        id: 'id_animal',
        value: 'name'
      },
      control: '#animal-list'
    });
    dictionary({
      data: {
        table: 'vallere',
        id: 'id_vallere',
        value: 'label'
      },
      control: '#vallere-list'
    });
    return $('#add').on('click', function() {
      return $.ajax({
        type: 'POST',
        url: './php/edit/hotel_insert.php',
        dataType: 'json',
        data: {
          sd: $('#sd').val(),
          ed: $('#ed').val(),
          id_animal: $('#animal-list').val(),
          id_vallere: $('#vallere-list').val()
        },
        success: function(res) {
          console.log(res.data);
          return admin_data('hotel');
        },
        error: function(data) {
          return console.log(data.responseText);
        }
      });
    });
  });

}).call(this);
