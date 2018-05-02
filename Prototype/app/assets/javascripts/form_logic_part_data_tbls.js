$(document).on("turbolinks:load", function() {
	$(".form_logic_part_data_tbls.new").ready( function() {
		console.log("working in form logic");

		var all_logic;
		var form_logic;
		var form_logic_selector;
		var form_logic_val;
		var user;
		var bit_sel;
		var lkup;
		user = $("#user_data").detach();
		bit_sel = $("#bit_sel_tbl").detach();
		lkup = $("#lkup_tbl").detach();
		var theSelector = $('#form_logic_part_data_tbl_PART_TYPE');
		var theDivOfSelector = $('#PART_SELECTOR');
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
		all_logic = $("#all_sub_logic");
		form_logic_selector = $("#form_logic_part_data_tbl_SUB_LOGIC_TYPE");
		form_logic = $("#form_sub_logic").detach();
		/* For radio buttons in form_logic_part_data_tbls */

		$("#all").click(function(){
			all_logic.insertAfter(radio_button_for_logic);
			form_logic.detach();
			//$('#form_logic_part_data_tbl_LOGIC_LEVEL').removeAttr("disabled");// disabled attribute doesn't post the attribute through the request
			$('#form_logic_part_data_tbl_LOGIC_LEVEL').removeAttr("readonly");
		});
		$("#formation_logic").click(function(){
			form_logic.insertAfter(radio_button_for_logic);
			all_logic.detach();
			//$('#form_logic_part_data_tbl_LOGIC_LEVEL').attr("disabled", true);// disabled attribute doesn't post the attribute through the request
			$('#form_logic_part_data_tbl_LOGIC_LEVEL').attr("readonly", true);
		});

		form_logic_selector.on("change", function(){
			form_logic_val = $(this).val();
			$.ajax({
				type: 'POST',
				url: '/form_logic_part_data_tbls/fetch_sub_logic_val',
				data: {'form_logic_name' : form_logic_val}
			});
		});
	});
	$(".form_logic_part_data_tbls.edit, .form_logic_part_data_tbls.create, .form_logic_part_data_tbls.update").ready( function() {
		console.log("working in form logic edit");

		var value_of_sublogic;
		var user;
		var all_logic;
		var form_logic;
		var form_logic_selector;
		var form_logic_val;
		var user;
		var bit_sel;
		var lkup;
		user = $("#user_data").detach();
		bit_sel = $("#bit_sel_tbl").detach();
		lkup = $("#lkup_tbl").detach();
		var theSelector = $('#form_logic_part_data_tbl_PART_TYPE');
		var theDivOfSelector = $('#PART_SELECTOR');
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
		$(".hidden-attrs").css("display","block");
		setTimeout(resolutionChanger, 1);

		theSelector.on("change", resolutionChanger);

		value_of_sublogic = $("span#value_holder").data("value");
		console.log(value_of_sublogic);


		all_logic = $("#all_sub_logic");
		form_logic_selector = $("#form_logic_part_data_tbl_SUB_LOGIC_TYPE");
		form_logic = $("#form_sub_logic").detach();


		if (value_of_sublogic == "ALL") {
			all_logic.insertAfter(radio_button_for_logic);
			form_logic.detach();
			$('#form_logic_part_data_tbl_LOGIC_LEVEL').removeAttr("readonly");	
		} else {
			$("#formation_logic").attr("checked", true);
			form_logic.insertAfter(radio_button_for_logic);
			all_logic.detach();
			$('#form_logic_part_data_tbl_LOGIC_LEVEL').attr("readonly", true);
		}

		/* For radio buttons in form_logic_part_data_tbls */
		$("#all").click(function(){
			all_logic.insertAfter(radio_button_for_logic);
			form_logic.detach();
			$('#form_logic_part_data_tbl_LOGIC_LEVEL').removeAttr("readonly");
		});
		$("#formation_logic").click(function(){
			form_logic.insertAfter(radio_button_for_logic);
			all_logic.detach();
			$('#form_logic_part_data_tbl_LOGIC_LEVEL').attr("readonly", true);
		});

		form_logic_selector.on("change", function(){
			form_logic_val = $(this).val();
			$.ajax({
				type: 'POST',
				url: '/form_logic_part_data_tbls/fetch_sub_logic_val',
				data: {'form_logic_name' : form_logic_val}
			});
		});
	});	
});