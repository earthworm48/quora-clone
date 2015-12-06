$(document).ready(function(){
	$(".upvote-button").click(function(){
		var url = $(this).data('vote-url');

	    $.ajax({
	           type: "post",
	           url: url,
	           dataType: "json",
	           
	           success: function(response)
	           {
					// debugger
	               $('#upvote-button-' + response.question_id).html("Upvote" + response.name_upvote + " " + response.questionvotes);		
 				   $('#downvote-button-' + response.question_id).html("Downvote" + response.name_downvote);		
	           },
	         });
	})


	$(".downvote-button").click(function(){
		var url = $(this).data('vote-url');

	    $.ajax({
	           type: "post",
	           url: url,
	           dataType: "json",
	           
	           success: function(response)
	           {
	               $('#upvote-button-' + response.question_id).html("Upvote" + response.name_upvote + " " + response.questionvotes);		
 				   $('#downvote-button-' + response.question_id).html("Downvote" + response.name_downvote);			
 
	           },
	         });
	})
});

