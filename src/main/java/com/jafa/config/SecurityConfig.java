package com.jafa.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import lombok.extern.log4j.Log4j;

@Configuration
@EnableWebSecurity
@Log4j
@ComponentScan("com.jafa") // 자동스캔지정
@EnableGlobalMethodSecurity(prePostEnabled = true,securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	AccessDeniedHandler accessDeniedHandler;
	
	@Autowired
	AuthenticationFailureHandler authenticationFailureHandler;
	
	@Autowired
	AuthenticationSuccessHandler authenticationSuccessHandler;
	
	@Autowired
	LogoutSuccessHandler logoutSuccessHandler;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Autowired
	DataSource dataSource;
	
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//		http.authorizeRequests()
//			.antMatchers("/member/all").access("permitAll")
//			.antMatchers("/member/myPage")
//				.access("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
//			.antMatchers("/member/admin")
//				.access("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')");
        http.formLogin() // /login으로 요청하면 스프링시큐리티가 제공하는 로그인 페이지로 이동
			.loginPage("/member/login") // 로그인 페이지 
			.loginProcessingUrl("/member/login") // 로그인 처리 
			.usernameParameter("loginId") // 아이디 name값
			.passwordParameter("loginPwd") // 비밀번호 name 값
			.failureHandler(authenticationFailureHandler) // 로그인 실패 핸들러
			.successHandler(authenticationSuccessHandler); // 로그인 성공 핸들러 
		http.logout()
			.invalidateHttpSession(true) 
			.logoutUrl("/member/logout") // 로그아웃 처리 URL 
	//		.logoutSuccessUrl("/"); // 로그아웃 성공시 요청 URL
			.logoutSuccessHandler(logoutSuccessHandler) // 로그아웃 성공 핸들러
			.deleteCookies("remember-me","JSESSION_ID");
        
        http.exceptionHandling()
        	.accessDeniedHandler(accessDeniedHandler);
        
		http.rememberMe()
			.key("leekwanghyup") // 인증받은 사용자의 정보로 token을 생성하는데 사용되는 임의의 key값 설정 
			.tokenRepository(persistentTokenRepository())
			.rememberMeParameter("remember-me") // 자동로그인 체크박스의 name속성 지정 : 기본값
			.tokenValiditySeconds(86400); // token만료시간 설정
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {		
		auth.userDetailsService(userDetailsService)
			.passwordEncoder(passwordEncoder());
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl jdbcTokenRepository =  new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
	}
	
	

}
