package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.domain.Users;
import com.example.demo.service.impl.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AuthAdminInterceptor implements HandlerInterceptor {

	
	@Autowired
	SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		Users userCurrent = (Users) session.get("userCurrent");
		
		boolean check = true;
		if(userCurrent==null) {
			check = false;
		}
		if(!userCurrent.isRole()) {
			check = false;
		}
		
		if(check==false) {
			request.getRequestDispatcher("/login-form").forward(request, response);
		}
		return check;
		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
}
