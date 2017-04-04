F2F.productPage = function() {
	
	// Global variables


	// Methods

	var getProductPage = function(){	
		var getProductAvailability = function(){
			$.ajax({
				url: 'resources/static/json/products.json?' + '&rnd' + new Date().getTime() + '&',
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
			});
		};
		getProductAvailability();
	};

	getProductPage();
}();