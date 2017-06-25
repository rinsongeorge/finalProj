/**
 * 
 */
package com.farmtohome.repository;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.farmtohome.vo.CartItem;
import com.farmtohome.vo.Category;
import com.farmtohome.vo.Order;
import com.farmtohome.vo.PaymentForm;
import com.farmtohome.vo.Product;
import com.farmtohome.vo.ShoppingCart;
import com.farmtohome.vo.User;

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

	public boolean sellerAvailabilty(String pinCode) {	
		try{
			Map<String,Object> row = jdbcTemplate
					.queryForMap("SELECT user.*  FROM seller inner join user"
							+ " on seller.UserID = user.UserID where "
							+ "user.PinCode LIKE '"+ pinCode.substring(0,5) +"%'");
			if(null != row && !row.isEmpty()){
				return true;
			}
		}catch(EmptyResultDataAccessException e){
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public int createOrder(PaymentForm form, ShoppingCart shoppingCart, User user){
		
		String query1 = "SELECT max(OrderID) FROM farmtohome.order";
		
		String query = "INSERT INTO farmtohome.order(OrderDate,OrderAmount,"
						+ "OrderShipName,OrderShipAddress1,"
						+ "OrderShipAddress2,OrderCity,OrderState,OrderPinCode,"
						+ "OrderCountry,OrderPhone,OrderMobile,OrderEmail,"
						+ "Deleted,TransactionStatus,Paid,OrderUserID)"
						+ "VALUES(NOW(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			int i = jdbcTemplate.update(query, new Object[]{
					shoppingCart.getTotalAmount(),
					user.getFirstName() + " " + user.getLastName(),
					form.getAddress1(),
					form.getAddress2(),
					form.getCity(),
					"Kerala",
					form.getPincode(),
					"India",
					form.getMobile(),
					form.getMobile(),
					user.getEmail(),
					0,
					"SUCESS",
					1,
					user.getUserID()
					});
			if(i > 0){
				return jdbcTemplate.queryForObject(query1, Integer.class);	
			}
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
		return 0;
	}

	public Order getOrder(int orderId) {
		
		String query = "SELECT * FROM farmtohome.order";
		try{
			Map<String,Object> row = jdbcTemplate.queryForMap(query);
			Order order = new Order();
			if(null != row && !row.isEmpty()){
				order.setOrderID(row.get("OrderID").toString());
				order.setOrderAmount((BigDecimal) row.get("OrderAmount"));
				order.setOrderDate(row.get("OrderDate").toString());
				return order;
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public void insertCarts(CartItem cart, int userId) {
		
		int sellerId = getSellerId(cart.getPinCode());
		cart.setSellerId(sellerId);
		
		String query = "INSERT INTO cart (DateCreated, Deleted, Qty, ProductID, SellerID, UserID) "
					  	+ "values(NOW(),0,?,?,?,?)";
		try{
			jdbcTemplate.update(query, new Object[]{
					cart.getQty(),
					cart.getProductId(),
					sellerId,
					userId
			});
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	private int getSellerId(String pinCode) {
		try{
			Map<String,Object> row = jdbcTemplate
					.queryForMap("SELECT seller.*  FROM seller inner join user"
							+ " on seller.UserID = user.UserID where "
							+ "user.PinCode LIKE '"+ pinCode.substring(0,5) +"%'");
			if(null != row && !row.isEmpty()){
				return (Integer) row.get("SellerID");
			}
		}catch(EmptyResultDataAccessException e){
			e.printStackTrace();
			return 0;
		}
		return 0;
	}

	public void addOrderDetails(CartItem cartItem, Order order) {
		if(null != cartItem
				&& null != order){
			
			String query = "Insert into orderdetails (DetailPrice, DetailQuantity, Total, ProductID,SellerID, OrderID)"
					+ "values(?,?,?,?,?,?)";
			BigDecimal total = new BigDecimal(cartItem.getProduct().getProductUnitPrice())
					.multiply(new BigDecimal(cartItem.getQty()));
			try{
				jdbcTemplate.update(query, new Object[]{
						cartItem.getProduct().getProductUnitPrice(),
						cartItem.getQty(),
						total,
						cartItem.getProductId(),
						cartItem.getSellerId(),
						order.getOrderID()
				});
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	public boolean addPaymentDetails(PaymentForm form, Order order) {
		String query = "Insert into paymentdetails(PaymentMode,CreditCardExpMonth,CreditCardExpYear"
				+ ",CreditCardNumber,OrderID,NameOnCard)values(?,?,?,?,?,?)";
		try{
			jdbcTemplate.update(query, new Object[]{
					"CC",
					form.getExpiryDate(),
					form.getExpiryDate(),
					form.getCreditCardNumber(),
					order.getOrderID(),
					form.getNameOnCard(),
			});
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
