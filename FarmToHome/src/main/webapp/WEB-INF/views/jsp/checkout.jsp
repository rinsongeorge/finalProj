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
<link href="resources/static/css/component.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
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
				<li class="login_text"><a href="javascript:void(0)">Login</a></li>
				<li class="wish"><a href="javascript:void(0)">Wish List</a></li>
				<div class='clearfix'></div>
		    </ul>
		    <div class="cart_bg">
			  <ul class="cart">
				<i class="cart_icon"></i><p class="cart_desc">$1459.50<br><span class="yellow">2 items</span></p>
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
				<li class="check"><a href="javascript:void(0)">Checkout</a></li>
				<div class='clearfix'></div>
		     </ul>
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
		  	  <h4 class="title">Shopping cart is empty</h4>
		  	  <p class="cart">You have no items in your shopping cart.<br>Click<a href="javascript:void(0)"> here</a> to continue shopping</p>
		   </div>
	     </div>
	    </div>
		
	    <div class="container">
	      
	      <ul class="footer_social">
			<li><a href="#"> <i class="fb"> </i> </a></li>
			<li><a href="#"><i class="tw"> </i> </a></li>
			<li><a href="#"><i class="pin"> </i> </a></li>
			<div class="clearfix"></div>
		   </ul>
	    </div>
        <div class="footer">
			<div class="container">
				<div class="footer-grid">
					<h3>Category</h3>
					<ul class="list1">
					  <li><a href="#">Home</a></li>
					  <li><a href="#">About us</a></li>
					  <li><a href="#">Eshop</a></li>
					  <li><a href="#">Features</a></li>
					  <li><a href="#">New Collections</a></li>
					  <li><a href="#">Blog</a></li>
					  <li><a href="#">Contact</a></li>
				    </ul>
				</div>
				<div class="footer-grid">
					<h3>Our Account</h3>
				    <ul class="list1">
					  <li><a href="#">Your Account</a></li>
					  <li><a href="#">Personal information</a></li>
					  <li><a href="#">Addresses</a></li>
					  <li><a href="#">Discount</a></li>
					  <li><a href="#">Orders history</a></li>
					  <li><a href="#">Addresses</a></li>
					  <li><a href="#">Search Terms</a></li>
				    </ul>
				</div>
				<div class="footer-grid">
					<h3>Our Support</h3>
					<ul class="list1">
					  <li><a href="#">Site Map</a></li>
					  <li><a href="#">Search Terms</a></li>
					  <li><a href="#">Advanced Search</a></li>
					  <li><a href="#">Mobile</a></li>
					  <li><a href="#">Contact Us</a></li>
					  <li><a href="#">Mobile</a></li>
					  <li><a href="#">Addresses</a></li>
				    </ul>
				  </div>
				  <div class="footer-grid">
					<h3>Newsletter</h3>
					<p class="footer_desc">Nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat</p>
					<div class="search_footer">
			          <input type="text" class="text" value="Insert Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Insert Email';}">
			          <input type="submit" value="Submit">
			        </div>
			        <img src="resources/static/images/payment.png" class="img-responsive" alt=""/>
				 </div>
				 <div class="footer-grid footer-grid_last">
					<h3>About Us</h3>
					<p class="footer_desc">Diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam,.</p>
                    <p class="f_text">Phone:  &nbsp;&nbsp;&nbsp;00-250-2131</p>
                    <p class="email">Email: &nbsp;&nbsp;&nbsp;<span>info(at)Surfhouse.com</span></p>	
                 </div>
				 <div class="clearfix"> </div>
			</div>
		</div>
        <div class="footer_bottom">
        	<div class="container">
        		<div class="copy">
				   <p>&copy; 2014 Template by <a href="http://w3layouts.com" target="_blank"> w3layouts</a></p>
			    </div>
        	</div>
        </div>
</body>
</html>		