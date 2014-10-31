var TeachrApp = {
  markError: function($field, message) {
    var error = message === undefined ? false : true;
    $field.parent('div.input').toggleClass('field_with_errors', error);
    var $errorMessage = $field.next('span.error');
    if($errorMessage.length === 0) {
      $errorMessage = $('<span class="error"></span>');
      $errorMessage.insertAfter($field);
    }
    $errorMessage.html(message);
    $errorMessage.toggle(error);
  }
}
