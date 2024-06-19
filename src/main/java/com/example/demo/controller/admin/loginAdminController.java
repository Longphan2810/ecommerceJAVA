package com.example.demo.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Users;
import com.example.demo.service.impl.SessionService;
import com.example.demo.service.impl.UserServiceImpl;

@Controller
public class loginAdminController {

	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	SessionService session;
	
	@RequestMapping("admin-loginForm")
	public String loginForm() {
	
		
		
		return "adminViews/html/loginAdmin";
	}
	
	@GetMapping("admin-logout")
	public String logout() {
		session.set("userCurrent", null);
		
		return "redirect:/admin-loginForm";
	}
	
	@PostMapping("admin-login")
	public String login(@RequestParam("email") String email,@RequestParam("password") String pass,Model model) {
	
		Users user = userServiceImpl.findByEmail(email);
		
		if(user==null) {
			
			
			model.addAttribute("message", "");
			return "adminViews/html/loginAdmin";
		}
		if(!user.isRole()) {
			model.addAttribute("message", "");
			return "adminViews/html/loginAdmin";		
		}
		
		session.set("userCurrent", user);
		
		System.out.println("====================================");
		return "redirect:/admin";
	}
	
}
