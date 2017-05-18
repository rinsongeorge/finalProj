/**
 * 
 */
package com.farmtohome.vo;

import java.util.List;

/**
 * @author rinson
 *
 */
public class Availability {
	
	List<Category> category;
	List<Product> newProducts;
	List<Product> recommendedProducts; 
	List<Product> topProducts;
	
	public List<Category> getCategory() {
		return category;
	}
	public void setCategory(List<Category> category) {
		this.category = category;
	}
	public List<Product> getNewProducts() {
		return newProducts;
	}
	public void setNewProducts(List<Product> newProducts) {
		this.newProducts = newProducts;
	}
	public List<Product> getRecommendedProducts() {
		return recommendedProducts;
	}
	public void setRecommendedProducts(List<Product> recommendedProducts) {
		this.recommendedProducts = recommendedProducts;
	}
	public List<Product> getTopProducts() {
		return topProducts;
	}
	public void setTopProducts(List<Product> topProducts) {
		this.topProducts = topProducts;
	}
}
