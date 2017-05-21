/**
 * 
 */
package com.farmtohome.configuration;

import java.util.Date;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.security.web.session.HttpSessionCreatedEvent;
import org.springframework.security.web.session.HttpSessionDestroyedEvent;
import org.springframework.stereotype.Component;

/**
 * @author rinson
 *
 */


public class WebSessionListener implements ApplicationListener<HttpSessionCreatedEvent>{

	@Override
	public void onApplicationEvent(HttpSessionCreatedEvent event) {
		
		System.out.println("--------------Session Created-----------");
	}
}