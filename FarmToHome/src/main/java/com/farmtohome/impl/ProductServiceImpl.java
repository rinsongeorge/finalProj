/**
 * 
 */
package com.farmtohome.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.farmtohome.repository.GenericRepository;
import com.farmtohome.service.ProductService;
import com.farmtohome.vo.CartItem;
import com.farmtohome.vo.Category;
import com.farmtohome.vo.Product;
import com.farmtohome.vo.ShoppingCart;
import com.google.gson.Gson;

/**
 * @author rinson
 *
 */

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	GenericRepository genericRepo;
	               
	@Override
	public List<Product> getProducts(String category) {
		
		if(!StringUtils.isEmpty(category)){
			try{
				return genericRepo.getProductDetails("SELECT * FROM product where CategoryID = " + category);
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public List<Product> getNewProducts() {
		
		try{
			return genericRepo.getProductDetails("SELECT * FROM product limit 6");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> getTopProducts() {
		
		try{
			return genericRepo.getProductDetails("SELECT * FROM product limit 3");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Product> getRecommendedProducts() {
		
		try{
			return genericRepo.getProductDetails("SELECT * FROM product limit 3");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Category> getCategory() {
		
		try{
			return genericRepo.getCategories("SELECT * FROM category");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Product getProduct(String productId) {
		if(!StringUtils.isEmpty(productId)){
			try{
				return genericRepo.getProduct("SELECT * FROM product where ProductID = " + productId);
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return null;
	}

	// GET PRODUCT DETAILS AND FIND OUT SUM 
	@Override
	public ShoppingCart addToShoppingCart(CartItem cartItem, ServletContext servletContext) {
	
		ShoppingCart shoppingCart = (ShoppingCart) servletContext.getAttribute("shoppingCart");	
		Product product = getProduct(cartItem.getProductId());
		cartItem.setProduct(product);
		if(null == shoppingCart){		
			shoppingCart = new ShoppingCart();
			Map<String, CartItem> items  = new HashMap<String, CartItem>();
			items.put(cartItem.getProductId(), cartItem);
			shoppingCart.setCartItems(items);
		}else if(null != shoppingCart 
				&& null != shoppingCart.getCartItems()
				&& null != shoppingCart.getCartItems().get(cartItem.getProductId())){		
			CartItem item = shoppingCart.getCartItems().get(cartItem.getProductId());
			item.setQty(item.getQty() + cartItem.getQty());
		}else{
			shoppingCart.getCartItems().put(cartItem.getProductId(), cartItem);	
		}
		
		BigDecimal total = BigDecimal.ZERO;
		for( Entry<String, CartItem> entry : shoppingCart.getCartItems().entrySet()){
			CartItem cartitem = entry.getValue();
			BigDecimal amt = new BigDecimal(cartitem.getProduct().getProductUnitPrice())
					.multiply(new BigDecimal(cartitem.getQty()));
			System.out.println("amt : " + amt);
			total = total.add(amt);
			shoppingCart.setTotalAmount(total);
			System.out.println("total : " + total);

		}
		servletContext.setAttribute("shoppingCart", shoppingCart);
		System.out.println(new Gson().toJson(shoppingCart));
		return shoppingCart;
	}
}
