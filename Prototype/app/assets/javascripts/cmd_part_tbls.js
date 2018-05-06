$(document).on("turbolinks:load", function() {
	$(".cmd_part_tbls.new").ready( function() {
		console.log("good luck");
		var user;
		var bit_sel;
		var lkup;
		user = $("#user_data").detach();
		bit_sel = $("#bit_sel_tbl").detach();
		lkup = $("#lkup_tbl").detach();
		var theSelector = $('#cmd_part_tbl_CMD_PART_TYPE');
		var theDivOfSelector = $('#CMD_PART_SELECTOR');
		function resolutionChanger() {
			console.log($(this).val());
			if ($(this).val() == "BIT_SEL_PART_TYPE"){
				bit_sel.insertAfter(theDivOfSelector);
				user.detach();											//Changed to detach as the select doesn't repond with the select2 gem when we try to use remove() 
				lkup.detach();
			} else if ($(this).val() == "LKUP_PART_TYPE") {
				lkup.insertAfter(theDivOfSelector);     
				user.detach();
				bit_sel.detach();
			} else if ( ($(this).val() == "USER_DATA_PART_TYPE") || ($(this).val() == "SHARED_PART_TYPE") ) {
					user.insertAfter(theDivOfSelector);
					lkup.detach();
					bit_sel.detach();
			}
		}
		function divShower() {
			$(".hidden-attrs").css("display", "block");
		}
		theSelector.on("change", resolutionChanger);
		user.on("focus","#USER_DATA", divShower);
		bit_sel.on("change", divShower);
		lkup.on("change", divShower);
	});
	
	$(".bit_sel_tbl_infos.show").ready( function() {
		$(".options_bar").css("display", "block");
	});
	$(".lkup_tbl_infos.show").ready( function() {
		$(".options_bar").css("display", "block");
	});

	$(".cmd_part_tbls.edit, .cmd_part_tbls.create, .cmd_part_tbls.update").ready( function() {
		console.log("good luck");
		var user;
		var bit_sel;
		var lkup;
		user = $("#user_data").detach();
		bit_sel = $("#bit_sel_tbl").detach();
		lkup = $("#lkup_tbl").detach();
		var theSelector = $('#cmd_part_tbl_CMD_PART_TYPE');
		var theDivOfSelector = $('#CMD_PART_SELECTOR');
		function resolutionChanger() {

			if (theSelector.val() == "BIT_SEL_PART_TYPE"){
				bit_sel.insertAfter(theDivOfSelector);
				user.detach();											//Changed to detach as the select doesn't repond with the select2 gem when we try to use remove() 
				lkup.detach();
			} else if (theSelector.val() == "LKUP_PART_TYPE") {
				lkup.insertAfter(theDivOfSelector);     
				user.detach();
				bit_sel.detach();
			} else if ( (theSelector.val() == "USER_DATA_PART_TYPE") || ($(this).val() == "SHARED_PART_TYPE") ) {
					user.insertAfter(theDivOfSelector);
					lkup.detach();
					bit_sel.detach();
			}
		}
		setTimeout(resolutionChanger, 1);
		$(".hidden-attrs").css("display","block");
		

		theSelector.on("change", resolutionChanger);
	});
	
	$(".bit_sel_tbl_infos.show").ready( function() {
		$(".options_bar").css("display", "block");
	});
	$(".lkup_tbl_infos.show").ready( function() {
		$(".options_bar").css("display", "block");
	});
	var float_regex = /^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$/;
	var integer_regex = /^[0-9]+$/;
	var error_text = $(".value_error_text");
	var validate_type;
	var value_enter_field;
	function validator() {
		var input = $(this).val();
		var is_valid;
		if(validate_type == "INTEGER_TYPE"){
			is_valid = integer_regex.test(input);
			if (is_valid){
				$("input[type='submit']").css("display","block");
				$(this).css("color", "green");
				$(this).css("border-color","green");
				error_text.css("display","none");
			} else{
				$("input[type='submit']").css("display","none");
				$(this).css("color", "#a94442");
				$(this).css("border-color","#a94442");
				error_text.text("Enter a proper integer").css("display","block");
			}
		}else if(validate_type == "FLOAT_TYPE"){
			is_valid = float_regex.test(input);
			if (is_valid){
				$("input[type='submit']").css("display","block");
				$(this).css("color", "green");
				$(this).css("border-color","green");
				error_text.css("display","none");
			} else{
				$("input[type='submit']").css("display","none")
				$(this).css("color", "#a94442");
				$(this).css("border-color","#a94442");
				error_text.text("Enter a proper floating point number").css("display","block");
			}
		} else {
			$("input[type='submit']").css("display","block");
		}
	}
	$(".lkup_tbls").ready( function(){
		validate_type = $("h1").data("value");
		$("#lkup_tbl_VALUE").on("input", validator);
	});

	$(".cpid_tbls").ready( function(){
		value_enter_field = $("#cpid_tbl_TM_VAL");
		validate_type = $("#cpid_tbl_PROC_TYPE").val();
		$("#cpid_tbl_PROC_TYPE").on("change", function(){
			validate_type = $(this).val();
			value_enter_field.css("color", "#555555");
			value_enter_field.css("border-color","#ccc");
			error_text.css("display","none");
			value_enter_field.ready( validator );
		});
		value_enter_field.on("input", validator);
	});

	$(".expressions").ready( function(){
		value_enter_field = $("#expression_VALUE");
		validate_type = $("#expression_VALUE_TYPE").val();
		$("#expression_VALUE_TYPE").on("change", function(){
			validate_type = $(this).val();
			value_enter_field.css("color", "#555555");
			value_enter_field.css("border-color","#ccc");
			error_text.css("display","none");
			value_enter_field.ready( validator );
		});
		value_enter_field.on("input", validator);
	});
});

// example of ajax
// $.ajax({ 
//   type: 'POST', 
//   url: 'financial_reports/report', 
//   data: {'start_date' : $("input[name='report[start_date]']").val(), 
//     'end_date' : $("input[name='report[end_date]']").val() }, 
//   success: function(data){
//  //data is whatever you RETURN from your controller. 

//     }

// example for alternative simpler verison
// console.log("water");
// 			var forClick = $(this).data("forClick");
// 			$.ajax("base_cmd_tbls/save_cmd(forClick)");


// THis is for difference b/w single click and double
// var DELAY = 700, clicks = 0, timer = null;

// $(function(){

//     $("a").on("click", function(e){

//         clicks++;  //count clicks

//         if(clicks === 1) {

//             timer = setTimeout(function() {

//                 alert("Single Click");  //perform single-click action    
//                 clicks = 0;             //after action performed, reset counter

//             }, DELAY);

//         } else {

//             clearTimeout(timer);    //prevent single-click action
//             alert("Double Click");  //perform double-click action
//             clicks = 0;             //after action performed, reset counter
//         }

//     })
//     .on("dblclick", function(e){
//         e.preventDefault();  //cancel system double-click event
//     });

// });

// Working edition

		// $("tr").on({"dblclick" : function() {
		// 	console.log("is in");
  // 			window.location = $(this).data("href");
		// },"click" : function(){
		// 	console.log("water");
		// 	value = $(this).data("value");
		// 	$.ajax({
		// 		type: 'POST',
		// 		url: 'base_cmd_tbls/save_cmd',
		// 		data: {'base_id' : value}
		// 	});
		// }});