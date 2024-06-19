package com.example.demo.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Orders;
import com.example.demo.domain.Users;
import com.example.demo.service.impl.OrderDetailServiceImpl;
import com.example.demo.service.impl.OrderServiceImpl;
import com.example.demo.service.impl.ProductDetailServiceImpl;
import com.example.demo.service.impl.SessionService;
import com.example.demo.service.impl.UserServiceImpl;

import jakarta.persistence.criteria.Order;

@Controller
public class OrderCostumerManagerController {
	
	@Autowired
	SessionService session;

	@Autowired 
	UserServiceImpl userServiceImpl;
	
	@Autowired
	ProductDetailServiceImpl productDetailServiceImpl;

	@Autowired
	OrderServiceImpl orderServiceImpl;

	@Autowired
	OrderDetailServiceImpl orderDetailServiceImpl;

	

	@GetMapping("/orderCostumer/list")
	public String getorderCostumer(Model model, @RequestParam("p") Optional<Integer> p) {

		Users userCurrent = (Users) session.get("userCurrent");
		
		
		Pageable pageable = PageRequest.of(p.orElse(0), Integer.MAX_VALUE);
		Page<Orders> pageOrders = orderServiceImpl.findAllByUser(userCurrent, pageable);
		
		model.addAttribute("pageOrders", pageOrders);
		
		return "orderCostumer";

	}
	
	@PostMapping("/orderCostumer/chi-tiet-don")
	public String getOrderdetail(@RequestParam("idOrder") int idOrder,Model model) {
		
		Orders order = orderServiceImpl.getById(idOrder);
		
		System.out.println(order.getPhone());
		
		model.addAttribute("orderCurrent", order);
		
		return "chiTietDonCostumer";
	}
	
	@PostMapping("/orderCostumer/search")
	public String searchOrder(@RequestParam("idOrder") int idOrder,Model model) {
		
		Pageable pageable = PageRequest.of(0, Integer.MAX_VALUE);
		Page<Orders> listOrder = orderServiceImpl.findAllByIdOrder(idOrder, pageable);
		
		model.addAttribute("pageOrders", listOrder);
		
		return "orderCostumer";
	}
	
	
	
	
}
