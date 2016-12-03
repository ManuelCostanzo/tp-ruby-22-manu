$(document).on('turbolinks:load', function() {

	form = $('form.edit_list');
	input = form.find('input#list_title');
	input.hide();
	value = input.val();
	div = input.closest('div');
	$("<span />", {text: value}).insertAfter(input).wrapInner('<h1 />');
	span = form.find('span');

  span.click(function() {

    lastValue = $(this).text()
    ok = true;
    span.hide();
    feedback = div.find('.form-control-feedback');
    feedback.show();
    input.show().focus();

    input.blur(function() {
      if (ok) {
        input.focusout().hide();
        span.show().find('h1').text(input.val());
        feedback.hide();
        if (lastValue != input.val()) {
          form.submit();
          span.trigger("click");
        }
        ok = false
      }
    });
  });
});

function showError(errors) {

  div.addClass("has-danger");
  input.addClass("form-control-danger")
  div.find('.form-control-feedback').remove();
  span.css('color', 'red').after('<div class="form-control-feedback">' + errors + '</div>');
  span.trigger("click");
}

function showSuccess(html) {
  div.removeClass("has-danger").addClass("has-success");
  div.find('.form-control-feedback').remove();
  input.removeClass("form-control-danger").addClass("form-control-success");
  span.removeAttr('style').trigger("click");
  $("#list-update").html(html);
}