package com.example.demo.controller.user;

import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.DTO.UserDTO;
import com.example.demo.domain.Users;
import com.example.demo.service.impl.MailServiceImpl;
import com.example.demo.service.impl.RegisterService;
import com.example.demo.service.impl.UserServiceImpl;

import jakarta.mail.MessagingException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class RegisterController {

	@Autowired
	MailServiceImpl mailServiceImpl;
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	RegisterService registerService;
	

	@Autowired
	UserServiceImpl userServiceImpl;
	
	@GetMapping("/register-form")
	public String getlogin() {

		return "loginAndSignup";

	}

	
	@PostMapping("/register")
	public String getRegister(@Valid UserDTO userDto, BindingResult binding,Model model,
			@RequestParam("ConfirmPassword") String ConfirmPassword ) throws MessagingException {
		
		
		
		
		if(binding.hasErrors()) {
			
			model.addAttribute("signup", "s-signup");
			model.addAttribute("userDTO", userDto);
			return "loginAndSignup";
		}
		
		if(!userDto.getPassword().equals(ConfirmPassword)) {
			model.addAttribute("signup", "s-signup");
			model.addAttribute("message", "Vui lòng nhập 2 mật khẩu giống nhau !");
			model.addAttribute("userDTO", userDto);
			return "loginAndSignup";
		}
		
		
		Users userDB = userServiceImpl.findByEmail(userDto.getEmail());
		
		if(userDB!=null) {
			
			System.out.println("null");
			model.addAttribute("signup", "s-signup");
			model.addAttribute("message", "Đã tồn tại email trong hệ thống");
			model.addAttribute("userDTO", userDto);
			return "loginAndSignup";
		
		} 
		userDB = new Users();
		BeanUtils.copyProperties(userDto, userDB);
		
		registerService.setupToken(userDB);
		
		userServiceImpl.save(userDB);
		String linkCofirmAccount = this.getUrlServier()+userDB.getToken();
		mailServiceImpl.sendMaild(userDB.getEmail(),"Xác thực tài khoản",linkCofirmAccount);
		
		model.addAttribute("signup", "s-signup");
		model.addAttribute("message", "Đăng ký thành công, Vui lòng kiểm tra mail");
		return "loginAndSignup";
	}
	
	@GetMapping("/ConfirmAccount")
	public String getConfirmAcc(@RequestParam("TokenUser") String tokenUser,Model model) {
		Users userNeedConfirm = userServiceImpl.findByToken(tokenUser);
		
		if(userNeedConfirm==null) {
			
			model.addAttribute("signup", "s-signup");
			model.addAttribute("message", "Đường dẫn đã cũ, Vui lòng đăng ký lại !");
			return "forward:/register-form";
		}
		
		Date dateCurrent = new Date();
		
		if(dateCurrent.getTime()<userNeedConfirm.getTimeToken()) {
			System.out.println("ok");
			userNeedConfirm.setTimeToken(null);
			userNeedConfirm.setToken(null);
			userNeedConfirm.setStatus("active");
		} else {
			userServiceImpl.delete(userNeedConfirm);
			model.addAttribute("signup", "s-signup");
			model.addAttribute("message", "Quá thời gian xác thực, Vui lòng đăng ký lại !");
			return "forward:/register-form";
			
		}
		
		return "loginAndSignup";
	}
	

	private String getUrlServier() {

		StringBuffer URL = request.getRequestURL();
		URL.delete(URL.lastIndexOf("/"), URL.length());

		return URL.toString() + "/ConfirmAccount?TokenUser=";
	}

}
