F2F.homePage = function() {
	
	// Global variables


	// Methods

	var getLoadHomePage = function(){	
		var getHomeAvailability = function(){
			$.ajax({
				url: 'resources/static/json/availabilty.json?' + '&rnd' + new Date().getTime() + '&',
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
			var products = $('div.product_image');
			/*
			categories.off('click.selectCategory').on('click.selectCategory', function(){
				alert('clicked ---> ' + $(this).text());
			});
			*/
			products.off('click.products').on('click.products', function(){
				alert('clicked ---> ' + $(this).find('div.cart-left p').text());
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