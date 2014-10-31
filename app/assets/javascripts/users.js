(function($, t) {

  $(function() {
      $('#new_user').on('submit', function(event) {
      var hasError = false;
      $('input.required').each(function() {
        var $field = $(this);
        if ($field.val().trim().length === 0) {
          t.markError($field, 'debes ingresar un valor');
          hasError = true;
        } else {
          t.markError($field);
        }
      });
      if (hasError) {
        event.preventDefault();
      }
    });

  });

})(jQuery, TeachrApp);
