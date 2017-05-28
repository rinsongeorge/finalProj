F2F.singleProduct = function() {
	
	// Global variables
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	// Methods

	var getSingleProductPage = function(){	
		var getProductDetails = function(productId){
			$.ajax({
				url: '/FarmToHome/productDetails?productId=' + productId + '&rnd' + new Date().getTime() + '&',
				dataType: 'json',
				type: 'get',
				beforeSend: function(){},
				success: onSuccess,
				complete: function(){},
				error: function(){}
			});
		};
		var onSuccess = function(data){
			if(data){
				loadProductDetailTemplate(data);
			}
		};
		var loadTemplateView = function(){

			var categories = $('.menu_box > ul > li');
			var tagCategories = $('.tags > ul.tags_links >li');
			var products = $('div.product_image');
			
			categories.off('click.selectCategory').on('click.selectCategory', function(e){
				e.preventDefault();
				var categoryId = $(this).data('categoryid');
				var categoryLink = $(this).find('a');
				localStorage['List'] = categoryId;
				localStorage['List-Name'] = categoryLink.text();
				window.location.href = categoryLink.attr('href');
			});
			
			tagCategories.off('click.selectTagCategory').on('click.selectTagCategory', function(e){
				e.preventDefault();
				var categoryId = $(this).data('categoryid');
				var categoryLink = $(this).find('a');
				localStorage['List'] = categoryId;
				localStorage['List-Name'] = categoryLink.text();
				window.location.href = $(this).find('a').attr('href');
			});

			products.off('click.products').on('click.products', function(){
				var productId = $(this).data('productid');
				localStorage['ProductId'] = productId;
				window.location.href = '/FarmToHome/Review';
			});

			$('.view_cart a').off('click.view_cart').on('click.view_cart', function(e){
				e.preventDefault();
				$('#myCartModal').modal('show'); 
			});

			$('.popup-with-zoom-anim').magnificPopup({
					type: 'inline',
					fixedContentPos: false,
					fixedBgPos: true,
					overflowY: 'auto',
					closeBtnInside: true,
					preloader: false,
					midClick: true,
					removalDelay: 300,
					mainClass: 'my-mfp-zoom-in'
			});

			$('#etalage').etalage({
				thumb_image_width: 300,
				thumb_image_height: 400,

				show_hint: true,
				click_callback: function(image_anchor, instance_id){
					alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
				}
			});
							
			$('.dropdownlist').change(function(){
				etalage_show( $(this).find('option:selected').attr('class') );
			});

			 $('#horizontalTab').easyResponsiveTabs({
				type: 'default', //Types: default, vertical, accordion           
				width: 'auto', //auto or any width like 600px
				fit: true   // 100% fit in a container
			});

			$("#flexiselDemo3").flexisel({
				visibleItems: 3,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: { 
					portrait: { 
						changePoint:480,
						visibleItems: 1
					}, 
					landscape: { 
						changePoint:640,
						visibleItems: 2
					},
					tablet: { 
						changePoint:768,
						visibleItems: 3
					}
				}
			});

			$("#flexiselDemo1").flexisel({
				visibleItems: 3,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: { 
					portrait: { 
						changePoint:480,
						visibleItems: 1
					}, 
					landscape: { 
						changePoint:640,
						visibleItems: 2
					},
					tablet: { 
						changePoint:768,
						visibleItems: 3
					}
				}
			});
			var suggestion = $('ul>li.nbs-flexisel-item');
			suggestion.off('click.suggestion').on('click.suggestion', function(){
				var productId = $(this).data('productid');
				localStorage['ProductId'] = productId;
				window.location.href = '/FarmToHome/Review';
			});
			
			$("html, body").animate({ scrollTop: $('.main').offset().top }, "slow");

			$('#addToCart').off('click.addToCart').on('click.addToCart', function(){
				
				if(typeof $('#selectedProductId').val() !== 'undefined'
					&& $('#selectedProductId').val() != ''
					&& typeof $('.product-qty select').val() !== 'undefined'
					&& $('.product-qty select').val() != ''
					&& typeof $('#pincode').val() !== 'undefined'
					&& $('#pincode').val() != ''){

					var data = {};
					data.productId = $('#selectedProductId').val();
					data.qty = $('.product-qty select').val();
					data.pinCode = $('#pincode').val();

					$.ajax({
						url: '/FarmToHome/addToCart?' + '&rnd' + new Date().getTime() + '&',
						dataType: 'json',
						contentType: 'application/json;',
						type: 'post',
						data : JSON.stringify(data),
						beforeSend: function(xhr){
							 xhr.setRequestHeader(header, token);
						},
						success: function(data){ 
							$('.alert-addcart-response').removeClass('hidden');
							$('#myModal button.btn-default').trigger('click');
							if(data && data.totalAmount){
								$('.alert-addcart-response span').text('Item has been added to the cart successfully');
							}else{
								$('.alert-addcart-response span').text(data.msg);
							}
							$("html, body").animate({ scrollTop: $('.alert-addcart-response').offset().top }, "slow");
						}
					});
				}
			});
		};
		var loadProductDetailTemplate = function(data){
			$.get('resources/static/templates/productDetails.tpl', function(tpl) {
				var template = window._.template(tpl, { 
					data: data
				});
				var container = $('.main-row');
				container.children().remove();
				container.append(template);
				loadTemplateView();
			});
		};

		var productId = localStorage['ProductId'];
		if(typeof productId !== 'undefined' && productId != ''){
			getProductDetails(productId);
		}
	};

	getSingleProductPage();
}();