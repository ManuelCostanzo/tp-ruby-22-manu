$(document).on('turbolinks:load', function() {

/********** CONFIGURACIONES GLOBALES DE X-EDITABLE **********/

  $.fn.editable.defaults.mode = 'inline';

  $.fn.editableform.buttons =
  '<button type="submit" class="btn btn-primary btn-sm editable-submit">'+
    '<i class="fa fa-fw fa-check"></i>'+
  '</button>'+
  '<button type="button" class="btn btn-default btn-sm editable-cancel">'+
    '<i class="fa fa-fw fa-times"></i>'+
  '</button>';

  $.fn.editable.defaults.ajaxOptions = {dataType: 'json'};

      var original = $.fn.editableutils.setCursorPosition;
      $.fn.editableutils.setCursorPosition = function() {
          try {
              original.apply(this, Array.prototype.slice.call(arguments));
          } catch (e) { /* noop */ }
      };

//////////////////////////////////////////////////////////

});


/********** FUNCIONES MUY USADAS **********/

function update_date(date) {
  $('#list-update').hide().html(date).fadeIn(1500);
}

function update_tasks_count() {
	$('.tasks-count').hide().html($('.task').length).fadeIn(1500);
}

//////////////////////////////////////////////////////////