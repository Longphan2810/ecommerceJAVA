package com.example.demo.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.demo.domain.Product;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.ProductServiceImpl;
@Controller
public class HomeController {
	
	
	@Autowired
	CategoryServiceImpl categoryServiceImpl;
	
	@Autowired
	ProductServiceImpl  productServiceImpl;
	
	
	
	@ModelAttribute("listProduct")
	public List<Product> getListProduct(){
		
		Pageable pageable = PageRequest.of(0, 9);
		
		
		
		return productServiceImpl.findAll(pageable).getContent();
	}
	
	
	
	@GetMapping("/")
	public String getIndex() {

		return "index";

	}
	
	
}
