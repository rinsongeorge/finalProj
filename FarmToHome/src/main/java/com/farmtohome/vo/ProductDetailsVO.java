/**
 * 
 */
package com.farmtohome.vo;

import java.util.List;

/**
 * @author rinson
 *
 */
public class ProductDetailsVO {

	List<Category> category;
	Product selectedProduct;
	List<Product> suggestion;
	
	public List<Category> getCategory() {
		return category;
	}
	public void setCategory(List<Category> category) {
		this.category = category;
	}
	public Product getSelectedProduct() {
		return selectedProduct;
	}
	public void setSelectedProduct(Product selectedProduct) {
		this.selectedProduct = selectedProduct;
	}
	public List<Product> getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(List<Product> suggestion) {
		this.suggestion = suggestion;
	}	
	
}
