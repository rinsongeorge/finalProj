/**
 * 
 */
package com.farmtohome.service;

import java.util.List;

import javax.servlet.ServletContext;

import com.farmtohome.vo.CartItem;
import com.farmtohome.vo.Category;
import com.farmtohome.vo.Product;
import com.farmtohome.vo.ShoppingCart;

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

	public ShoppingCart addToShoppingCart(CartItem cartItem, ServletContext servletContext);

	public boolean checkSellerAvailability(String pinCode);

	public boolean addProduct(Product product);

	public boolean addCategory(Category category);

	public byte[] createOrderPDF(String fromDate, String toDate);
}

