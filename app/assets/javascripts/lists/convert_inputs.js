$(document).on('turbolinks:load', function() {

  $.fn.editable.defaults.mode = 'inline';
  $.fn.editableform.buttons =
  '<button type="submit" class="btn btn-primary btn-sm editable-submit">'+
    '<i class="fa fa-fw fa-check"></i>'+
  '</button>'+
  '<button type="button" class="btn btn-default btn-sm editable-cancel">'+
    '<i class="fa fa-fw fa-times"></i>'+
  '</button>';
  $.fn.editable.defaults.ajaxOptions = {type: 'patch', dataType: 'json'};

	$('.edit_list').editable({
        success: function(response) {
          console.log('1');
        },
        error: function(errors) {
          console.log(errors);
          return errors.responseJSON
        }
    });
});