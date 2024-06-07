package com.example.demo.controller.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DTO.UserDTO;
import com.example.demo.domain.Users;
import com.example.demo.service.impl.ParamService;
import com.example.demo.service.impl.SessionService;
import com.example.demo.service.impl.UserServiceImpl;

@Controller
public class InfoUserController {

	@Autowired
	SessionService session;
	
	@Autowired
	ParamService paramService;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@GetMapping("/infoCostumer")
	public String getInFoCostumer() {

		return "infoCostumer";

	}
	
	@PostMapping("/infoCostumer/update")
	public String updateInfo(Users user ,Model model,@RequestParam("birhdayYet") String birthday) throws ParseException {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy-MM-dd");
		
		Users userCurrent = (Users) session.get("userCurrent");
		
	
		
		userCurrent.setBirhday(sdf.parse(birthday));
		userCurrent.setName(user.getName());
		userCurrent.setLocation(user.getLocation());
		userCurrent.setGender(user.getGender());
		userCurrent.setPhone(user.getPhone());
		
		
		
		userServiceImpl.save(userCurrent);
		
		session.set("userCurrent", userCurrent);
		
		
		return "infoCostumer";

	}
	
	@RequestMapping("/infoCostumer/password")
	public String getPageChangePassForm() {
		
		return "changePassCostumer";
	}
	
	@PostMapping("/infoCostumer/Change-password")
	public String PageChangePass(Model model) {
		
		Users userCurrent = (Users) session.get("userCurrent");
		String password = paramService.getString("password", "").trim();
		String passswordNew = paramService.getString("passswordNew", "").trim();
		String passwordConfirm = paramService.getString("passwordConfirm", "").trim();
		
		
		if(!password.trim().equals(userCurrent.getPassword())) {
			
			model.addAttribute("message", "Vui lòng nhập đúng mật khẩu hiện tại !");
			return "changePassCostumer";
		}
		
		if(!passswordNew.equals(passwordConfirm)) {
			
			model.addAttribute("message", "Mật khẩu mới và Nhập lại mật khẩu mới phải giống nhau !");
			return "changePassCostumer";
		}
		
		userCurrent.setPassword(passwordConfirm);
		
		userServiceImpl.save(userCurrent);
		
		session.set("userCurrent", userCurrent);
		
		
		model.addAttribute("message", "Đã thay đổi mật khẩu !");
		return "changePassCostumer";
	}
	
}
