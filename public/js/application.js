$(document).ready(function(){
	$(".upvote-button").click(function(){
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

	$(".upvote-button-answer").click(function(){
		var url = $(this).data('vote-url');

	    $.ajax({
	           type: "post",
	           url: url,
	           dataType: "json",
	           
	           success: function(response)
	           {

	               $('#upvote-button-answer-' + response.answer_id).html("Upvote" + response.name_upvote + " " + response.answervotes);		
 				   $('#downvote-button-answer-' + response.answer_id).html("Downvote" + response.name_downvote);			
	           },
	         });
	})


	$(".downvote-button-answer").click(function(){
		var url = $(this).data('vote-url');

	    $.ajax({
	           type: "post",
	           url: url,
	           dataType: "json",
	           
	           success: function(response)
	           {
	               $('#upvote-button-answer-' + response.answer_id).html("Upvote" + response.name_upvote + " " + response.answervotes);		
 				   $('#downvote-button-answer-' + response.answer_id).html("Downvote" + response.name_downvote);			
 
	           },
	         });

	})



	// $("#myBtn").click(function(){
 //        $("#myModal").modal();
 //    });

	// $(function() {
 //    $( "#dialog" ).dialog({
 //      autoOpen: false,
 //      show: {
 //        effect: "blind",
 //        duration: 1000
 //      },
 //      hide: {
 //        effect: "explode",
 //        duration: 1000
 //      }
 //    });

 //    $( ".opener" ).click(function() {
 //    	alert("hi");
 //      $( "#dialog" ).dialog( "open" );
 //    });
 //  });
	
	// $("#target").submit(function(e){
	// 	e.preventDefault();


	//     $.ajax({
	//            type: "post",
	//            url: "/answers",
	//            dataType: "json",

	//            success: function(response)
	//            {
	//            		debugger
	//                $('.answer-each').after(response);
	               
	//            },
	//          });
	// })


});

