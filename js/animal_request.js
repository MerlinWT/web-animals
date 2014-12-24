// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    return $('#animal-request').on('click', function() {
      return $.ajax({
        type: 'POST',
        url: './php/animal_request.php',
        data: {
          firstName: $('#first-name').val(),
          lastName: $('#last-name').val(),
          contactPhone: $('#contact-phone').val(),
          idAnimal: $('#id-animal').val()
        }
      }).done(function(html) {
        $('#get-friend-form').modal('hide');
        return $('.alert').slideDown(200);
      });
    });
  });

}).call(this);