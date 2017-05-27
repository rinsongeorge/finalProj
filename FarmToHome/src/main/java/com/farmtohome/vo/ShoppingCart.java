package com.farmtohome.vo;

import java.math.BigDecimal;
import java.util.Map;

public class ShoppingCart {

	private Map<String, CartItem> cartItems;
	
	private BigDecimal totalAmount;

	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Map<String, CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}
	
}
