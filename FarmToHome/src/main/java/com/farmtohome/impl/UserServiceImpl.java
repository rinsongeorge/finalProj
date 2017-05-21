/**
 * 
 */
package com.farmtohome.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmtohome.repository.UserRepository;
import com.farmtohome.service.UserService;
import com.farmtohome.vo.RegistrationForm;
import com.farmtohome.vo.User;

/**
 * @author rinson
 *
 */

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepo;
	
	@Override
	public String addUser(RegistrationForm registrationForm) {
		try{
			boolean isUserExist = userRepo.checkUserExist(registrationForm.getEmail());
			if(!isUserExist){
				boolean added = userRepo.insertUser(registrationForm);
				if(added) return "added";
			}else{
				return "user_exist";
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return "error";
	}

	@Override
	public User getUser(String email) {
		try{
			String query = "select * from user where Email='"+ email +"'";
			return userRepo.getUserDetails(query);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return null;
	}

}
