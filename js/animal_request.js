// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    return $('#animal-request').on('click', function() {
      return $.ajax({
        type: 'POST',
        url: './php/animal_request.php'
      });
    });
  });

}).call(this);
