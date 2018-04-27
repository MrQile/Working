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
			if ($(this).val() == "BIT_SEL_TBL_INFO"){
				bit_sel.insertAfter(theDivOfSelector);
				user.detach();											//Changed to detach as the select doesn't repond with the select2 gem when we try to use remove() 
				lkup.detach();
			} else if ($(this).val() == "LKUP_TBL_INFO") {
				lkup.insertAfter(theDivOfSelector);     
				user.detach();
				bit_sel.detach();
			} else if ($(this).val() == "USER_DATA") {
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

	$(".cmd_part_tbls.edit").ready( function() {
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

			if (theSelector.val() == "BIT_SEL_TBL_INFO"){
				bit_sel.insertAfter(theDivOfSelector);
				user.detach();											//Changed to detach as the select doesn't repond with the select2 gem when we try to use remove() 
				lkup.detach();
			} else if (theSelector.val() == "LKUP_TBL_INFO") {
				lkup.insertAfter(theDivOfSelector);     
				user.detach();
				bit_sel.detach();
			} else if (theSelector.val() == "USER_DATA") {
					user.insertAfter(theDivOfSelector);
					lkup.detach();
					bit_sel.detach();
			}
		}
		
		setTimeout(resolutionChanger, 1);

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