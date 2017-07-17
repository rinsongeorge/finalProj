package com.farmtohome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmtohome.service.PaymentService;
import com.farmtohome.service.ProductService;
import com.farmtohome.service.UserService;
import com.farmtohome.vo.Category;
import com.farmtohome.vo.Order;
import com.farmtohome.vo.OrderDetails;
import com.farmtohome.vo.ShoppingCart;
import com.farmtohome.vo.TestVo;
import com.farmtohome.vo.User;



@Controller
public class WelcomeController {
	
	private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HttpServletRequest httpServletRequest;
	
	@Autowired
	PaymentService paymentService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/")
	public String welcomePage(){ 
		logger.info("Rendering Welcome Page");
		return "index"; 
	}
	
	@RequestMapping(value = "/Review")
	public String productReviewPage(){ 
		logger.info("Rendering Product Review Page");
		return "single"; 	
	}
	
	@RequestMapping(value = "/List")
	public String products(){ 
		logger.info("Rendering Product Products Page");
		return "products"; 	
	}
	
	@RequestMapping(value = "/Checkout")
	public String checkoutProducts(ModelMap model, Principal principal,HttpServletRequest request){
		logger.info("Rendering Product checkout Products Page");
		String userId = principal.getName(); 
		User user = userService.getUser(userId);
		request.getSession().setAttribute("userDetails", user);
		ShoppingCart shoppingCart = (ShoppingCart) servletContext.getAttribute("shoppingCart");	
		request.getSession().setAttribute("sessionShoppingCart", shoppingCart);
	    model.addAttribute("username", userId);
		return "checkout"; 	
	}
	
	@RequestMapping(value = "/Contact")
	public String contact(){ 
		logger.info("Rendering Product checkout contact Page");
		return "contact"; 	
	}
	
	@RequestMapping(value = "/Login")
	public String loginPage(ModelMap model){ 
		logger.info("Rendering Product checkout contact Page");
		if(null != httpServletRequest.getParameter("error")){
			model.put("loginMsg", "Invalid username or password");
		}
		if(null != httpServletRequest.getParameter("logout")){
			model.put("loginMsg", "Successfully logged out");
		}
		if(null != httpServletRequest.getParameter("sessionExpired")){
			model.put("loginMsg", "Session has expired");
		}
		return "login"; 	
	}
	
	@RequestMapping(value = "/Join")
	public String registerPage(){ 
		logger.info("Rendering Product checkout Register Page");
		return "register"; 	
	}
	
	@RequestMapping(value = "/Admin")
	public String adminPage(){ 
		logger.info("Rendering Product checkout Admin Page");
		List<Category> categories = productService.getCategory();	
		servletContext.setAttribute("categories", categories);
		return "admin"; 	
	}
	
	@RequestMapping(value = "/Payment")
	public String paymentPage(){ 
		logger.info("Rendering Product checkout Payment Page");
		return "payment"; 	
	}
	
	@RequestMapping(value = "/	")
	public String confirmationPage(){ 
		logger.info("Rendering Product checkout Payment Page");
		return "payment"; 	
	}
	
	@RequestMapping(value = "/AccessDenied")
	public String test(){
		logger.info("Rendering Product Review Page");
		return "accessDenied"; 	
	}
	
	@RequestMapping(value = "/jack")
	@ResponseBody
	public TestVo testV(){
		TestVo t = new TestVo("Rinson", "George", "Kulangara");
		return t; 	
	}
	
	@RequestMapping(value = "/Confirmation")
	public String confirmation(){
		logger.info("Rendering Product confirmation Page");
		return "confirmation"; 	
	}
	
	@RequestMapping(value = "/Account")
	public String account(Principal principal){
		logger.info("Rendering Product account Page");
		String userId = principal.getName(); 
		User user = userService.getUser(userId);
		httpServletRequest.getSession().setAttribute("userDetails", user);
		List<Order> orders = paymentService.getUserOrders(user.getUserID());
		httpServletRequest.getSession().setAttribute("orders", orders);
		return "account"; 	
	}

	@RequestMapping(value = "/Order")
	public String order(@RequestParam String orderId, ModelMap model){
		logger.info("Rendering Product order Page");
		System.out.println("orderId" + orderId);
		List<OrderDetails> details = paymentService.getOrderDetails(orderId);
		model.put("OrderDetails", details);
		model.put("orderId", orderId);
		System.out.println("details" + details);
		return "order"; 	
	}
	
}
