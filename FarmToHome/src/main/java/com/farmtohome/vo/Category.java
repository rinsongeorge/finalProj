/**
 * 
 */
package com.farmtohome.vo;

/**
 * @author rinson
 *
 */
public class Category {

	public String categoryID;
	public String categoryName;
	public String description;
	public String categoryImage;
	public String availableProducts;
	
	public String getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategoryImage() {
		return categoryImage;
	}
	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}
	public String getAvailableProducts() {
		return availableProducts;
	}
	public void setAvailableProducts(String availableProducts) {
		this.availableProducts = availableProducts;
	}
	
	
}
