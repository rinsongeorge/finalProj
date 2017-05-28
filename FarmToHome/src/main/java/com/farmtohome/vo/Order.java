package com.farmtohome.vo;

import java.math.BigDecimal;
import java.util.List;

public class Order {

	private String OrderID;
	
	private String OrderDate;
	
	private BigDecimal OrderAmount;
	
	private double Freight;
	
	private double Tax;
	
	private String OrderShipName;
	
	private String OrderShipAddress1;
	
	private String OrderShipAddress2;
	
	private String OrderCity;
	
	private String OrderState;
	
	private String OrderPinCode;
	
	private String OrderCountry;
	
	private String OrderPhone;
	
	private String OrderMobile;
	
	private String OrderEmail;
	
	private String TransactionStatus;
	
	private boolean Paid;
	
	private String ErrMsg;
	
	private String ErrLoc;
	
	private String Refund;
	
	private String PaymentID;
	
	private List<OrderDetails> orderDetails;

	public String getOrderID() {
		return OrderID;
	}

	public void setOrderID(String orderID) {
		OrderID = orderID;
	}

	public String getOrderDate() {
		return OrderDate;
	}

	public void setOrderDate(String orderDate) {
		OrderDate = orderDate;
	}

	public BigDecimal getOrderAmount() {
		return OrderAmount;
	}

	public void setOrderAmount(BigDecimal orderAmount) {
		OrderAmount = orderAmount;
	}

	public double getFreight() {
		return Freight;
	}

	public void setFreight(double freight) {
		Freight = freight;
	}

	public double getTax() {
		return Tax;
	}

	public void setTax(double tax) {
		Tax = tax;
	}

	public String getOrderShipName() {
		return OrderShipName;
	}

	public void setOrderShipName(String orderShipName) {
		OrderShipName = orderShipName;
	}

	public String getOrderShipAddress1() {
		return OrderShipAddress1;
	}

	public void setOrderShipAddress1(String orderShipAddress1) {
		OrderShipAddress1 = orderShipAddress1;
	}

	public String getOrderShipAddress2() {
		return OrderShipAddress2;
	}

	public void setOrderShipAddress2(String orderShipAddress2) {
		OrderShipAddress2 = orderShipAddress2;
	}

	public String getOrderCity() {
		return OrderCity;
	}

	public void setOrderCity(String orderCity) {
		OrderCity = orderCity;
	}

	public String getOrderState() {
		return OrderState;
	}

	public void setOrderState(String orderState) {
		OrderState = orderState;
	}

	public String getOrderPinCode() {
		return OrderPinCode;
	}

	public void setOrderPinCode(String orderPinCode) {
		OrderPinCode = orderPinCode;
	}

	public String getOrderCountry() {
		return OrderCountry;
	}

	public void setOrderCountry(String orderCountry) {
		OrderCountry = orderCountry;
	}

	public String getOrderPhone() {
		return OrderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		OrderPhone = orderPhone;
	}

	public String getOrderMobile() {
		return OrderMobile;
	}

	public void setOrderMobile(String orderMobile) {
		OrderMobile = orderMobile;
	}

	public String getOrderEmail() {
		return OrderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		OrderEmail = orderEmail;
	}

	public String getTransactionStatus() {
		return TransactionStatus;
	}

	public void setTransactionStatus(String transactionStatus) {
		TransactionStatus = transactionStatus;
	}

	public boolean isPaid() {
		return Paid;
	}

	public void setPaid(boolean paid) {
		Paid = paid;
	}

	public String getErrMsg() {
		return ErrMsg;
	}

	public void setErrMsg(String errMsg) {
		ErrMsg = errMsg;
	}

	public String getErrLoc() {
		return ErrLoc;
	}

	public void setErrLoc(String errLoc) {
		ErrLoc = errLoc;
	}

	public String getRefund() {
		return Refund;
	}

	public void setRefund(String refund) {
		Refund = refund;
	}

	public String getPaymentID() {
		return PaymentID;
	}

	public void setPaymentID(String paymentID) {
		PaymentID = paymentID;
	}

	public List<OrderDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
}
