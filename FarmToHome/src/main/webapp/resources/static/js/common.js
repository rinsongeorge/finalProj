
$(document).ready(function(){

	$('.view_cart a').off('click.view_cart').on('click.view_cart', function(e){
		e.preventDefault();
		$('#myCartModal').modal('show'); 
	});
	
});