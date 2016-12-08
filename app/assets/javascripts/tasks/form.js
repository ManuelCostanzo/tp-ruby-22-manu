$(document).on('turbolinks:load', function() {

	function hideTaskForm() {
		$("#simple, #temporary, #submit-task").hide();
	}

	hideTaskForm();

	$("#task_type").change(function() {

		switch($("#task_type").val()) {
		    case 'Temporary':
		        $("#simple, #temporary, #submit-task").show("slow");
		        break;
		    case 'Simple':
		    case 'Long':
		  		$("#temporary, #simple").hide();
		  		$("#simple, #submit-task").show("slow");
		      break;
		    default:
		        hideTaskForm();
		};

	  	$("#task-msg").empty().removeAttr('class');
	});

	$('#new_task').on('ajax:success', function(event, xhr, status, error) {
		$('#pending').html(xhr.html);
		update_date(xhr.date);
	 	update_tasks_count();
		$(window).scrollTop($('#task-' + xhr.id).offset().top);
		$('#task-' + xhr.id).hide().fadeIn(1500);
	});


	$('#new_task').on('ajax:error', function(event, xhr, status, error) {
  	$("#task-msg").removeAttr('class').addClass("alert alert-danger").html(xhr.responseJSON.toString().replace(/,/g, ".</br>"));
	});


	$(document).on( "click", ".open-task", function() {
		$('.show').removeClass('show').show().next(".task-info").hide();
		$(this).addClass('show').hide();
		$(this).next(".task-info").show("slow");
		$(this).next('.task-info').find('.editable').editable({
			    success : function(response) {
							$('.tasks').html(response.html);
			        update_date(response.date);
			        update_tasks_count();
							$(window).scrollTop($('#task-' + response.id).offset().top);
							$('#task-' + response.id).hide().fadeIn(1500);
			    },
			    error: function(errors) {
			    	return errors.responseJSON.toString().replace(/,/g, ".\n");
			    }
			});

	});
});