
<div class="row">
	<div class="col-md-3">
		<div class="menu_box">
			<h3 class="menu_head">Menu</h3>
			<ul class="nav">
				<% _.each(data.category, function(category, index) { %>
					<li><a href="javascript:void(0)"><%=category.categoryName%></a></li>
				<%})%>
				<li><a href="javascript:void(0)">About</a></li>
				<li><a href="javascript:void(0)">Contact</a></li>
			 </ul>
		</div>
		<div class="tags">
			<h4 class="tag_head">Tags Widget</h4>
			<ul class="tags_links">
				<% _.each(data.category, function(category, index) { %>
				<li><a href="javascript:void(0)"><%=category.categoryName%></a></li>
			<%})%>
			</ul>
			<a href="javascript:void(0)" class="link1">View all tags</a>
		</div>
		<div class="side_banner">
			<div class="banner_img"><img src="resources/static/images/pic9.jpg" class="img-responsive" alt=""></div> 
		</div>
	</div>
	<div class="col-md-9">
		<div class="dreamcrub">
			<ul class="breadcrumbs">
				<li class="home">
					<a href="javascript:void(0)" title="Go to Home Page">Home</a>&nbsp;
					<span>&gt;</span>
				</li>
				<li class="home">&nbsp;
					Apparel&nbsp;
					<span>&gt;</span>&nbsp;
				</li>
				<li class="women">
					Women
				</li>
			</ul>
			<ul class="previous">
			<li><a href="javascript:void(0)">Back to Previous Page</a></li>
			</ul>
			<div class="clearfix"></div>
		</div>

		<div class="mens-toolbar">
			<div class="sort">
				<div class="sort-by">
					<label>Sort By</label>
					<select id="rinson">
					    <option value="">Position</option>
					    <option value="">Name</option>
					    <option value="">Price</option>
					</select>
					<a href=""><img src="resources/static/images/arrow2.gif" alt="" class="v-middle"></a>
				</div>
			</div>

			<ul class="women_pagenation dc_paginationA dc_paginationA06">
			     <li><a href="javascript:void(0)" class="previous">Page:</a></li>
			     <li class="active"><a href="javascript:void(0)">1</a></li>
			     <li><a href="javascript:void(0)">2</a></li>
			</ul>
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

					<li>
						<a class="cbp-vm-image" href="javascript:void(0)">
							<div class="view view-first">
								<div class="inner_content clearfix">
									<div class="product_image">
										<img src="<%=product.productImage%>" class="img-responsive" alt="">
										<div class="mask">
										<div class="info">Quick View</div>
									</div>
									<div class="product_container">
										<div class="cart-left">
										<p class="title"><%=product.productName%></p>
										</div>
										<div class="price"><%=product.currency%> <%=product.productUnitPrice%></div>
											<div class="clearfix"></div>
										</div>		
									</div>
								</div>
							</div>
						</a>
						<div class="cbp-vm-details">
						<%=product.productDescription%>
						</div>
						<a class="cbp-vm-icon cbp-vm-add" href="javascript:void(0)">Add to cart</a>
					</li>
					
				<%})%>
			</ul>
		</div>
	</div>
</div>
<script src="resources/static/js/cbpViewModeSwitch.js" type="text/javascript"></script>
<script src="resources/static/js/classie.js" type="text/javascript"></script>