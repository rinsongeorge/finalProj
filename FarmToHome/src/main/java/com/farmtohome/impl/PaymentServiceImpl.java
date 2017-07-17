package com.farmtohome.impl;

import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmtohome.repository.GenericRepository;
import com.farmtohome.service.PaymentService;
import com.farmtohome.vo.CartItem;
import com.farmtohome.vo.Order;
import com.farmtohome.vo.OrderDetails;
import com.farmtohome.vo.PaymentForm;
import com.farmtohome.vo.ShoppingCart;
import com.farmtohome.vo.User;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	GenericRepository genericRepo;
	
	@Autowired
	HttpServletRequest httpServletRequest;
	
	@Override
	public Order createOrder(ShoppingCart shoppingCart, PaymentForm form) {
		User user = (User) httpServletRequest.getSession().getAttribute("userDetails");
		if(null != shoppingCart
				&& null != form
				&& null != user){
			int orderId = genericRepo.createOrder(form, shoppingCart, user);
			Order order = genericRepo.getOrder(orderId);
			return order;
		}
		return null;
	}

	@Override
	public Order capturePayment(PaymentForm form) {
		
		ShoppingCart shoppingCart = (ShoppingCart) servletContext.getAttribute("shoppingCart");	
		if(null != shoppingCart){
			Order order = createOrder(shoppingCart, form);
			updateShoppingCart(shoppingCart);
			if(null != order){
				updateOrderDetails(order, shoppingCart);
				upadatePaymentDetails(form, order);
				return order;
			}
		}
		return null;
	}

	private void updateOrderDetails(Order order, ShoppingCart shoppingCart) {
		if(null != order){
			for( Entry<String, CartItem> cart :shoppingCart.getCartItems().entrySet()){
				genericRepo.addOrderDetails(cart.getValue(), order);
			}
		}
	}

	@Override
	public boolean upadatePaymentDetails(PaymentForm form, Order order) {
		if(null != form
				&& null != order){
			return genericRepo.addPaymentDetails(form, order);
		}
		return false;
	}

	@Override
	public boolean updateShoppingCart(ShoppingCart shoppingCart) {
		User user = (User) httpServletRequest.getSession().getAttribute("userDetails");
		for( Entry<String, CartItem> cart :shoppingCart.getCartItems().entrySet()){
			genericRepo.insertCarts(cart.getValue(), user.getUserID());
		}
		return true;
	}

	@Override
	public List<Order> getUserOrders(int userID) {
		return genericRepo.getOrders(userID);
	}

	@Override
	public List<OrderDetails> getOrderDetails(String orderId) {
		return genericRepo.getOrderDets(orderId);
	}

}
