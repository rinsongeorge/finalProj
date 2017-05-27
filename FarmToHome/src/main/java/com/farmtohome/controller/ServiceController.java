/**
 * 
 */
package com.farmtohome.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.ModelAndView;

import com.farmtohome.service.ProductService;
import com.farmtohome.service.UserService;
import com.farmtohome.vo.Availability;
import com.farmtohome.vo.CartItem;
import com.farmtohome.vo.Category;
import com.farmtohome.vo.Product;
import com.farmtohome.vo.ProductDetailsVO;
import com.farmtohome.vo.ProductsVO;
import com.farmtohome.vo.RegistrationForm;
import com.farmtohome.vo.ShoppingCart;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * @author rinson
 *
 */
@Controller
public class ServiceController {

	/*@Autowired
	private JdbcTemplate jdbcTemplate;*/
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ServletContext servletContext;
	
	private final Gson gson = new Gson();
	
	@RequestMapping(value = "/availability")
	@ResponseBody
	public String availabilityHomePage(){ 
		
		List<Product> newProducts = productService.getNewProducts();
		List<Product> topProducts = productService.getTopProducts();
		List<Product> recommendedProducts = productService.getRecommendedProducts();
		List<Category> categories = productService.getCategory();
		
		servletContext.setAttribute("categories", categories);
		
		Availability availability = new Availability();
		availability.setCategory(categories);
		availability.setNewProducts(newProducts);
		availability.setRecommendedProducts(recommendedProducts);
		availability.setTopProducts(topProducts);
		return gson.toJson(availability);
	}	
	
	@RequestMapping(value = "/products")
	@ResponseBody
	public String getProducts(@RequestParam String categoryId){ 
		
		if(!StringUtils.isEmpty(categoryId)){	
			ProductsVO productsVO = new ProductsVO();
			List<Product> products = productService.getProducts(categoryId);
			@SuppressWarnings("unchecked")
			List<Category> categories = (List<Category>) servletContext.getAttribute("categories");
			productsVO.setCategory(categories);
			productsVO.setProducts(products);
			return gson.toJson(productsVO);
		}
		return null;
	}
	
	@RequestMapping(value = "/productDetails")
	@ResponseBody
	public String getProductDetails(@RequestParam String productId){ 
		if(!StringUtils.isEmpty(productId)){
			Product product = productService.getProduct(productId);
			List<Category> categories = (List<Category>) servletContext.getAttribute("categories");
			List<Product> recommendedProducts = productService.getRecommendedProducts();
			ProductDetailsVO productDetailsVO = new ProductDetailsVO();
			productDetailsVO.setCategory(categories);
			productDetailsVO.setSelectedProduct(product);
			productDetailsVO.setSuggestion(recommendedProducts);
			return gson.toJson(productDetailsVO);
		}
		return null;
	}
	
	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	@ResponseBody
	public ShoppingCart addToCart(@RequestBody CartItem cartItem){
		ShoppingCart shoppingCart = productService.addToShoppingCart(cartItem, servletContext);
		return shoppingCart;
	}
	
	@RequestMapping(value = "/doRegister", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute RegistrationForm registrationForm){	
		String status = userService.addUser(registrationForm);
		if(status.equalsIgnoreCase("added")){	
			return new ModelAndView("login", "status", status);
		}else {
			return new ModelAndView("register", "status", status);
		}
	}
}
