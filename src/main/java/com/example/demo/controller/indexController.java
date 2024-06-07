package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.domain.DeliveryAddress;

@Controller
public class indexController {

	
	
	@GetMapping("/admin")
	public String getAdmin() {

		return "adminViews/html/QuanLySanPham";

	}
		
	
	
	@GetMapping("/admin/canhan")
	public String getAdmincanhan() {

		return "adminViews/html/QuanLyCaNhan";

	}
	

	
	

	
	@GetMapping("/admin/login")
	public String getAdminLogin() {

		return "adminViews/html/loginAdmin";

	}
	
	
	@GetMapping("/chitietdon/test1/test2/test3")
	public String getchitietdon() {

		return "chiTietDonCostumer";

	}

	@GetMapping("/costumer")
	public String getCostumer() {

		return "costumer";

	}
	
	@GetMapping("/orderCostumer")
	public String getorderCostumer() {

		return "orderCostumer";

	}
	
	

	
	
	
	@GetMapping("/changePassCostumer")
	public String getchangePassCostumer() {

		
		
		return "changePassCostumer";

	}
	
	
	
	

}
