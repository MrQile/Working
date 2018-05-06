$(document).on("turbolinks:load", function() {
	$(".sessions.new, .sessions.create").ready( function() {
		function db_details_function() {
			var sat_name = $("#session_satellite").val();
			$.ajax({
				type: 'POST',
				url: '/sessions/get_db_details',
				data: {'satellite_name' : sat_name}
			});
		}
		$("#session_satellite").on("change", db_details_function);
		setTimeout(db_details_function, 1);
	});


	//   BASE CMD TBL VALIDATION OF PRIMARY KEY
	$(".base_cmd_tbls.new, .base_cmd_tbls.create, .base_cmd_tbls.edit, .base_cmd_tbls.update").ready( function() {
		var original_id = $("div#details_holder").data("original_1");
		var present_id;
		var error_shower = $("div#details_holder");
		$("#base_cmd_tbl_CMD_ID").on({"blur" : function(){
			present_id = $(this).val();
			if ((present_id.length == 8) && (original_id != present_id)) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/base_cmd_tbls/check_unique',
					data: {'key' : present_id }
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
			} else if(original_id == present_id) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if (present_id.length != 8) {
				error_shower.text("Must be 8 characters").css("color", "#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});


	//   SUBSYSTEM TBL VALIDATION OF PRIMARY KEY
	$(".subsystem_tbls.new, .subsystem_tbls.create, .subsystem_tbls.edit, .subsystem_tbls.update").ready( function() {
		var original_id = $("div#details_holder").data("original_1");
		var present_id;
		var error_shower = $("div#details_holder");
		$("#subsystem_tbl_SUBSYSTEM_NAME").on({"blur" : function(){
			present_id = $(this).val();
			if ((present_id.length != 0) && (original_id != present_id)) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/subsystem_tbls/check_unique',
					data: {'key' : present_id }
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
			} else if(original_id == present_id) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if (present_id.length == 0) {
				error_shower.text("Key field(s) cannot be empty").css("color", "#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});



	//   UI TYPES TBL VALIDATION OF PRIMARY KEY
	$(".ui_types_tbls.new, .ui_types_tbls.create, .ui_types_tbls.edit, .ui_types_tbls.update").ready( function() {
		var original_id = $("div#details_holder").data("original_1");
		var present_id;
		var error_shower = $("div#details_holder");
		$("#ui_types_tbl_UI_TYPE").on({"blur" : function(){
			present_id = $(this).val();
			if ((present_id.length != 0) && (original_id != present_id)) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/ui_types_tbls/check_unique',
					data: {'key' : present_id }
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
			} else if(original_id == present_id) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if (present_id.length == 0) {
				error_shower.text("Key field(s) cannot be empty").css("color", "#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});



	//   CMD TYPES TBL VALIDATION OF PRIMARY KEY
	$(".cmd_types_tbls.new, .cmd_types_tbls.create, .cmd_types_tbls.edit, .cmd_types_tbls.update").ready( function() {
		var original_id = $("div#details_holder").data("original_1");
		var present_id;
		var error_shower = $("div#details_holder");
		$("#cmd_types_tbl_CMD_TYPE").on({"blur" : function(){
			present_id = $(this).val();
			if ((present_id.length != 0) && (original_id != present_id)) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/cmd_types_tbls/check_unique',
					data: {'key' : present_id }
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
			} else if(original_id == present_id) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if (present_id.length == 0) {
				error_shower.text("Key field(s) cannot be empty").css("color", "#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});


	//   BIT SEL TBL INFO VALIDATION OF PRIMARY KEY
	$(".bit_sel_tbl_infos.new, .bit_sel_tbl_infos.create, .bit_sel_tbl_infos.edit, .bit_sel_tbl_infos.update").ready( function() {
		var original_id = $("div#details_holder").data("original_1");
		var present_id;
		var error_shower = $("div#details_holder");
		$("#bit_sel_tbl_info_BIT_SEL_TBL_NO").on({"blur" : function(){
			present_id = $(this).val();
			if ((original_id != present_id)&&( present_id.length != 0 )) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/bit_sel_tbl_infos/check_unique',
					data: {'key' : present_id }
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
			} else if(original_id == present_id) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if(present_id.length == 0){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});


	//   BIT SEL TBL VALIDATION OF PRIMARY KEY'S
	$(".bit_sel_tbls.new, .bit_sel_tbls.create, .bit_sel_tbls.edit, .bit_sel_tbls.update").ready( function() {
		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var present_id_1;
		var present_id_2;
		var error_shower = $("div#details_holder");
		$("#bit_sel_tbl_FIELD_NO").on({"blur" : function(){
			present_id_1 = original_id_1;
			present_id_2 = $(this).val();
			console.log(present_id_2);
			console.log(present_id_1);
			if ((original_id_2 != present_id_2)&&( present_id_2.length != 0 )) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/bit_sel_tbls/check_unique',
					data: {'key1' : present_id_1,'key2' : present_id_2 }
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
			} else if(original_id_2 == present_id_2) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if(present_id_2.length == 0){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});

	//   LKUP INFO VALIDATION OF PRIMARY KEY
	$(".lkup_tbl_infos.new, .lkup_tbl_infos.create, .lkup_tbl_infos.edit, .lkup_tbl_infos.update").ready( function() {
		var original_id = $("div#details_holder").data("original_1");
		var present_id;
		var error_shower = $("div#details_holder");
		$("#lkup_tbl_info_LKUP_TBL_NO").on({"blur" : function(){
			present_id = $(this).val();
			if ((original_id != present_id)&&( present_id.length != 0 )) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/lkup_tbl_infos/check_unique',
					data: {'key' : present_id }
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
			} else if(original_id == present_id) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if(present_id.length == 0){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});


	//   LKUP TBL VALIDATION OF PRIMARY KEY'S
	$(".lkup_tbls.new, .lkup_tbls.create, .lkup_tbls.edit, .lkup_tbls.update").ready( function() {
		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var present_id_1;
		var present_id_2;
		var error_shower = $("div#details_holder");
		$("#lkup_tbl_LKUP_ENTRY_INDEX").on({"blur" : function(){
			present_id_1 = original_id_1;
			present_id_2 = $(this).val();
			console.log(present_id_2);
			console.log(present_id_1);
			if ((original_id_2 != present_id_2)&&( present_id_2.length != 0 )) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/lkup_tbls/check_unique',
					data: {'key1' : present_id_1,'key2' : present_id_2 }
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
			} else if(original_id_2 == present_id_2) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if(present_id_2.length == 0){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});


	//   CPID TBL VALIDATION OF PRIMARY KEY'S
	$(".cpid_tbls.new, .cpid_tbls.create, .cpid_tbls.edit, .cpid_tbls.update").ready( function() {
		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var present_id_1;
		var present_id_2;
		var error_shower = $("div#details_holder");
		$("#cpid_tbl_CPID").on({"blur" : function(){
			present_id_1 = original_id_1;
			present_id_2 = $(this).val();
			console.log(present_id_2);
			console.log(present_id_1);
			if ((original_id_2 != present_id_2)&&( present_id_2.length != 0 )) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/cpid_tbls/check_unique',
					data: {'key1' : present_id_1,'key2' : present_id_2 }
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
			} else if(original_id_2 == present_id_2) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if(present_id_2.length == 0){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});


	//   CMD PART TBL VALIDATION OF PRIMARY KEY'S
	$(".cmd_part_tbls.new, .cmd_part_tbls.create, .cmd_part_tbls.edit, .cmd_part_tbls.update").ready( function() {
		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var present_id_1;
		var present_id_2;
		var error_shower = $("div#details_holder");
		$("#cmd_part_tbl_CMD_PART_NO").on({"blur" : function(){
			present_id_1 = original_id_1;
			present_id_2 = $(this).val();
			console.log(present_id_2);
			console.log(present_id_1);
			if ((original_id_2 != present_id_2)&&( present_id_2.length != 0 )) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/cmd_part_tbls/check_unique',
					data: {'key1' : present_id_1,'key2' : present_id_2 }
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
			} else if(original_id_2 == present_id_2) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if(present_id_2.length == 0){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		},"focus" : function(){
			$(".btn").attr("disabled", true);
		}});
	});


	//   EXPRESSION VALIDATION OF PRIMARY KEY'S
	$(".expressions.new, .expressions.create, .expressions.edit, .expressions.update").ready( function() {
		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var present_id_1;
		var present_id_2;
		var error_shower = $("div#details_holder");
		$("#expression_EXPR_TYPE").on({"change" : function(){
			$(".btn").attr("disabled", true);
			expression_function();
		}});
		$("#expression_EXPR_ID").on({"blur" : expression_function});
		$("#expression_EXPR_ID").focus(function(){
			$(".btn").attr("disabled", true);
		});
		function expression_function() {
			present_id_1 = $("#expression_EXPR_ID").val();
			present_id_2 = $("#expression_EXPR_TYPE").val();
			if (((original_id_1 != present_id_1)||(original_id_2 != present_id_2))&&((present_id_1.length != 0 && present_id_2.length != 0 ))) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/expressions/check_unique',
					data: {'key1' : present_id_1,'key2' : present_id_2 }
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
			} else if((original_id_1 == present_id_1)&&(original_id_2 == present_id_2)) {
				$(".btn").removeAttr("disabled");
				error_shower.css("display","none");
			} else if((present_id_1.length == 0)||(present_id_2.length == 0)){
				error_shower.text("Key field(s) cannot be empty").css("color","#a94442").css("display","block");
			}
		}
	});


	//   PREREQ CONF EXPR TBL VALIDATION OF PRIMARY KEY'S
	$(".prereq_conf_expr_tbls.new, .prereq_conf_expr_tbls.create, .prereq_conf_expr_tbls.edit, .prereq_conf_expr_tbls.update").ready( function() {
		var original_id_1 = $("div#details_holder").data("original_1");
		var original_id_2 = $("div#details_holder").data("original_2");
		var original_id_3 = $("div#details_holder").data("original_3");
		var present_id_1;
		var present_id_2;
		var present_id_3;
		var error_shower = $("div#details_holder");
		$("#prereq_conf_expr_tbl_ENTRY_TYPE").on({"change" : function(){
			$(".btn").attr("disabled", true);
			preconf_function();
		}});
		$("#prereq_conf_expr_tbl_FIELD_NO").on({"blur" : preconf_function});
		$("#prereq_conf_expr_tbl_FIELD_NO").focus(function(){
			$(".btn").attr("disabled", true);
		});
		function preconf_function() {
			present_id_1 = original_id_1;
			present_id_2 = $("#prereq_conf_expr_tbl_ENTRY_TYPE").val();
			present_id_3 = $("#prereq_conf_expr_tbl_FIELD_NO").val();
			if (((original_id_2 != present_id_2)||(original_id_3 != present_id_3))&&((present_id_2.length != 0 && present_id_3.length != 0 ))) {
				$.getJSON({
					type: 'POST',
					dataType: 'json',
					url: '/prereq_conf_expr_tbls/check_unique',
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


	//   FORM LOGIC PART DATA TBL VALIDATION OF PRIMARY KEY'S IN THE form_logic_part_data_tbls.js
});
