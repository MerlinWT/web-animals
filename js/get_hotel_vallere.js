// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    var loadValleres;
    $('#begin-date').val(currentDate());
    $('#end-date').val(currentDate());
    loadValleres = function() {
      return $.ajax({
        type: 'POST',
        url: './php/vallere/hotel_vallere_list.php',
        data: {
          sd: $('#begin-date').val(),
          ed: $('#end-date').val()
        },
        dataType: 'json',
        async: true,
        success: function(response) {
          var idVallere, option, url;
          console.clear();
          console.log(response);
          option = $('<option></option>');
          $('#valliere').html('');
          $.each(response.data, function() {
            var valere;
            valere = $(option).clone();
            $(valere).val(this.id_vallere);
            $(valere).html(this.label);
            return $('#valliere').append(valere);
          });
          idVallere = $('#valliere option:first-child').val();
          console.log(idVallere);
          $('#valliere').attr('disabled', idVallere == null);
          $('#show-form-registrate').attr('disabled', idVallere == null);
          if (idVallere != null) {
            url = './php/vallere/vallere_foto.php?id=' + $('#valliere option:first-child').val();
          } else {
            url = './img/hotel_off.png';
          }
          return $('#vallere-foto').prop('src', url);
        },
        error: function(data) {
          return console.log(data.responseText);
        }
      });
    };
    loadValleres();
    $('#begin-date, #end-date').on('change', function() {
      return loadValleres();
    });
    $('#valliere').on('change', function() {
      return $('#vallere-foto').prop('src', './php/vallere/vallere_foto.php?id=' + $('#valliere option:selected').val());
    });
    $('#show-form-registrate').on('click', function(e) {
      e.preventDefault;
      return $('#form-hotel-registrate').modal('show');
    });
    return $('#geristrate-hotel').on('click', function() {
      return $.ajax({
        type: 'POST',
        url: './php/vallere/hotel_vallere_registrate.php',
        data: {
          sd: $('#begin-date').val(),
          ed: $('#end-date').val(),
          idVallere: $('#valliere option:selected').val(),
          firstName: $('#first-name').val(),
          lastName: $('#last-name').val(),
          comment: $('#comment').val(),
          contactPhone: $('#contact-phone').val()
        },
        dataType: 'json',
        async: true,
        success: function(data) {
          console.log(data);
          loadValleres();
          return $('#form-hotel-registrate').modal('hide');
        },
        error: function(data) {
          return console.log(data.responseText);
        }
      });
    });
  });

}).call(this);
