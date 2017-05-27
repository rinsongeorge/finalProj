/**
 * 
 */
package com.farmtohome.configuration;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * @author rinson
 *
 */

@Component
@WebListener
public class WebSessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("Session created : " + event.getSession().getId());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(null != auth){
			System.out.println("Session owner : " + auth.getName());
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		System.out.println("Session destroyed : " + event.getSession().getId());
	}
	
}
