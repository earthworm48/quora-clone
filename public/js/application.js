$(document).ready(function(){
	$(".upvote-button").click(function(){
		var url = $(this).data('vote-url');
	    $.ajax({
	           type: "post",
	           url: url,
	           dataType: "json",
	           
	           
	           success: function(response)
	           {	
	           		
	               $('#upvote-button-' + response.question_id).html("Upvote " + response.questionvotes);		
 
	           },
	           error: function(response){
            		.;
        		}
	         });
	})
});

