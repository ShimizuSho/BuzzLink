// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(){
	for (let i = 1; i <= folders.length; i += 1) {
		$('.folder_name_edit' + i).on('click', function(){
	        $('.name' + i).toggleClass('hidden');
	        $('.folder_name_form' + i).toggleClass('hidden');
	    });
	};
	for (let i = 1; i <= posts.length; i += 1) {
		$('.move' + i).on('click', function(){
	    	$('.folder_move_list'+ i).toggleClass('show');
	    	$('.post_info_2_form' + i).toggleClass('show_form');
		});
	};
});










