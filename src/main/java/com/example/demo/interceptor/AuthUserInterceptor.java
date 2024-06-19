package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.domain.Users;
import com.example.demo.service.impl.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthUserInterceptor implements HandlerInterceptor {

	@Autowired
	SessionService session;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		Users userCurrent = (Users) session.get("userCurrent");

		if (userCurrent == null) {

			response.sendRedirect("/login-form");
			return false;
		}
		if (userCurrent.isRole()) {
			session.set("userCurrent",null);
			
			response.sendRedirect("/login-form");

			return false;
		}

		return true;
	}

}
