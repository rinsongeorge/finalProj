
$(document).ready(function(){

	$('.view_cart a').off('click.view_cart').on('click.view_cart', function(e){
		e.preventDefault();
		$('#myCartModal').modal('show'); 
	});

	$('#payment-checkout').off('click.payment-checkout').on('click.payment-checkout', function(e){
		window.location.href = "/FarmToHome/Payment";
	});

	$('.logout-link').off('click.logout').on('click.logout', function(e){
		e.preventDefault();
		$('#logoutForm').submit();
	});
	
});