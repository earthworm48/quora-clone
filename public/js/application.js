$(document).ready(function(){

	var minimized_elements = $('.truncated_answer_content');
    var minimize_character_count = 100;    

    minimized_elements.each(function(){    
        var t = $(this).text();        
        if(t.length < minimize_character_count ) return;

        $(this).html(
            t.slice(0,minimize_character_count )+'<span>... </span><a href="#" class="more">(More)</a>'+
            '<span style="display:none;">'+ t.slice(minimize_character_count ,t.length)+' <a href="#" class="less">(Less)</a></span>'
        );

    }); 

    $('a.more', minimized_elements).click(function(event){
        event.preventDefault();
        $(this).hide().prev().hide();
        $(this).next().show();        
    });

    $('a.less', minimized_elements).click(function(event){
        event.preventDefault();
        $(this).parent().hide().prev().show().prev().show();    
    });

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

