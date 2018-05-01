$(document).on("turbolinks:load", function() {
	$(".form_logic_part_data_tbls.new").ready( function() {
		console.log("working in form logic");

		var user;
		var all_logic;
		var form_logic;
		var form_logic_selector;
		var form_logic_val;
		// user = $("#user_data").detach();
		user = $("#user_data");
		user.on("input","#USER_DATA", function(){
			$(".hidden-attrs").css("display", "block");
		})
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
	$(".form_logic_part_data_tbls.edit").ready( function() {
		console.log("working in form logic edit");

		var value_of_sublogic;
		var user;
		var all_logic;
		var form_logic;
		var form_logic_selector;
		var form_logic_val;

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