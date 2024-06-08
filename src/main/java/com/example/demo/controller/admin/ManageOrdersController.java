package com.example.demo.controller.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Orders;
import com.example.demo.service.impl.OrderServiceImpl;
import com.example.demo.service.impl.ParamService;

@Controller
public class ManageOrdersController {
	
	
	@Autowired
	OrderServiceImpl orderServiceImpl;
	
	@Autowired
	ParamService paramService;
	
	
	@GetMapping("/admin/orders")
	public String getAdmindonhang(Model model, @RequestParam("idOrder") int idOrder) {
		
		Orders order = orderServiceImpl.getById(idOrder);
		
		model.addAttribute("order", order);
		
		return "adminViews/html/QuanLyDonHang";

	}
	
	@GetMapping("/admin/orders/update")
	public String getAdmindonhangUpdate(Model model, @RequestParam("idOrder") int idOrder,@RequestParam("status") String status) {
		
		Orders order = orderServiceImpl.getById(idOrder);
		order.setStatus(status);
		System.out.println("============================= ");
		System.out.println(order.getStatus());
		orderServiceImpl.save(order);
		System.out.println("============================= ");
		model.addAttribute("order", order);
		
		return "adminViews/html/QuanLyDonHang";

	}
	
	@GetMapping("/admin/list-orders")
	public String getAdmindsDonHang(Model model,@RequestParam("p") Optional<Integer> p) {
		
		Pageable pageable = PageRequest.of(p.orElse(0), 25);
		
		int keyword = paramService.getInt("keyword", -1);
		Page<Orders> pageOrder;
		if(keyword<0) {
			 pageOrder = orderServiceImpl.findAll(pageable);
		} else {
			
			pageOrder = orderServiceImpl.findAllByIdOrder(keyword, pageable);
		}
		
		
		
		model.addAttribute("pageOrder", pageOrder);
		
		return "adminViews/html/DanhSachDonHang";

	}
	
	
	
}
