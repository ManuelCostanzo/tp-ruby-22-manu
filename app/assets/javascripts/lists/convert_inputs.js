$(document).on('turbolinks:load', function() {

	$('.edit_list').editable({
        success: function(response) {
          update_date(response.date);
        },
        error: function(errors) {
          return errors.responseJSON.toString().replace(/,/g, ".\n");
        }
    });
});