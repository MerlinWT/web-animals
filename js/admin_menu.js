// Generated by CoffeeScript 1.8.0
(function() {
  $(function() {
    window.admin_data = function(action) {
      return $.ajax({
        type: 'POST',
        url: './php/admin/admin_data.php',
        data: {
          action: action
        },
        async: false,
        dataType: 'json',
        success: function(res) {
          var table;
          table = $('tbody');
          $(table).html('');
          $(table).parent().attr('action', action);
          return $.each(res.data, function() {
            var id, row;
            row = $('<tr></tr>').attr('row-id', this.id);
            id = this.id;
            $(row).append($("<td><input type='checkbox'></td>"));
            $.each(this, (function(_this) {
              return function(key, value) {
                var idAttr, idKey;
                if (key.slice(0, 2) !== 'id') {
                  if (key === 'foto' && value === '1') {
                    return $(row).append($("<td><a target='_blank' href='./php/foto.php?id=" + id + "&from=" + action + "'>фото</a></td>"));
                  } else {
                    idKey = _this["id_" + key];
                    idAttr = idKey != null ? " id-dic=" + idKey : '';
                    return $(row).append($("<td" + idAttr + ">" + value + "</td>"));
                  }
                }
              };
            })(this));
            return $(table).append(row);
          });
        },
        error: function(data) {
          return console.log(data.responseText);
        }
      }, console.log('admin menu'));
    };
    return $('ul.admin-menu li').on('click', function() {
      var action;
      action = $(this).prop('id');
      console.log(action);
      $.ajax({
        type: 'POST',
        url: './php/admin_menu.php',
        data: {
          action: action
        },
        async: false,
        success: function(html) {
          return $('.admin-content').html(html);
        },
        error: function() {
          return console.log('admin menu error');
        }
      });
      return admin_data(action);
    });
  });

}).call(this);
