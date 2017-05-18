F2F.productPage = function() {
	
	// Global variables


	// Methods

	var getProductPage = function(){	
		var getProductAvailability = function(categoryId){
			$.ajax({
				url: '/FarmToHome/products?categoryId='+ categoryId + '&rnd' + new Date().getTime() + '&',
				dataType: 'json',
				type: 'get',
				beforeSend: function(){},
				success: onSuccess,
				complete: function(){},
				error: function(){}
			});
		};

		var loadTemplateView = function(){

			var categories = $('.menu_box > ul > li');
			var tagCategories = $('.tags > ul.tags_links >li');
			var products = $('div.product_image');
			var sortBy = $('#sort-by');
			
			categories.off('click.selectCategory').on('click.selectCategory', function(e){
				e.preventDefault();
				var categoryId = $(this).data('categoryid');
				var categoryLink = $(this).find('a');
				localStorage['List'] = categoryId;
				localStorage['List-Name'] = categoryLink.text();
				window.location.href = $(this).find('a').attr('href');
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

			sortBy.off('change.sortBy').on('change.sortBy', function(e){
				var selected = $('option:selected', $(this)).text();
				if(selected == 'Name'){
					$('.cbp-vm-switcher >ul>li').sort(asc_sort_byName).appendTo('.cbp-vm-switcher >ul');
				}else if(selected == 'Price'){
					$('.cbp-vm-switcher >ul>li').sort(asc_sort_byPrice).appendTo('.cbp-vm-switcher >ul');
				}
			});
			function asc_sort_byName(a, b){
				return ($(b).find('.cart-left p').text()) < ($(a).find('.cart-left p').text()) ? 1 : -1;    
			}
			function asc_sort_byPrice(a, b){
				return ($(b).data('unitprice')) < ($(a).data('unitprice')) ? 1 : -1;    
			}
		};

		var onSuccess = function(data){
			if(data){
				loadProductsTemplate(data);
			}
		};

		var loadProductsTemplate = function(data){
			$.get('resources/static/templates/products.tpl', function(tpl) {
				var template = window._.template(tpl, { 
					data: data
				});
				var container = $('.product-container');
				container.children().remove();
				container.append(template);
				loadTemplateView();
				$("html, body").animate({ scrollTop: $('.main').offset().top }, "slow");
			});
		};
		
		var categoryId = localStorage['List'];
		if(typeof categoryId !== 'undefined' && categoryId != ''){
			getProductAvailability(categoryId);
		}
	};

	getProductPage();
}();