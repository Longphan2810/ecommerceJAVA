package com.example.demo.interceptor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Category;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.ShopCartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class GlobalInterceptor implements HandlerInterceptor {

	@Autowired
	CategoryServiceImpl categoryServiceImpl;
	@Autowired
	ShopCartService shopCartService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		List<Category> listCate = categoryServiceImpl.findAll();
		
		request.getSession().setAttribute("sizeCart", shopCartService.size());
		
		request.setAttribute("listCate", listCate);
		
	}
	
}
