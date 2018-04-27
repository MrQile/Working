$(document).on("turbolinks:load", function() {
	// $("#mainRow").height($(window).height()); //same thing as setting 100vh in css, but not good in terms of resized window
	

	$(function() {
	  setTimeout(function(){
	    $('.alert').slideUp(500);
	  }, 4000);
	});
	/* For the select 2 gem to work */

	$('select').select2({
		theme: "bootstrap",
		placeholder: "Please Select",
		allowClear: true
	});


	
	// For Column Selector and Sorting

	var subsystem;
	var cmd_type;
	var ui_type;
	subsystem = $("#subsystem").detach();
	cmd_type = $("#cmd_type").detach();
	ui_type = $("#ui_type").detach();
	var theSelector = $(".column_selector");
	var theDivSelector= $("#divSelector");

	function SortChanger() {
		if ($(this).val() == "SUBSYSTEM"){
			subsystem.insertAfter(theDivSelector);
			cmd_type.detach();											//Changed to detach as the select doesn't repond with the select2 gem when we try to use remove() 
			ui_type.detach();
		} else if ($(this).val() == "UI_TYPE") {
			ui_type.insertAfter(theDivSelector);     
			cmd_type.detach();
			subsystem.detach();
		} else if ($(this).val() == "CMD_TYPE") {
			cmd_type.insertAfter(theDivSelector);
			ui_type.detach();
			subsystem.detach();
		}
	}
	function divShower() {
		$(".sortersubmit").css("display", "block");
	}
	theSelector.on("change", SortChanger);
	subsystem.on("change", divShower);
	cmd_type.on("change", divShower);
	ui_type.on("change", divShower);

	/* For radio buttons in base_cmd_tbls */

	$(".column-hider").hide();
	$("#shrink").click(function(){
		$(".column-hider").hide();
	});
	$("#expand").click(function(){
		$(".column-hider").show();
	})
	$("#advanced_button").click(function(e){
		e.preventDefault();
		$(this).detach();
		$(".advanced_options").css("display","block");
	});


	/* Sidebar toggle */

	var content = $(".HolyGrail-content");
	var left_sidebar = $(".HolyGrail-nav");
	var right_sidebar = $(".HolyGrail-ads");
	var left_toggled = false;
	var right_toggled = false;
	var percentage;

	$('.left_arrow').click(function(){

		if (left_toggled == false) {			
			$(this).html("&#8680;");
			percentage = content.width() / content.parent().width() * 100;
			console.log(percentage);
			percentage = Math.ceil(percentage);
			percentage += 12;
			left_sidebar.slideToggle(10);
			content.css('width', percentage+'%');
			left_toggled = true;


		} else {

			$(this).html("&#8678;");
			percentage = content.width() / content.parent().width() * 100;
			console.log(percentage);
			percentage = Math.ceil(percentage);
			percentage -= 12;
			left_sidebar.slideToggle(10);
			content.css('width', percentage+'%');
			left_toggled = false;

		}
	});

	$('.right_arrow').click(function(){

		if (right_toggled == false) {			
			
			$(this).html("&#8678;");
			percentage = content.width() / content.parent().width() * 100;
			console.log(percentage);
			percentage = Math.ceil(percentage);
			percentage += 12;
			right_sidebar.slideToggle(10);
			content.css('width', percentage+'%');
			right_toggled = true;

		} else {

			$(this).html("&#8680;");
			percentage = content.width() / content.parent().width() * 100;
			console.log(percentage);
			percentage = Math.ceil(percentage);
			percentage -= 12;
			right_sidebar.slideToggle(10);
			content.css('width', percentage+'%');
			right_toggled = false;

		}
	});


	/* For click and double click actions on record */
	/*
	var value;
	var DELAY = 300, clicks = 0, timer = null;
    $(".base_cmd_tbls.index tr").on({"click" : function(){
    	$("tr").removeClass("highlighted");
    	value = $(this).data("value");
    	$(this).addClass("highlighted");
        clicks++;
        if(clicks === 1) {
            timer = setTimeout(function() {
				$.ajax({
					type: 'POST',
					url: '/base_cmd_tbls/save_cmd',
					data: {'base_id' : value}

				});

				if (right_toggled == true) {	

					$('.right_arrow').html("&#8680;");
					percentage = content.width() / content.parent().width() * 100;
					console.log(percentage);
					percentage = Math.ceil(percentage);
					percentage -= 12;
					right_sidebar.slideToggle(10);
					content.css('width', percentage+'%');
					right_toggled = false;

				}

                clicks = 0;
            }, DELAY);
        } else {
            clearTimeout(timer);
            clicks = 0;
        }},"dblclick" : function(){
        	window.location = $(this).data("href");
    }});
    */

    /* Since there is no need of single click for show */

    $(".base_cmd_tbls.index tbody tr").on({"dblclick" : function(){
    	window.location = $(this).data("href");
    }});
   


	// For removing fields from search

	$('div.ForMainSearch').on('click','.add_fields',function(event){
		time = new Date().getTime();
	    regexp = new RegExp($(this).data('id'), 'g');
	   	$(this).before($(this).data('fields').replace(regexp, time));
	   	event.preventDefault();
	});

	$('div.ForMainSearch').on('click','.remove_fields', function(event){
	   	console.log("trigger");
	   	$(this).closest('.field').remove();
	   	event.preventDefault();
	});

	$('.question_mark span').click(function () {
		$('.question_mark div').slideToggle(50);
	});


	// For Ransack Pagination with Post Method

	$("div.ransack-pagination a").on("click",function(event){
		pageNum = $(this).attr("href").match(/page=([0-9]+)/)[1];
		console.log("clicked");
		$('.ransack-page').val(pageNum);
		$('.ransack-form').submit();
		event.preventDefault();

	});


	/* SUB SHORT NAME ADDER */

	var sub;
	var sub_name;
	sub = $("#base_cmd_tbl_SUBSYSTEM");

	sub.on("change", function(){
		sub_name = $(this).val();
		console.log(sub_name);
		$.ajax({
			type: 'POST',
			url: '/base_cmd_tbls/sub_short_name',
			data: {'subsystem_name' : sub_name}
		});
	})

	
});