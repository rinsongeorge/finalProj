
<div class="col-md-3">
	<div class="menu_box">
		<h3 class="menu_head">Menu</h3>
		<ul class="nav">
		
			<% _.each(data.category, function(category, index) { %>
				<li><a href="/FarmToHome/List"><%=category.categoryName%></a></li>
			<%})%>
			<li><a href="/FarmToHome/Contact">Contact</a></li>
		 </ul>
	</div>
	<div class="side_banner">
	   <div class="banner_img"><img src="resources/static/images/pic9.jpg" class="img-responsive" alt=""/></div>
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

	<div class="tags">
	<h4 class="tag_head">Articles Experts</h4>
		<ul class="article_links">
			<li><a href="javascript:void(0)">Eleifend option congue nihil</a></li>
			<li><a href="javascript:void(0)">Investigationes demonst</a></li>
			<li><a href="javascript:void(0)">Qui sequitur mutationem</a></li>
			<li><a href="javascript:void(0)">videntur parum clar sollemnes</a></li>
			<li><a href="javascript:void(0)">ullamcorper suscipit lobortis</a></li>
			<li><a href="javascript:void(0)">commodo consequat. Duis autem</a></li>
			<li><a href="javascript:void(0)">Investigationes demonst</a></li>
			<li><a href="javascript:void(0)">ullamcorper suscipit lobortis</a></li>
			<li><a href="javascript:void(0)">Qui sequitur mutationem</a></li>
			<li><a href="javascript:void(0)">videntur parum clar sollemnes</a></li>
			<li><a href="javascript:void(0)">ullamcorper suscipit lobortis</a></li>
		  </ul>
	 <a href="javascript:void(0)" class="link1">View all</a>
	</div>
</div>

<div data-home-products="true" class="col-md-9">
	<h3 class="m_1">New Products</h3>

<%
var count = 0;
var limit = Math.ceil(data.newProducts.length / 3);
for(i = 0 ; i < limit ; i++){	

	%><div class="content_grid"><%
		for(j = count ; j < (data.newProducts.length) ; j++){
			%><div class="col_1_of_3 span_1_of_3"> 
				<div class="view view-first">
					<a href="javascript:void(0)">
					<div class="inner_content clearfix">
					<div class="product_image" data-productid="<%=data.newProducts[j].productID%>">
						<img src="<%=data.newProducts[j].productImage%>" class="img-responsive" alt="">
					<div class="mask">
					<div class="info">Quick View</div>
					</div>
					<div class="product_container">
					<div class="cart-left">
						<p class="title"><%=data.newProducts[j].productName%></p>
					</div>
					<div class="price"><%=data.newProducts[j].currency%> <%=data.newProducts[j].productUnitPrice%></div>
					<div class="clearfix"></div>
					</div>		
					</div>
					<div class="sale-box">
						<span class="on_sale title_shop">New</span>
					</div>	
					</div>
					</a>
				</div>
			</div><%
			
			if((j+1) % 3 == 0){
				count = j+1;
				break;		
			}
		}
		%><div class="clearfix"></div>
	</div>
<%}%>


<h3 class="m_2">Top Products</h3>

<%
var count = 0;
var limit = Math.ceil(data.topProducts.length / 3);
for(i = 0 ; i < limit ; i++){	

	%><div class="content_grid"><%
		for(j = count ; j < (data.topProducts.length) ; j++){
			%><div class="col_1_of_3 span_1_of_3"> 
				<div class="view view-first">
					<a href="javascript:void(0)">
					<div class="inner_content clearfix">
					<div class="product_image" data-productid="<%=data.topProducts[j].productID%>">
						<img src="<%=data.topProducts[j].productImage%>" class="img-responsive" alt="">
					<div class="mask">
					<div class="info">Quick View</div>
					</div>
					<div class="product_container">
					<div class="cart-left">
						<p class="title"><%=data.topProducts[j].productName%></p>
					</div>
					<div class="price"><%=data.topProducts[j].currency%> <%=data.topProducts[j].productUnitPrice%></div>
					<div class="clearfix"></div>
					</div>		
					</div>	
					</div>
					</a>
				</div>
			</div><%
			
			if((j+1) % 3 == 0){
				count = j+1;
				break;		
			}
		}
		%><div class="clearfix"></div>
	</div>
<%}%>

<h3 class="m_2">Recommended Products</h3>
<%
var count = 0;
var limit = Math.ceil(data.recommendedProducts.length / 3);
for(i = 0 ; i < limit ; i++){	

	%><div class="content_grid"><%
		for(j = count ; j < (data.recommendedProducts.length) ; j++){
			%><div class="col_1_of_3 span_1_of_3"> 
				<div class="view view-first">
					<a href="javascript:void(0)">
					<div class="inner_content clearfix">
					<div class="product_image" data-productid="<%=data.recommendedProducts[j].productID%>">
						<img src="<%=data.recommendedProducts[j].productImage%>" class="img-responsive" alt="">
					<div class="mask">
					<div class="info">Quick View</div>
					</div>
					<div class="product_container">
					<div class="cart-left">
						<p class="title"><%=data.recommendedProducts[j].productName%></p>
					</div>
					<div class="price"><%=data.recommendedProducts[j].currency%> <%=data.recommendedProducts[j].productUnitPrice%></div>
					<div class="clearfix"></div>
					</div>		
					</div>	
					</div>
					</a>
				</div>
			</div><%
			
			if((j+1) % 3 == 0){
				count = j+1;
				break;		
			}
		}
		%><div class="clearfix"></div>
	</div>
<%}%>
 </div>
