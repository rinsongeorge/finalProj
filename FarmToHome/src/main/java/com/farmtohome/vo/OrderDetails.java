package com.farmtohome.vo;

import java.math.BigDecimal;
import java.util.List;

public class OrderDetails {

	public String detailIOrderID;
	
	public BigDecimal detailPrice; 
	
	public int detailQuantity; 
	
	public BigDecimal total;
	
	public int productId;
	
	public int sellerId;

	public String productInfo;
	
	public String sellerInfo;
	

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getSellerInfo() {
		return sellerInfo;
	}

	public void setSellerInfo(String sellerInfo) {
		this.sellerInfo = sellerInfo;
	}

	public String getDetailIOrderID() {
		return detailIOrderID;
	}

	public void setDetailIOrderID(String detailIOrderID) {
		this.detailIOrderID = detailIOrderID;
	}

	public BigDecimal getDetailPrice() {
		return detailPrice;
	}

	public void setDetailPrice(BigDecimal detailPrice) {
		this.detailPrice = detailPrice;
	}

	public int getDetailQuantity() {
		return detailQuantity;
	}

	public void setDetailQuantity(int detailQuantity) {
		this.detailQuantity = detailQuantity;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	@Override
	public String toString() {
		return "OrderDetails [detailIOrderID=" + detailIOrderID + ", detailPrice=" + detailPrice + ", detailQuantity="
				+ detailQuantity + ", total=" + total + ", productId=" + productId + ", sellerId=" + sellerId
				+ ", productInfo=" + productInfo + ", sellerInfo=" + sellerInfo + "]";
	} 
	
}
