/**
 * 
 */
package com.farmtohome.configuration;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.session.HttpSessionEventPublisher;

/**
 * @author 794162
 *
 */

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	BasicDataSource dataSource;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		
	   auth.jdbcAuthentication().dataSource(dataSource)
	  .usersByUsernameQuery(
	   "select Email as username,Password as password, true as enabled from user where Email=?")
	  .authoritiesByUsernameQuery(
	   "select Email as username, RoleName as role from user,role where user.Role = role.id and user.Email=?");
	}
	
	@Override
    protected void configure(HttpSecurity http) throws Exception { 
		
      http.authorizeRequests()
        .antMatchers("/", "/home","/Review","/List","/Contact","/Join","/register").permitAll()
        .antMatchers("/Admin").access("hasRole('ROLE_ADMIN')")
        .antMatchers("/Checkout","/Payment").access("hasRole('ROLE_USER')")
        .and()
        .csrf()
        .and()
        .exceptionHandling().accessDeniedPage("/AccessDenied");
      
      http.formLogin()
      	.loginPage("/Login")
      	.failureUrl("/Login?error")
      	.usernameParameter("ssoId")
      	.passwordParameter("password");
      
      http.logout()
      	.logoutUrl("/Logout")
      	.invalidateHttpSession(true)
      	.logoutSuccessUrl("/Login?logout")
      	.deleteCookies("JSESSIONID");
      
	  http.sessionManagement()
	  	.sessionFixation().migrateSession()
	  	.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
	  	.invalidSessionUrl("/Login?invalidSession")
	  	.maximumSessions(1)
	  	.expiredUrl("/Login?sessionExpired");
    }
	
	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
	    return new HttpSessionEventPublisher();
	}
}
