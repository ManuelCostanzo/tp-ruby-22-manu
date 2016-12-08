$(document).on('turbolinks:load', function() {

  $.fn.editable.defaults.mode = 'inline';

  $.fn.editableform.buttons =
  '<button type="submit" class="btn btn-primary btn-sm editable-submit">'+
    '<i class="fa fa-fw fa-check"></i>'+
  '</button>'+
  '<button type="button" class="btn btn-default btn-sm editable-cancel">'+
    '<i class="fa fa-fw fa-times"></i>'+
  '</button>';

  $.fn.editable.defaults.ajaxOptions = {dataType: 'json'};


});



function update_date(date) {
  $('#list-update').hide().html(date).fadeIn(1500);
}

function update_tasks_count() {
	$('.tasks-count').hide().html($('.task').length).fadeIn(1500);
}