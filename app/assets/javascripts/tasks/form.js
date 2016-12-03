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

	$(document).on( "click", ".task", function() {
		$('.show').removeClass('show').find(".task-info").hide();
		$(this).addClass('show');
		$(this).find(".task-info").show("slow");

	});

});