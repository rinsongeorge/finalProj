<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

     <div class="footer">
			<div class="container">

				
					<c:set var="count" value="1" />
					<c:forEach var="category" items="${categories}">
						<c:if test="${count eq 1}">
							<div class="footer-grid">
								<h3>Category</h3>
								<ul class="list1">
						</c:if>
						<li data-categoryid="${category.categoryID}"><a href="/FarmToHome/List">${category.categoryName}</a></li>
						<c:set var="count" value="${count + 1}" />
						<c:if test="${count gt 6}">
								</ul>
							</div>
							<c:set var="count" value="1" />
						</c:if>
					</c:forEach>
				    
				<div class="footer-grid">
					<h3>Our Account</h3>
				    <ul class="list1">
					  <li><a href="#">Your Account</a></li>
					  <li><a href="#">Addresses</a></li>
					  <li><a href="#">Orders history</a></li>
					  <li><a href="#">Track your order</a></li>
					  <li><a href="#">Search Terms</a></li>
				    </ul>
				</div>
				<div class="footer-grid">
					<h3>Our Support</h3>
					<ul class="list1">
					  <li><a href="#">Contact Us</a></li>
				    </ul>
				  </div>
				  
				 <div class="footer-grid footer-grid_last">
					<h3>About Us</h3>
					<p class="footer_desc"></p>
                    <p class="f_text">Phone:  &nbsp;&nbsp;&nbsp;00-250-2131</p>
                    <p class="email">Email: &nbsp;&nbsp;&nbsp;<span>info@farmtohome.com</span></p>	
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