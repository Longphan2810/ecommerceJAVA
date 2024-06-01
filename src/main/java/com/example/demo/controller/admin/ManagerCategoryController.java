package com.example.demo.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DTO.CategoryDTO;
import com.example.demo.domain.Category;
import com.example.demo.repository.CategoryRepository;
import com.example.demo.service.impl.CategoryServiceImpl;

import jakarta.validation.Valid;

@Controller
public class ManagerCategoryController {

	@Autowired
	CategoryServiceImpl categoryServiceImpl;
	@Autowired
	CategoryRepository categoryRepository;

	@RequestMapping("admin/category")
	public String getPageManager(Model model) {

		List<Category> listCate = categoryServiceImpl.findAll();

		model.addAttribute("listCategory", listCate);

		return "adminViews/html/QuanLyCategory";
	}

	@PostMapping("admin/category/add")
	public String addCategory(Model model, @Validated @ModelAttribute("category") CategoryDTO categoryDTO,
			BindingResult bindingResult) {
		// TODO: process POST request

		if (bindingResult.hasErrors()) {
			System.out.println("Loi");
			System.out.println(bindingResult.toString());
			return "forward:/admin/category";

		}
		// handle null and convert null to -1
		int counterNullId = categoryDTO.getIdCategory() == null ? -1 : categoryDTO.getIdCategory();
		categoryDTO.setIdCategory(counterNullId);

		Category cateDB = new Category();

		// handle error exists category with id input
		if (categoryDTO.getIdCategory() > 0) {
			Category cateDBTemp = categoryServiceImpl.getById(categoryDTO.getIdCategory());
			if (cateDBTemp != null) {
				model.addAttribute("message", "ID hoặc tên này đã tồn tại !");
				model.addAttribute("category", null);
				return "forward:/admin/category";
			}
		}

		BeanUtils.copyProperties(categoryDTO, cateDB);

		// handle error duplicate name
		try {
			categoryServiceImpl.save(cateDB);
			model.addAttribute("message", "Đã lưu thông tin !");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message", "Tên này đã tồn tại !");
		}

		model.addAttribute("category", null);

		return "forward:/admin/category";
	}

	@RequestMapping("admin/category/edit/{idCate}")
	public String editCategory(Model model, @PathVariable("idCate") int idCate) {

		Category cateDB = categoryServiceImpl.getById(idCate);

		CategoryDTO cateDTO = new CategoryDTO();

		BeanUtils.copyProperties(cateDB, cateDTO);

		model.addAttribute("category", cateDTO);

		return "forward:/admin/category";
	}

	@PostMapping("admin/category/saveOrUpdate")
	public String saveOrUpdateCategory(@Valid @ModelAttribute("category") CategoryDTO categoryDTO,
			BindingResult bindingResult, Model model) {
		// TODO: process POST request

		if (bindingResult.hasErrors()) {
			System.out.println("Loi");
			System.out.println(bindingResult.toString());
			return "forward:/admin/category";

		}
		// handle null and convert null to -1
		int counterNullId = categoryDTO.getIdCategory() == null ? -1 : categoryDTO.getIdCategory();
		categoryDTO.setIdCategory(counterNullId);

		Category cateDB = new Category();

		BeanUtils.copyProperties(categoryDTO, cateDB);

		// handle error duplicate name
		try {
			categoryServiceImpl.save(cateDB);
			model.addAttribute("message", "Đã lưu thông tin !");
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message", "Tên này đã tồn tại !");
		}

		model.addAttribute("category", null);

		return "forward:/admin/category";

	}

	@PostMapping("admin/category/delete")
	public String deleteCategory(@ModelAttribute("category") CategoryDTO categoryDTO, Model model) {
		// TODO: process POST request

		Category cateDB = categoryServiceImpl.getById(categoryDTO.getIdCategory());

		if (cateDB == null) {
			model.addAttribute("message", "Không tìm thấy ID này để xoá !");
		} else {
			model.addAttribute("category", null);
			categoryServiceImpl.delete(cateDB);
			model.addAttribute("message", "Đã xoá thành công !");
		}

		return "forward:/admin/category";
	}

	@RequestMapping("admin/category/findbyname")
	public String findAllCate(@RequestParam("name") String nameSearch, Model model) {

		List<Category> listCate = categoryServiceImpl.findAllByNameLike("%" + nameSearch + "%");

		model.addAttribute("listCategory", listCate);

		return "adminViews/html/QuanLyCategory";
	}

}
