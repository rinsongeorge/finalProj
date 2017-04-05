package com.farmtohome.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class WelcomeController {
	
	private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
	
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
	public String checkoutProducts(){ 
		logger.info("Rendering Product checkout Products Page");
		return "checkout"; 	
	}
	
	@RequestMapping(value = "/Contact")
	public String contact(){ 
		logger.info("Rendering Product checkout contact Page");
		return "contact"; 	
	}
	
	@RequestMapping(value = "/Login")
	public String loginPage(){ 
		logger.info("Rendering Product checkout contact Page");
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
		return "admin"; 	
	}
	
	@RequestMapping(value = "/Payment")
	public String paymentPage(){ 
		logger.info("Rendering Product checkout Payment Page");
		return "payment"; 	
	}
	
}
