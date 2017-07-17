package com.farmtohome.service;

import java.util.List;

import com.farmtohome.vo.Order;
import com.farmtohome.vo.OrderDetails;
import com.farmtohome.vo.PaymentForm;
import com.farmtohome.vo.ShoppingCart;

public interface PaymentService {

	public Order createOrder(ShoppingCart shoppingCart, PaymentForm form);

	public Order capturePayment(PaymentForm form);
	
	public boolean upadatePaymentDetails(PaymentForm form, Order order);
	
	public boolean updateShoppingCart(ShoppingCart shoppingCart);

	public List<Order> getUserOrders(int i);

	public List<OrderDetails> getOrderDetails(String orderId);
}
