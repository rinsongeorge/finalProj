<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML>
<html>
<head>
<title>Check-Out</title>
<link href="resources/static/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/static/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="resources/static/css/style.css" rel='stylesheet' type='text/css' />
<link href="resources/static/css/payment.css" rel='stylesheet' type='text/css' />
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
				<c:if test="${shoppingCart ne null && shoppingCart.totalAmount ne null}">
					<c:set var="amount" value="${shoppingCart.totalAmount}"/>
					<c:set var="itemSize" value="${shoppingCart.cartItems.size()}"/>
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
			 <ul class="quick_access">
				<li class="view_cart"><a href="javascript:void(0)">View Cart</a></li>
				<li class="check"><a href="<c:url value='/Checkout'/>">Checkout</a></li>
				<div class='clearfix'></div>
		     </ul>
			<div class="search">
			   <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
			   <input type="submit" value="">
			</div>
		  </div>
		</div>
    </div>

		<div class="container">
		  <div id="Checkout" class="inline">
			  <h1>Pay Invoice</h1>
			  <div class="card-row">
				  <span class="visa"></span>
				  <span class="mastercard"></span>
				  <span class="amex"></span>
				  <span class="discover"></span>
			  </div>
			  <c:url var="paymentUrl" value="/doPayment"/>
			  <form action="${paymentUrl}" method="post">
			  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				  <div class="form-group">
					  <label for="PaymentAmount">Payment amount</label>
					  <div class="amount-placeholder">
						  <span><b>&#8377;</b></span>
						  <span>${sessionShoppingCart.totalAmount}</span>
					  </div>
				  </div>
				  <div class="form-group">
					  <label for="nameOnCard">Name on card</label>
					  <input id="nameOnCard" name="nameOnCard" type="text" maxlength="255"></input>
				  </div>
				  <div class="form-group">
					  <label for="creditCardNumber">Card number</label>
					  <input id="creditCardNumber" name="creditCardNumber" class="null card-image form-control" type="text"></input>
				  </div>
				  <div class="expiry-date-group form-group">
					  <label for="expiryDate">Expiry date</label>
					  <input id="ExpiryDate" name="expiryDate" type="text" placeholder="MM / YY" maxlength="7"></input>
				  </div>
				  <div class="security-code-group form-group">
					  <label for="SecurityCode">CVV code</label>
					  <div class="input-container" >
						  <input id="SecurityCode" name="securityCode" type="text" ></input>
						  <i id="cvc" class="fa fa-question-circle"></i>
					  </div>
					  <div class="cvc-preview-container two-card hide">
						  <div class="amex-cvc-preview"></div>
						  <div class="visa-mc-dis-cvc-preview"></div>
					  </div>
				  </div>
				  <br/>	
				  <p>Shipping Address :</p><br/>
				  <div class="form-group">
					  <label for="address1">Address Line 1</label>
					  <input id="address1" name="address1" type="text" maxlength="255"></input>
				  </div>
				  <div class="form-group">
					  <label for="address2">Address Line 2</label>
					  <input id="NameOnCard" name="address2" type="text" maxlength="255"></input>
				  </div>
				  <div class="form-group">
					  <label for="address3">Address Line 3</label>
					  <input id="address3" name="address3" type="text" maxlength="255"></input>
				  </div>
				  <div class="form-group">
					  <label for="city">City</label>
					  <input id="city" name="city" type="text" maxlength="255"></input>
				  </div>	
				  <div class="form-group">
					  <label for="pincode">Pincode</label>
					  <input id="pincode" name="pincode" type="text" maxlength="255"></input>
				  </div>
				  <div class="form-group">
					  <label for="mobile">Mobile No:</label>
					  <input id="mobile" name="mobile" type="text" maxlength="255"></input>
				  </div>
				  <button id="PayButton" class="btn btn-block btn-success submit-button" type="submit">
					  <span class="submit-button-lock"></span>
					  <span class="align-middle">Pay <b>&#8377; &nbsp;</b> ${sessionShoppingCart.totalAmount}</span>
				  </button>
			  </form>
		  </div>
		</div>

		
	    <div class="container">
	      
	      
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
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="cart" items="${sessionShoppingCart.cartItems}">
							<tr>	
								<td>${cart.value.product.productName}</td>
								<td>${cart.value.product.productUnitPrice}</td>
								<td>${cart.value.qty}</td>
								<td>${cart.value.qty * cart.value.product.productUnitPrice}</td>
								<td><a href="#">Edit</a>  /  <a href="#">Delete</a></td>
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
	<jsp:include page="/WEB-INF/views/jsp/logout.jsp" />
</body>
</html>		