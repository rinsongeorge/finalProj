/**
 * 
 */
package com.farmtohome.vo;

import java.util.List;

/**
 * @author rinson
 *
 */
public class ProductsVO {

	List<Category> category;
	List<Product> products;
	
	public List<Category> getCategory() {
		return category;
	}
	public void setCategory(List<Category> category) {
		this.category = category;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
}
