<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML>
<html>
<head>
<title>Booking Confirmation</title>
<link href="resources/static/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/static/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="resources/static/css/style.css" rel='stylesheet' type='text/css' />
<link href="resources/static/css/component.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script src="resources/static/js/jquery.easydropdown.js"></script>
<!-- Add fancyBox main JS and CSS files -->
<script src="resources/static/js/jquery.magnific-popup.js" type="text/javascript"></script>
<link href="resources/static/css/magnific-popup.css" rel="stylesheet" type="text/css">
		<script>
			$(document).ready(function() {
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
		});
		</script>
<!----details-product-slider--->
<script>
	var F2F = {};
</script>
<script src="resources/static/js/bootstrap.js"></script>
<script src="resources/static/js/underscore.js"></script>
<script src="resources/static/js/common.js"></script>

</head>
<body>
   <div class="single">
	<div class="container">
		<div class="header-top">
      		 <div class="logo">
				<a href="javascript:void(0)"><img src="resources/static/images/logo.png" alt=""/></a>
			 </div>
		   <div class="header_right">
			 <ul class="social">
				<li><a href=""> <i class="fb"> </i> </a></li>
				<li><a href=""><i class="tw"> </i> </a></li>
				<li><a href=""><i class="utube"> </i> </a></li>
				<li><a href=""><i class="pin"> </i> </a></li>
				<li><a href=""><i class="instagram"> </i> </a></li>
			 </ul>
		    <div class="lang_list">
			  <select tabindex="4" class="dropdown">
				<option value="" class="label" value="">En</option>
				<option value="1">English</option>
				<option value="2">French</option>
				<option value="3">German</option>
			  </select>
   			</div>
			<div class="clearfix"></div>
          </div>
          <div class="clearfix"></div>
		 </div>  
		 <div class="apparel_box">
			<ul class="login">
				
				<c:choose>  
					<c:when test="${userDetails eq null}">  
						<li class="login_text"><a href="<c:url value='/Login'/>">Login</a></li>
					</c:when>  
					<c:otherwise>  
						<li class="login_text logout-link"><a href="#">Logout</a></li>
					</c:otherwise>  
				</c:choose>

				<div class='clearfix'></div>
		    </ul>
		    <div class="cart_bg">
			  <ul class="cart">

					<c:set var="amount" value="0.0"/>
					<c:set var="itemSize" value="0"/>
					<c:if test="${sessionShoppingCart ne null && sessionShoppingCart.totalAmount ne null}">
						<c:set var="amount" value="${sessionShoppingCart.totalAmount}"/>
						<c:set var="itemSize" value="${sessionShoppingCart.cartItems.size()}"/>
					</c:if>  
					<i class="cart_icon"></i><b>&#8377; &nbsp;</b><p class="cart_desc">${amount}<br>
					<span class="yellow">${itemSize} item(s)</span></p>

			    <div class='clearfix'></div>
			  </ul>
			  <ul class="product_control_buttons">
				 <li><a href="#"><img src="resources/static/images/close.png" alt=""/></a></li>
				 <li><a href="#">Edit</a></li>
			  </ul>
		      <div class='clearfix'></div>
			 </div>
			 
			<div class="search">
			   <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
			   <input type="submit" value="">
			</div>
		  </div>
		</div>
    </div>
    <div class="main">
	   <div class="container">
		   <div class="register">		   	  
				<h3>Hi ${userDetails.firstName}</h3><br/>
		   		<p>
					<b>Your order ( Order ID : ${order.orderID} ) has been placed</b	>
					<c:if test="${itemSize == 0}">
						is empty
					</c:if>
				</p>
				<br/>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Product Price</th>
							<th>Product Quantity</th>
							<th>Amount</th>
							
						</tr>
					</thead>
					<tbody>
					<c:forEach var="cart" items="${sessionShoppingCart.cartItems}">
						<tr>	
							<td>${cart.value.product.productName}</td>
							<td>${cart.value.product.productUnitPrice}</td>
							<td>${cart.value.qty}</td>
							<td>${cart.value.qty * cart.value.product.productUnitPrice}</td>
							
						</tr>
					</c:forEach>
					</tbody>
				</table>
		   </div>
	     </div>
	    </div>
	    
       <jsp:include page="/WEB-INF/views/jsp/footer-f.jsp" />
	
	<div id="myCartModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Cart Items</h4>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Product Price</th>
								<th>Product Quantity</th>
								<th>Amount</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="cart" items="${sessionShoppingCart.cartItems}">
							<tr>	
								<td>${cart.value.product.productName}</td>
								<td>${cart.value.product.productUnitPrice}</td>
								<td>${cart.value.qty}</td>
								<td>${cart.value.qty * cart.value.product.productUnitPrice}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="myAddressModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
		<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Cart Items</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="addr1">Address Line 1 : *</label>
							<input type="text" class="form-control" id="addr1">
						</div>
						<div class="form-group">
							<label for="addr2">Address Line 2 : </label>
							<input type="text" class="form-control" id="addr2">
						</div>
						<div class="form-group">
							<label for="addr2">Address Line 3 : </label>
							<input type="text" class="form-control" id="addr2">
						</div>
						<div class="form-group">
							<label for="addr2">City : </label>
							<input type="text" class="form-control" id="addr2">
						</div>
						<div class="form-group">
							<label for="addr2">State : </label>
							<input type="text" class="form-control" id="addr2">
						</div>
						<div class="form-group">
							<label for="addr2">PinCode : </label>
							<input type="text" class="form-control" id="addr2">
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">SAVE</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/jsp/logout.jsp" />

</body>
</html>		