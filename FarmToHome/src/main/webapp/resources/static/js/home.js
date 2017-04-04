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
		var loadProductAvailabilityTemplate = function(data){
			$.get('resources/static/templates/productAvailability.tpl', function(tpl) {
				var template = window._.template(tpl, { 
					data: data
				});
				var container = $('.main-row');
				container.children().remove();
				container.append(template);
			});
		};
		getHomeAvailability();
	};

	getLoadHomePage();
}();