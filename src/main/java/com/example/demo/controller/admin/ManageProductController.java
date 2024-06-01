package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ManageProductController {
	
	@GetMapping("/admin/product")
	public String getAdminSanPham() {

		return "adminViews/html/QuanLySanPham";

	}
	
	@GetMapping("/admin/list-product")
	public String getAdmindsSanPham() {

		return "adminViews/html/DanhSachSanPham";

	}
	
}
