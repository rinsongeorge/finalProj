/**
 * 
 */
package com.farmtohome.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.farmtohome.vo.RegistrationForm;
import com.farmtohome.vo.User;


/**
 * @author rinson
 *
 */
@Repository("userRepo")
public class UserRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public User getUserDetails(String query) {
		if(!StringUtils.isEmpty(query)){
			User user = new User();
			Map<String,Object> row = jdbcTemplate.queryForMap(query);
			if(null != row && !row.isEmpty()){					
				user.setUserID((Integer) row.get("UserID"));
				user.setFirstName((String) row.get("FirstName"));
				user.setLastName((String) row.get("LastName"));
				user.setAddress1((String) row.get("Address1"));
				user.setAddress2((String) row.get("Address2"));
				user.setCity((String) row.get("City"));
				user.setState((String) row.get("State"));
				user.setCountry((String) row.get("Country"));
				user.setPinCode((String) row.get("PinCode"));
				user.setPhone((String) row.get("Phone"));
				user.setMobile((String) row.get("Mobile"));
				user.setEmail((String) row.get("Email"));
				user.setPassword((String) row.get("Password"));
				user.setUserIP((String) row.get("UserIP"));
				user.setRole(String.valueOf(row.get("Role")));
			}
			return user;
		}
		return null;
	}

	public boolean checkUserExist(String email) {
		String query = "select * from user where Email='"+ email +"'";
		List list = jdbcTemplate.queryForList(query);
		if(!list.isEmpty()){
			return true;
		}
		return false;
	}

	public boolean insertUser(RegistrationForm registrationForm) {
		String query = "Insert into user (FirstName,LastName,Email,Password,DateCreated,Role) values(?,?,?,?,NOW(),1)";
		int i = jdbcTemplate.update(query, new Object[]{
					registrationForm.getFirstName(),
					registrationForm.getLastName(),
					registrationForm.getEmail(),
					registrationForm.getPassword()
				});
		if(i > 0){
			return true;
		}
		return false;
	}
}
