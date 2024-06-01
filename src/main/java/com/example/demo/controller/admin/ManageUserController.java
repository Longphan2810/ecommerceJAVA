package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManageUserController {

	@GetMapping("/admin/list-user")
	public String getAdmindsNguoiDung() {

		return "adminViews/html/DanhSachNguoiDung";

	}
	
	@GetMapping("/admin/user")
	public String getAdminnguoidung() {

		return "adminViews/html/QuanLyNguoiDung";

	}
	
}
