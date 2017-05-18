/**
 * 
 */
package com.farmtohome.service;

import java.util.List;

import com.farmtohome.vo.Category;
import com.farmtohome.vo.Product;

/**
 * @author rinson
 *
 */
public interface ProductService {

	public List<Product> getProducts(String category);
	
	public List<Product> getNewProducts();
	
	public List<Product> getTopProducts();
	
	public List<Product> getRecommendedProducts();
	
	public List<Category> getCategory();

	public Product getProduct(String productId);
}
