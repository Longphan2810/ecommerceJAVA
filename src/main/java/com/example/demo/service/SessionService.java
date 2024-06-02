package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	@Autowired
	HttpSession session;

	public Object get(String name) {

		return session.getAttribute(name);

	}
	
	public void set(String name,Object value) {
		
		session.setAttribute(name, value);
		
	}
	
	public void remove(String name) {
		
		session.removeAttribute(name);
	}
	

}
