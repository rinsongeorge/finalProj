<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="login">
	<li class="login_text"><a href="<c:url value='/Login'/>">Login</a></li>
	<!-- <li class="wish"><a href="javascript:void(0)">Wish List</a></li> -->
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