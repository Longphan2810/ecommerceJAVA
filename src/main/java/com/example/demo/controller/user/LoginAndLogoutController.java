package com.example.demo.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Users;
import com.example.demo.service.impl.SessionService;
import com.example.demo.service.impl.UserServiceImpl;
@Controller
public class LoginAndLogoutController {
	
	
	@Autowired 
	UserServiceImpl userServiceImpl;
	
	@Autowired
	SessionService sessionService;
	
	@GetMapping("/login-form")
	public String getloginForm() {
		if(sessionService.get("userCurrent")!=null) {
			return "redirect:/";
		}
		return "loginAndSignup";

	}
	
	@GetMapping("/log-out")
	public String getlogOut() {
		sessionService.set("userCurrent",null);
		return "forward:/";

	}
	
	@PostMapping("/login")
	public String getlogin(@RequestParam("email")String email,@RequestParam("password")String pass,Model model) {
		Users userCurrent = userServiceImpl.findByEmail(email.trim());
		if(userCurrent==null) {
			
			model.addAttribute("message", "Không tồn tại account này");
			return "loginAndSignup";
			
		}
		
		if(!userCurrent.getStatus().trim().equalsIgnoreCase("active")) {
			
			model.addAttribute("message", "Tài khoản chưa được xác thực hoặc đã bị khoá bởi Admin");
			return "loginAndSignup";
			
		}
		
		if(!userCurrent.getPassword().equals(pass)) {
			
			model.addAttribute("saiPass", true);
			return "loginAndSignup";
			
		}
		
		
		sessionService.set("userCurrent", userCurrent);
		System.out.println("ok");
		
		return "redirect:/";

	}
}
