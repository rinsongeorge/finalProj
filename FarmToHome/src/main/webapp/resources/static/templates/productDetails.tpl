
<div class="col-md-3">
	<div class="menu_box">
		<h3 class="menu_head">Menu</h3>
		<ul class="nav">
			<% _.each(data.category, function(category, index) { %>
				<li data-categoryid="<%=category.categoryID%>"><a href="/FarmToHome/List"><%=category.categoryName%></a></li>
			<%})%>
			<li><a href="/FarmToHome/Contact">Contact</a></li>
		 </ul>
	</div>
    
	<div class="tags">
		<h4 class="tag_head">Tags Widget</h4>
		<ul class="tags_links">
			<% _.each(data.category, function(category, index) { %>
				<li data-categoryid="<%=category.categoryID%>"><a href="/FarmToHome/List"><%=category.categoryName%></a></li>
			<%})%>
		</ul>
	</div>
	<div class="side_banner">
		<div class="banner_img"><img src="resources/static/images/pic9.jpg" class="img-responsive" alt=""/></div>
	</div>
</div>

<%
	var categoryName = _.where(data.category, {"categoryID": "" + data.selectedProduct.categoryID})[0].categoryName;
%>
<div class="col-md-9">
	<div class="dreamcrub">
		<ul class="breadcrumbs">
			<li class="home"><a href="/FarmToHome" title="Go to Home Page">Home</a>&nbsp;<span>&gt;</span></li>
			<li class="home">&nbsp;Bucket&nbsp;<span>&gt;</span>&nbsp;</li>
			<li class="home">&nbsp;<%=categoryName%><span>&gt;</span>&nbsp;</li>
			<li class="women"><%=data.selectedProduct.productName%></li>
		</ul>
		<ul class="previous">
			<li><a href="javascript:void(0)">Back to Previous Page</a></li>
		</ul>
		<div class="clearfix"></div>
	</div>
	<div class="singel_right">
		<div class="labout span_1_of_a1">
		<!-- start product_slider -->
			<ul id="etalage">
				<li>
					<a href="javascript:void(0)">
						<img class="etalage_thumb_image" src="<%=data.selectedProduct.productImage%>" />
						<img class="etalage_source_image" src="<%=data.selectedProduct.productImage%>" class="img-responsive" />
					</a>
				</li>
			</ul>
		<!-- end product_slider -->
		</div>
		<div class="cont1 span_2_of_a1">
			<h1><%=data.selectedProduct.productName%></h1> (<%=data.selectedProduct.productUnitWeight%>)
		<div class="price_single">
			<span class="actual"><%=data.selectedProduct.productUnitPrice%>&nbsp;<span>&#8377; &nbsp;</span></span>
		</div>

		<h2 class="quick">Quick Overview:</h2>
		<p class="quick_desc"><%=data.selectedProduct.productDescription%></p>

		<ul class="product-qty">
			<span>Quantity:</span>
			<select>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
			</select>
		</ul>
		<input id="selectedProductId" type="hidden" value="<%=data.selectedProduct.productID%>">
		<div class="btn_form">
			<form onsubmit="event.preventDefault();">
				<input type="submit" value="Add to Cart" title="" data-toggle="modal" data-target="#myModal">
			</form>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
<div class="sap_tabs">	
     <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
		  <ul class="resp-tabs-list">
			  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Product Description</span></li>
			  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Additional Information</span></li>
			  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Reviews</span></li>
			  <div class="clear"></div>
		  </ul>				  	 
			<div class="resp-tabs-container">
			    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
					<div class="facts">
					  <ul class="tab_list">
						<li><a href="#"><%=data.selectedProduct.productDescription%></a></li>
					  </ul>           
				</div>
			     </div>	
			      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
					<div class="facts">
					<ul class="tab_list">
						<li><a href="#"><%=data.selectedProduct.productDescription%></a></li>		
					</ul>           
				</div>
			     </div>	
			      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
					<ul class="tab_list">
						
					</ul>      
			     </div>	
			 </div>
	      </div>
	 </div>	
	 <h3 class="like">You Might Also Like</h3>        			
	<ul id="flexiselDemo3">
		<% _.each(data.suggestion, function(product, index) { %>
			<li data-productid="<%=product.productID%>"><img src="<%=product.productImage%>" /><div class="grid-flex"><a href="#"><%=product.productName%></a><p><span>&#8377; &nbsp;</span><%=product.productUnitPrice%></p></div></li>	
		<%})%>
	</ul>

   <script type="text/javascript" src="resources/static/js/jquery.flexisel.js"></script>
</div>