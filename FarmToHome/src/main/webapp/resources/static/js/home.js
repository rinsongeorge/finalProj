F2F.homePage = function() {
	
	// Global variables


	// Methods

	var getLoadHomePage = function(){	
		var getHomeAvailability = function(){
			$.ajax({
				url: '/FarmToHome/availability?' + '&rnd' + new Date().getTime() + '&',
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
				loadProductAvailabilityTemplate(data);
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
		};
		var loadProductAvailabilityTemplate = function(data){
			$.get('resources/static/templates/productAvailability.tpl', function(tpl) {
				var template = window._.template(tpl, { 
					data: data
				});
				var container = $('.main-row');
				container.children().remove();
				container.append(template);
				loadTemplateView();
			});
		};
		getHomeAvailability();
	};

	getLoadHomePage();
}();