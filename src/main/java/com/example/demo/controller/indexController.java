package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {

	@GetMapping("/")
	public String getIndex() {

		return "index";

	}
	
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
	
	@GetMapping("/checkout/test1/test2/test3")
	public String getCheckout() {

		return "checkout";

	}
	@GetMapping("/chitietdon/test1/test2/test3")
	public String getchitietdon() {

		return "chiTietDonCostumer";

	}
	@GetMapping("/shop")
	public String getshop() {

		return "shop";

	}
	@GetMapping("/shop2")
	public String getshop2() {

		return "shop2";

	}
	@GetMapping("/costumer")
	public String getCostumer() {

		return "costumer";

	}
	@GetMapping("/infoCostumer")
	public String getInFoCostumer() {

		return "infoCostumer";

	}
	@GetMapping("/orderCostumer")
	public String getorderCostumer() {

		return "orderCostumer";

	}
	
	@GetMapping("/locationCostumer")
	public String getlocationCostumer() {

		return "locationCostumer";

	}
	
	@GetMapping("/locationCreateCostumer")
	public String getlocationCreateCostumer() {

		return "locationCreateCostumer";

	}
	
	
	
	@GetMapping("/changePassCostumer")
	public String getchangePassCostumer() {

		return "changePassCostumer";

	}
	
	@GetMapping("/login")
	public String getlogin() {

		return "loginAndSignup";

	}
	
	@GetMapping("/detail")
	public String getDetail() {

		return "detail";

	}
	@GetMapping("/shopCart")
	public String getShopCart() {

		return "shopingCart";

	}

}
