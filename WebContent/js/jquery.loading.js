
void function(window, $){
	$.fn.loading = function(){
	    var html = [
                 	'<div id="loading_bg"><iframe></iframe></div>',
	                '<div id="loading_container">',
		                '<div class="loading_box">',
			                '<img src="images/loader_bar.gif"/>',
		                '</div>',
	                '</div>'
               ].join("");

		jQuery(document.body).append(html);
	}

	$.fn.loadingClose = function(){
		$("#loading_bg,#loading_container").remove();
	}
}(this, jQuery)