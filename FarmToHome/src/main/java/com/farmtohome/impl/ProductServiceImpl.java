/**
 * 
 */
package com.farmtohome.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.farmtohome.repository.GenericRepository;
import com.farmtohome.service.ProductService;
import com.farmtohome.vo.Category;
import com.farmtohome.vo.Product;

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
}
