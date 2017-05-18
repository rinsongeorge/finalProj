/**
 * 
 */
package com.farmtohome.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.farmtohome.vo.Category;
import com.farmtohome.vo.Product;

/**
 * @author rinson
 *
 */
@Repository("genericRepo")
public class GenericRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Product> getProductDetails(String query) throws Exception{
		
		if(!StringUtils.isEmpty(query)){
			List<Product> products = new ArrayList<Product>();
			List<Map<String,Object>> rows = jdbcTemplate.queryForList(query);
			if(null != rows && !rows.isEmpty()){
				for (Map<String, Object> row : rows) {
					Product product = new Product();
					product.setProductID(row.get("productID").toString());
					product.setCategoryID(row.get("CategoryID").toString());
					product.setProductName(row.get("ProductName").toString());
					product.setCurrency(row.get("Currency").toString());
					product.setProductDescription(row.get("ProductDescription").toString());
					product.setProductImage(row.get("ProductImage").toString());
					product.setProductThumbImage(row.get("ProductThumbImage").toString());
					product.setProductUnitPrice(row.get("ProductUnitPrice").toString());
					product.setProductUnitWeight(row.get("ProductUnitWeight").toString());
					products.add(product);
				}
				return products;
			}
		}
		return null;
	}

	public List<Category> getCategories(String query) {
		if(!StringUtils.isEmpty(query)){
			List<Category> categories = new ArrayList<Category>();
			List<Map<String,Object>> rows = jdbcTemplate.queryForList(query);
			if(null != rows && !rows.isEmpty()){
				for (Map<String, Object> row : rows) {
					Category category = new Category();
					category.setCategoryID(row.get("CategoryID").toString());
					category.setCategoryImage(row.get("CategoryImage").toString());
					category.setCategoryName(row.get("CategoryName").toString());
					category.setDescription(row.get("Description").toString());
					categories.add(category);
				}
				return categories;
			}
		}
		return null;
	}

	public Product getProduct(String query) {
		if(!StringUtils.isEmpty(query)){
			Product product = new Product();
			Map<String,Object> row = jdbcTemplate.queryForMap(query);
			if(null != row && !row.isEmpty()){
				product.setProductID(row.get("productID").toString());
				product.setCategoryID(row.get("CategoryID").toString());
				product.setProductName(row.get("ProductName").toString());
				product.setCurrency(row.get("Currency").toString());
				product.setProductDescription(row.get("ProductDescription").toString());
				product.setProductImage(row.get("ProductImage").toString());
				product.setProductThumbImage(row.get("ProductThumbImage").toString());
				product.setProductUnitPrice(row.get("ProductUnitPrice").toString());
				product.setProductUnitWeight(row.get("ProductUnitWeight").toString());
			}
			return product;
		}
		return null;
	}
}
