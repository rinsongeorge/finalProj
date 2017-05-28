package com.farmtohome.service;

import com.farmtohome.vo.Order;
import com.farmtohome.vo.OrderDetails;
import com.farmtohome.vo.ShoppingCart;

public interface PaymentService {

	public Order createOrder(ShoppingCart shoppingCart);
}
