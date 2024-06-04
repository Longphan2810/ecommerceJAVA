package com.example.demo.controller.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.domain.Category;
import com.example.demo.domain.Product;
import com.example.demo.service.SessionService;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.ProductServiceImpl;

@Controller
public class shopController {

	@Autowired
	CategoryServiceImpl categoryServiceImpl;

	@Autowired
	ProductServiceImpl productServiceImpl;

	@Autowired
	SessionService session;

	@GetMapping("/shop")
	public String getShopPage(Model model) {

		Pageable page = PageRequest.of(0, 9);

		Page<Product> listProduct = productServiceImpl.findAll(page);
		session.set("categoryCurrent", null);

		model.addAttribute("listProduct", listProduct);
		return "shop";

	}

	@GetMapping("/shop/{category}")
	public String getShopByCategory(Model model, @PathVariable("category") String cateName) {

		Category cate = categoryServiceImpl.findByNameLike(cateName);

		Pageable page = PageRequest.of(0, 9);

		Page<Product> listProduct = productServiceImpl.findAllByCategory(cate, page);

		session.set("categoryCurrent", cate);

		model.addAttribute("listProduct", listProduct);

		return "shop";

	}

	@GetMapping("/shop/{category}/filter")
	public String getShopByCategoryAndFilter(Model model, @PathVariable("category") String cateName,
			@RequestParam("p") Optional<Integer> p, @RequestParam("sortBy") Optional<String> sortBy,
			@RequestParam("filterByPrice") Optional<String> filterByPrice) {

		Direction direc = null;
		String nameSortBy = sortBy.orElse("price low to high");

		switch (nameSortBy) {
		case "price low to high": {
			nameSortBy = "price low to high";
			direc = Direction.ASC;
			break;
		}
		case "price high to low": {
			nameSortBy = "price high to low";
			direc = Direction.DESC;
			break;
		}
		default: {
			nameSortBy = "price low to high";
			direc = Direction.ASC;
			break;
		}
		}

		float minPrice = Float.MIN_VALUE;
		float maxPrice = Float.MAX_VALUE;

		switch (filterByPrice.orElse("all")) {
		case "50": {
			minPrice = 0;
			maxPrice = 50000;
			break;
		}

		case "100": {
			minPrice = 50000;
			maxPrice = 100000;
			break;
		}

		case "200": {
			minPrice = 100000;
			maxPrice = 200000;
			break;
		}
		case "200+": {
			minPrice = 200000;
			maxPrice = Float.MAX_VALUE;
			break;
		}
		default: {
			minPrice = Float.MIN_VALUE;
			maxPrice = Float.MAX_VALUE;
			break;
		}

		}

		Sort sort = Sort.by(direc, "price");

		Pageable page = PageRequest.of(p.orElse(0), 9, sort);

		Category cate = categoryServiceImpl.findByNameLike(cateName);

		Page<Product> listProduct = productServiceImpl.findAllByCategoryAndPriceBetween(cate, minPrice, maxPrice, page);

		listProduct.and(listProduct);

		for (Product product : listProduct) {
			System.out.println(product.getName());
		}

		model.addAttribute("filterByPrice", filterByPrice.orElse("all"));
		model.addAttribute("sortCurrent", nameSortBy);
		model.addAttribute("listProduct", listProduct);

		return "shop";

	}

	@GetMapping("/shop/filter")
	public String getShopAndFilter(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam("sortBy") Optional<String> sortBy,@RequestParam("keywords") Optional<String> keywords,
			@RequestParam("filterByPrice") Optional<String> filterByPrice) {

		Direction direc = null;
		
		Page<Product> listProduct = null;

		String nameSortBy = sortBy.orElse("price low to high");
		String keywordsSearch = keywords.orElse("");

		switch (nameSortBy) {
		case "price low to high": {
			nameSortBy = "price low to high";
			direc = Direction.ASC;
			break;
		}
		case "price high to low": {
			nameSortBy = "price high to low";
			direc = Direction.DESC;
			break;
		}
		default: {
			nameSortBy = "price low to high";
			direc = Direction.ASC;
			break;
		}
		}

		float minPrice = Float.MIN_VALUE;
		float maxPrice = Float.MAX_VALUE;

		switch (filterByPrice.orElse("all")) {
		case "50": {
			minPrice = 0;
			maxPrice = 50000;
			break;
		}

		case "100": {
			minPrice = 50000;
			maxPrice = 100000;
			break;
		}

		case "200": {
			minPrice = 100000;
			maxPrice = 200000;
			break;
		}
		case "200+": {
			minPrice = 200000;
			maxPrice = Float.MAX_VALUE;
			break;
		}

		default: {
			minPrice = Float.MIN_VALUE;
			maxPrice = Float.MAX_VALUE;
			break;
		}

		}
		

		Sort sort = Sort.by(direc, "price");

		Pageable page = PageRequest.of(p.orElse(0), 9, sort);

		
		if(keywordsSearch.trim().equalsIgnoreCase("")) {
		// get page without  keyword
		listProduct = productServiceImpl.findAllByPriceBetween(minPrice, maxPrice, page);
		
		} else {
		 listProduct = productServiceImpl.findAllByPriceBetweenAndNameLike(minPrice, maxPrice, "%"+keywordsSearch+"%", page);
		}
		model.addAttribute("filterByPrice", filterByPrice.orElse("all"));
		model.addAttribute("sortCurrent", nameSortBy);
		model.addAttribute("keywords", keywordsSearch);
		model.addAttribute("listProduct", listProduct);

		return "shop";

	}

	@RequestMapping("shop/test")
	@ResponseBody
	public String test() {
		Pageable page = PageRequest.of(0, 10, Sort.by(Direction.DESC, "price"));

		Page<Product> listProduct = productServiceImpl.findAllByPriceBetween(50000, 100000, page);
		Page<Product> listProduct2 = productServiceImpl.findAllByPriceBetween(100000, 200000, page);
		List<Product> tempList = new ArrayList<>(listProduct.getContent());
		List<Product> tempList2 = listProduct2.getContent();

		for (Product product : tempList2) {
			Product p = product;
			tempList.add(p);

		}

		Collections.sort(tempList, new Comparator<Product>() {
			public int compare(Product o1, Product o2) {
				if (o1.getPrice() > o2.getPrice()) {
					return -1;
				} else if (o1.getPrice() < o2.getPrice()) {

					return 1;

				} else {
					return 0;
				}
			};
		});

		Page<Product> temp = new PageImpl<>(tempList, page, tempList.size());

		System.out.println("total :" + temp.getTotalElements());

		System.out.println("-------------------------------");
		for (Product product : temp) {

			System.out.println(product.getName() + "Price : " + product.getPrice());
		}

		return "";
	}

}
