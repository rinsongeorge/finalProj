
<div class="row">
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
			<div class="banner_img"><img src="resources/static/images/pic9.jpg" class="img-responsive" alt=""></div> 
		</div>
	</div>
	<div class="col-md-9">
		<div class="dreamcrub">
			<ul class="breadcrumbs">
				<li class="home">
					<a href="/FarmToHome" title="Go to Home Page">Home</a>&nbsp;
					<span>&gt;</span>
				</li>
				<li class="home">&nbsp;
					Bucket&nbsp;
					<span>&gt;</span>&nbsp;
				</li>
				<li class="women">
					<%=localStorage['List-Name']%>
				</li>
			</ul>
	
			<div class="clearfix"></div>
		</div>

		<div class="mens-toolbar">
			<div class="sort">
				<div class="sort-by">
					<label>Sort By</label>
					<select id="sort-by">
					    <option value="">Position</option>
					    <option value="">Name</option>
					    <option value="">Price</option>
					</select>
					<a href=""><img src="resources/static/images/arrow2.gif" alt="" class="v-middle"></a>
				</div>
			</div>

			<div class="clearfix"></div>		
		</div>

		<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
			<div class="cbp-vm-options">
				<a href="javascript:void(0)" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid" title="grid">Grid View</a>
				<a href="javascript:void(0)" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list" title="list">List View</a>
			</div>
			<div class="pages">   
				<div class="limiter visible-desktop">
					<label>Show</label>
					<select>
						<option value="" selected="selected">9</option>
						<option value="">15</option>
						<option value="">30</option>
					</select> per page        
				</div>
			</div>
			<div class="clearfix"></div>
			<ul>
				<% _.each(data.products, function(product, index) { %>

					<li data-unitprice="<%=product.productUnitPrice%>">
						<a class="cbp-vm-image" href="javascript:void(0)">
							<div class="view view-first">
								<div class="inner_content clearfix">
									<div class="product_image" data-productid="<%=product.productID%>">
										<img src="<%=product.productImage%>" class="img-responsive" alt="">
										<div class="mask">
										<div class="info">Quick View</div>
									</div>
									<div class="product_container">
										<div class="cart-left">
										<p class="title"><%=product.productName%></p>
										</div>
										<div class="price"><span>&#8377; &nbsp;</span> <%=product.productUnitPrice%></div>
											<div class="clearfix"></div>
										</div>		
									</div>
								</div>
							</div>
						</a>
						<div class="cbp-vm-details">
						<%=product.productDescription%>
						</div>
						
					</li>
					
				<%})%>
			</ul>
		</div>
	</div>
</div>
<script src="resources/static/js/cbpViewModeSwitch.js" type="text/javascript"></script>
<script src="resources/static/js/classie.js" type="text/javascript"></script>