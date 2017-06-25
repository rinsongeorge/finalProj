package com.farmtohome.vo;

public class PaymentForm {

	private String nameOnCard;
	
	private String creditCardNumber;
	
	private String expiryDate;
	
	private String securityCode;
	
	private String address1;
	
	private String address2;
	
	private String address3;
	
	private String city;
	
	private String pincode;

	private String mobile;
	
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getNameOnCard() {
		return nameOnCard;
	}

	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}

	public String getCreditCardNumber() {
		return creditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	@Override
	public String toString() {
		return "PaymentForm [nameOnCard=" + nameOnCard + ", creditCardNumber=" + creditCardNumber + ", expiryDate="
				+ expiryDate + ", securityCode=" + securityCode + ", address1=" + address1 + ", address2=" + address2
				+ ", address3=" + address3 + ", city=" + city + ", pincode=" + pincode + ", mobile=" + mobile + "]";
	}	
	
}
