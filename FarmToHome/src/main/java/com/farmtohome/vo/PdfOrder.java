package com.farmtohome.vo;

public class PdfOrder {

	String orderId;
	
	String orderAmount;
	
	String orderShipName;
	
	String orderDate;
	
	String orderStatus;

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderShipName() {
		return orderShipName;
	}

	public void setOrderShipName(String orderShipName) {
		this.orderShipName = orderShipName;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
}
