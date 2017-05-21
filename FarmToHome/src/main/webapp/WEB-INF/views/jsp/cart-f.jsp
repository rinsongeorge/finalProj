<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="login">
	<li class="login_text"><a href="<c:url value='/Login'/>">Login</a></li>
	<!-- <li class="wish"><a href="javascript:void(0)">Wish List</a></li> -->
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
	<li class="check"><a href="<c:url value='/Checkout'/>">Checkout</a></li>
	<div class='clearfix'></div>
</ul>
<div class="search">
	<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
	<input type="submit" value="">
</div>