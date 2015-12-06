$(document).ready(function(){
	$(".upvote-button").click(function(){
		var url = $(this).data('vote-url');
	    $.ajax({
	           type: "post",
	           url: url,
	           dataType: "json",
	           
	           
	           success: function(response)
	           {	
	           		
	               $('#upvote-button-' + response.question_id).html("Upvote " + response.questionvotes); // show response from the php script.		
 
	           },
	           error: function(xhr,response){
            		console.log("Error code is "+xhr.status+" and the error is "+response);
        		}
	         });
	})
});

