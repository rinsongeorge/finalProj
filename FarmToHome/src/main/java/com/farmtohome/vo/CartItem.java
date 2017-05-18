/**
 * 
 */
package com.farmtohome.vo;

/**
 * @author rinson
 *
 */
public class CartItem {

	private String productId;
	
	private int qty;
	
	private String pinCode;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}
	
}
