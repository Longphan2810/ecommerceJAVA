package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.demo.interceptor.AuthUserInterceptor;
import com.example.demo.interceptor.GlobalInterceptor;

@Configuration
public class interConfig implements WebMvcConfigurer {

	@Autowired
	GlobalInterceptor globalInterceptor;
	
	@Autowired
	AuthUserInterceptor authUserInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		
		registry.addInterceptor(globalInterceptor).addPathPatterns("/**","/shopCart/*");
		registry.addInterceptor(authUserInterceptor).addPathPatterns("/locationCostumer/*","/checkout","/checkout/*","/infoCostumer"
				,"/infoCostumer/*","/create-order","/orderCostumer/*","/addToCard","/shopCart","/shopCart/*");
		
	}
	
}
