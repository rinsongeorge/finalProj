
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

	$('table#order-table tr').off('click.tr').on('click.tr', function(e){
		var orderid = $(this).find('td.order-id').html();
		window.location.href = "/FarmToHome/Order?orderId=" + orderid;
	});


	$('#getProduct').off('click.getProduct').on('click.getProduct', function(e){
		e.preventDefault();
		var prodName = $("#productName").val();
		$.ajax({
				url: '/FarmToHome/productByName?productName='+ prodName + '&rnd' + new Date().getTime() + '&',
				dataType: 'json',
				type: 'get',
				beforeSend: function(){},
				success: function(data){
					$('.product-update-div').addClass('hidden');
					$('.product-update-disp-div').removeClass('hidden');
					$('[name="categoryID"] option[value='+data.categoryID+']').attr('selected', true);
					$('#productID').val(data.productID);
					$('h3#productName').html(data.productName);
					$('#productUnitWeight').val(data.productUnitWeight);
					$('#productUnitPrice').val(data.productUnitPrice);
					$('#productDescription').val(data.productDescription);
				},
				complete: function(){},
				error: function(){
					alert('No record found !');
				}
			});
	});
	
});