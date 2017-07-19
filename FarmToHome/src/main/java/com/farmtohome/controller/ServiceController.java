/**
 * 
 */
package com.farmtohome.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
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
import com.farmtohome.service.PaymentService;
import com.farmtohome.service.UserService;
import com.farmtohome.vo.Availability;
import com.farmtohome.vo.CartItem;
import com.farmtohome.vo.Category;
import com.farmtohome.vo.Order;
import com.farmtohome.vo.PaymentForm;
import com.farmtohome.vo.Product;
import com.farmtohome.vo.ProductDetailsVO;
import com.farmtohome.vo.ProductsVO;
import com.farmtohome.vo.RegistrationForm;
import com.farmtohome.vo.ShoppingCart;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sun.javafx.collections.ArrayListenerHelper;

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
	PaymentService paymentService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HttpServletRequest request;
	
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
	public String addToCart(@RequestBody CartItem cartItem){
		boolean isSellerAvailable = productService.checkSellerAvailability(cartItem.getPinCode());
		if(isSellerAvailable){
			ShoppingCart shoppingCart = productService.addToShoppingCart(cartItem, servletContext);
			return new Gson().toJson(shoppingCart);
		}else{
			JsonObject o = new JsonObject();
			o.addProperty("msg", "Seller is not available for this product. Please choose different PinCode");
			return o.toString();
		}
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
	
	@RequestMapping(value = "/doPayment", method = RequestMethod.POST)
	public String payment(@ModelAttribute PaymentForm form){
		
		System.out.println(form.toString());	
		Order order = paymentService.capturePayment(form);
		if(null != order){
			request.getSession().setAttribute("order", order);
			servletContext.removeAttribute("shoppingCart");	
			return "redirect:/Confirmation";
		}
		return "payment";
	}
	
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute Product product){
		if(null != product
				&& null != product.getProductImageFile()){
			try {
				String imgPath = servletContext.getRealPath("/resources/static/images");
				System.out.println("imgPath : "+ imgPath);
				FileCopyUtils.copy(product.getProductImageFile().getBytes(),
						new File(imgPath + "/" + product.getProductImageFile().getOriginalFilename()));
				product.setProductImage(
						"resources/static/images/" + product.getProductImageFile().getOriginalFilename());
				product.setProductThumbImage(
						"resources/static/images/" + product.getProductImageFile().getOriginalFilename());
				product.setCurrency("INR");
				if(productService.addProduct(product))
					return "redirect:/Admin?productUp";
				else
					return "redirect:/Admin?productError";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/Admin?productError";
	}
	
	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addCategory(@ModelAttribute Category category){
		if(null != category){
			if(productService.addCategory(category))
				return "redirect:/AdminCategory?categoryUp";
			else
				return "redirect:/AdminCategory?categoryError";
		}
		return "redirect:/AdminCategory?categoryError";
	}
	
	@RequestMapping(value = "/orderReport", method = RequestMethod.GET)
	public HttpEntity<byte[]> getOrders(@RequestParam String fromDate, @RequestParam String toDate) {
		byte[] documentBody = productService.createOrderPDF(fromDate, toDate);
		HttpHeaders header = new HttpHeaders();
	    header.setContentType(MediaType.parseMediaType("application/pdf"));
	    header.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + System.currentTimeMillis() + ".pdf");
	    header.setContentLength(documentBody.length);
	    return new HttpEntity<byte[]>(documentBody, header);
	}
	
	
}
