package com.example.demo.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DTO.ReportByProduct;
import com.example.demo.repository.OrderRepository;
import com.example.demo.service.impl.ParamService;

@Controller
public class ManageReportController {

	@Autowired
	OrderRepository orderRepository;

	@Autowired
	ParamService paramService;

	@RequestMapping("admin/baocao")
	public String getReport(Model model) throws ParseException {

		String dateString = paramService.getString("findDate", "");

		SimpleDateFormat sdf = new SimpleDateFormat();
		
		sdf.applyPattern("yyyy-MM-dd");
		
		List<ReportByProduct> listReport = null;
		
		if (!dateString.trim().equalsIgnoreCase("")) {
			Date dateFind = sdf.parse(dateString);
			listReport =  orderRepository.getReportProductDate(dateFind);
			model.addAttribute("dateCurrent", dateFind);
			
		} else {

			 listReport = orderRepository.getReportProduct();

		}
		
		List<Date> listDate = orderRepository.getListDateOrder();

		model.addAttribute("listDate", listDate);
		model.addAttribute("listReport", listReport);
		return "adminViews/html/baoCao";
	}

}
