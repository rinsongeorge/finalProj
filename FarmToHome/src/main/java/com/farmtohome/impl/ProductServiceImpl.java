/**
 * 
 */
package com.farmtohome.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.farmtohome.vo.Order;
import com.farmtohome.vo.PdfOrder;
import com.farmtohome.vo.Product;
import com.farmtohome.vo.ShoppingCart;
import com.google.gson.Gson;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

/**
 * @author rinson
 *
 */

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	GenericRepository genericRepo;
	
	@Autowired
	ServletContext servletContext;
	               
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

	@Override
	public boolean checkSellerAvailability(String pinCode) {
		return genericRepo.sellerAvailabilty(pinCode);
	}

	@Override
	public boolean addProduct(Product product) {
		return genericRepo.addProduct(product);
	}

	@Override
	public boolean addCategory(Category category) {
		return genericRepo.addCategory(category);
	}

	@Override
	public byte[] createOrderPDF(String fromDate, String toDate) {
		
		try {
			String path = servletContext.getRealPath("/WEB-INF/jrxml/orderReport.jrxml");
			InputStream input = new FileInputStream(new File(path));
			JasperDesign jasperDesign = JRXmlLoader.load(input);
			JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
			
			if(!StringUtils.isEmpty(fromDate)
					&& !StringUtils.isEmpty(toDate)){
				/*SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
				Date to = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(toDate);
				Date from = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(fromDate);*/
				List<PdfOrder> orders = genericRepo.getOrders(fromDate, toDate);
				Map parameters = new HashMap();
				JRBeanCollectionDataSource jrbc = new JRBeanCollectionDataSource(orders);
				JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, jrbc);
				return JasperExportManager.exportReportToPdf(jasperPrint);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;	
		}
		return null;
	}

	@Override
	public List<String> getProductNames() {
		try{
			List<Product> products = genericRepo.getProductDetails("SELECT * FROM product");
			if(null != products && !products.isEmpty()){
				List<String> names = new ArrayList<String>();
				for(Product prod: products){
					names.add(prod.getProductName());
				}
				return names;
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

	@Override
	public Product getProductByName(String productName) {
		if(!StringUtils.isEmpty(productName)){
			try{
				return genericRepo.getProduct("SELECT * FROM product where ProductName = '"+ productName +"'");
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public boolean updateProduct(Product product) {
		return genericRepo.updateProduct(product);
	}
}
