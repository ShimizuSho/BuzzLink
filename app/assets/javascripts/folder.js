
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