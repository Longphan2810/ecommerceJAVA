package com.example.demo.controller.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Users;
import com.example.demo.service.impl.ParamService;
import com.example.demo.service.impl.UserServiceImpl;

@Controller
public class ManageUserController {

	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	ParamService paramService;
	
	@RequestMapping("/admin/list-user")
	public String getAdmindsNguoiDung(Model model,@RequestParam("p") Optional<Integer> p) {

		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Users> page = userServiceImpl.findAll(pageable);
		
		String keywordName = paramService.getString("keywordName", "");
		String keywordEmail = paramService.getString("keywordEmail", "");
		
		if(keywordEmail.trim().equals("")||keywordName.trim().equals("")) {
			
			return "forward:/admin/list-user/findByKeyWord";
		}

		System.out.println("keyName"+keywordName);
		System.out.println("keyEmail"+keywordEmail);
		
		
		model.addAttribute("pageUsers", page);
		
		return "adminViews/html/DanhSachNguoiDung";
		

	}
	
	@RequestMapping("/admin/list-user/findByKeyWord")
	public String getListUserByKeyword(Model model,@RequestParam("p") Optional<Integer> p) {

		String keywordName = paramService.getString("keywordName", "");
		String keywordEmail = paramService.getString("keywordEmail", "");
		
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		Page<Users> page = userServiceImpl.findAllByNameLikeAndEmailLike("%"+keywordName+"%", "%"+keywordEmail+"%", pageable);
		
		
		model.addAttribute("keywordName", keywordName);
		model.addAttribute("keywordEmail", keywordEmail);
		model.addAttribute("pageUsers", page);
		
		return "adminViews/html/DanhSachNguoiDung";

	}
	
	
	
	
	
	@RequestMapping("/admin/user")
	public String getAdminnguoidung() {

		return "adminViews/html/QuanLyNguoiDung";

	}
	
	@PostMapping("/admin/user/edit/{id}")
	public String editUser(@PathVariable("id") int idUser,Model model) {
		Users userDB = userServiceImpl.getById(idUser);
		
		model.addAttribute("userDB", userDB);
		model.addAttribute("pageCurrentAdmin", "QLND");
		return "adminViews/html/QuanLyNguoiDung";
	}
	
	@PostMapping("/admin/user/update")
	public String updateUser(Model model) {
		
		int idUser = paramService.getInt("IdUserDB", -1);
		String statusUser = paramService.getString("statusUser", "");
		boolean roleUser = paramService.getBoolean("role", false);
		
		if(!userServiceImpl.existsById(idUser)) {
			model.addAttribute("message", "Vui lòng chọn user cần sửa bên danh sách user !");
			return "adminViews/html/QuanLyNguoiDung";
			
		} 
		
		Users userUpdate = userServiceImpl.getById(idUser);
		userUpdate.setStatus(statusUser);
		userUpdate.setRole(roleUser);
		
		userServiceImpl.save(userUpdate);
		
		model.addAttribute("message", "Đã lưu thông tin !");
		model.addAttribute("userDB", userUpdate);
		
		return "adminViews/html/QuanLyNguoiDung";
	}
	
}
