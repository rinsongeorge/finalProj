/**
 * 
 *//*
package com.farmtohome.configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import ch.qos.logback.classic.ViewStatusMessagesServlet;




*//**
 * @author 794162
 *
 *//*
public class WebDotXml implements  WebApplicationInitializer {
	
	public void onStartup(ServletContext container) throws ServletException {

		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(SpringWebConfig.class);
		ctx.setServletContext(container);
		
		ServletRegistration.Dynamic servlet = container.addServlet("dispatcher", new DispatcherServlet(ctx));
		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");	
		
	}
}
*/