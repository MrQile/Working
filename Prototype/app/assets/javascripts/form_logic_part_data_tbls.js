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

		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var original_id_3 = $("div#details_holder").data("original_3");
		var present_id_1;
		var present_id_2;
		var present_id_3;
		var error_shower = $("div#details_holder");
		$("#form_logic_part_data_tbl_LOGIC_LEVEL").on({"input" : function(){
			$(".btn").attr("disabled", true);
			if ($(this).val()>2 || $(this).val()<1) {
				error_shower.text("Logic Level must be either 1 or 2").css("color", "#a94442").css("display","block");
			} else {
				form_data_function();
			}
		}});

		form_logic_selector.on("change", function(){
			form_logic_val = $(this).val();
			$.ajax({
				type: 'POST',
				url: '/form_logic_part_data_tbls/fetch_sub_logic_val',
				data: {'form_logic_name' : form_logic_val}
			});
			$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/form_logic_part_data_tbls/fetch_sub_logic_val',
					data: {'form_logic_name' : form_logic_val }
			}).done(function(data) {
				$('#form_logic_part_data_tbl_LOGIC_LEVEL').val(data.logic_value);
			}).fail(function(){
				console.log("Request failed");
			}).always(function() {
				$(".btn").attr("disabled", true);
				console.log("inside func running i guess");
				form_data_function();
			});

		});

		$("#form_logic_part_data_tbl_PART_NO").on({"blur" : form_data_function});
		$("#form_logic_part_data_tbl_PART_NO").focus(function(){
			$(".btn").attr("disabled", true);
		});
		function form_data_function() {
			present_id_1 = original_id_1;
			present_id_2 = $("#form_logic_part_data_tbl_PART_NO").val();
			present_id_3 = $("#form_logic_part_data_tbl_LOGIC_LEVEL").val();
			if (((original_id_2 != present_id_2)||(original_id_3 != present_id_3))&&((present_id_2.length != 0 && present_id_3.length != 0 ))) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/form_logic_part_data_tbls/check_unique',
					data: {'key1' : present_id_1,'key2' : present_id_2,'key3' : present_id_3 }
				}).done(function(data) {
					if (data.valid) {
						$(".btn").removeAttr("disabled");
						error_shower.text("Record Unique").css("color","green").css("display","block");
					} else {
						error_shower.text("Key field(s) not unique").css("color", "#a94442").css("display","block");
					}
				}).fail(function(){
					console.log("Request failed");
				}).always(function() {
				});
			} else if((original_id_2 == present_id_2)&&(original_id_3 == present_id_3)) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if((present_id_2.length == 0)||(present_id_3.length == 0)){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		}

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

		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var original_id_3 = $("div#details_holder").data("original_3");
		var present_id_1;
		var present_id_2;
		var present_id_3;
		var error_shower = $("div#details_holder");
		$("#form_logic_part_data_tbl_LOGIC_LEVEL").on({"input" : function(){
			$(".btn").attr("disabled", true);
			if ($(this).val()>2 || $(this).val()<1) {
				error_shower.text("Logic Level must be either 1 or 2").css("color", "#a94442").css("display","block");
			} else {
				form_data_function();
			}
		}});

		form_logic_selector.on("change", function(){
			form_logic_val = $(this).val();
			$.ajax({
				type: 'POST',
				url: '/form_logic_part_data_tbls/fetch_sub_logic_val',
				data: {'form_logic_name' : form_logic_val}
			});
			$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/form_logic_part_data_tbls/fetch_sub_logic_val',
					data: {'form_logic_name' : form_logic_val }
			}).done(function(data) {
				$('#form_logic_part_data_tbl_LOGIC_LEVEL').val(data.logic_value);
			}).fail(function(){
				console.log("Request failed");
			}).always(function() {
				$(".btn").attr("disabled", true);
				console.log("inside func running i guess");
				form_data_function();
			});

		});

		$("#form_logic_part_data_tbl_PART_NO").on({"blur" : form_data_function});
		$("#form_logic_part_data_tbl_PART_NO").focus(function(){
			$(".btn").attr("disabled", true);
		});

		function form_data_function() {
			present_id_1 = original_id_1;
			present_id_2 = $("#form_logic_part_data_tbl_PART_NO").val();
			present_id_3 = $("#form_logic_part_data_tbl_LOGIC_LEVEL").val();
			if (((original_id_2 != present_id_2)||(original_id_3 != present_id_3))&&((present_id_2.length != 0 && present_id_3.length != 0 ))) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/form_logic_part_data_tbls/check_unique',
					data: {'key1' : present_id_1,'key2' : present_id_2,'key3' : present_id_3 }
				}).done(function(data) {
					if (data.valid) {
						$(".btn").removeAttr("disabled");
						error_shower.text("Record Unique").css("color","green").css("display","block");
					} else {
						error_shower.text("Key field(s) not unique").css("color", "#a94442").css("display","block");
					}
				}).fail(function(){
					console.log("Request failed");
				}).always(function() {
				});
			} else if((original_id_2 == present_id_2)&&(original_id_3 == present_id_3)) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if((present_id_2.length == 0)||(present_id_3.length == 0)){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		}
	});	
});