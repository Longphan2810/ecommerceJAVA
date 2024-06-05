package com.example.demo.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.domain.Category;
import com.example.demo.domain.Product;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.ParamService;
import com.example.demo.service.impl.ProductServiceImpl;

@Controller
public class ProductDetailController {

	@Autowired
	ProductServiceImpl productServiceImpl;
	
	@Autowired
	CategoryServiceImpl categoryServiceImpl;
	
	@Autowired
	ParamService paramService;
	
	
	
	@GetMapping("/detail")
	public String getPageProductDetail(Model model) {
		int idProduct = paramService.getInt("idProduct", -1);
		if(productServiceImpl.existsById(idProduct)) {
			Product productDB = productServiceImpl.getById(idProduct);
			Category cate = productDB.getCategory();
			Pageable pageable = PageRequest.of(0, 6);
			List<Product> listMayLike = productServiceImpl.findAllByCategory(cate, pageable).getContent();
			
			
			model.addAttribute("listMayLike", listMayLike);
			model.addAttribute("productDB", productDB);
			return "detail";
		}
		
		return "404";
	}
	
}
