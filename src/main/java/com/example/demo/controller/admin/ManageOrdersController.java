package com.example.demo.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManageOrdersController {
	@GetMapping("/admin/orders")
	public String getAdmindonhang() {

		return "adminViews/html/QuanLyDonHang";

	}
	
	@GetMapping("/admin/list-orders")
	public String getAdmindsDonHang() {

		return "adminViews/html/DanhSachDonHang";

	}
}
