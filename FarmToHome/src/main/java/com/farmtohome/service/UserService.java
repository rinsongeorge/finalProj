package com.farmtohome.service;

import com.farmtohome.vo.RegistrationForm;
import com.farmtohome.vo.User;

public interface UserService {

	public String addUser(RegistrationForm registrationForm);
	
	public User getUser(String email);
}
