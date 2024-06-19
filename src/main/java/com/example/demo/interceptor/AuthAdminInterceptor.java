package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.domain.Users;
import com.example.demo.service.impl.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Component
public class AuthAdminInterceptor implements HandlerInterceptor {

	
	@Autowired
	SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		Users userCurrent = (Users) session.get("userCurrent");
		
		if(userCurrent==null) {

			response.sendRedirect("/admin-loginForm");
			return false;
		}
		if(!userCurrent.isRole()) {
			
			response.sendRedirect("/admin-loginForm");
			return false;
			}
		
		
		return true;
		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}
