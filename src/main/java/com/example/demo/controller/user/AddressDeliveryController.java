package com.example.demo.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.domain.DeliveryAddress;
import com.example.demo.domain.Users;
import com.example.demo.service.impl.DeliveryAddressServiceImpl;
import com.example.demo.service.impl.ParamService;
import com.example.demo.service.impl.SessionService;

@Controller
public class AddressDeliveryController {

	@Autowired
	SessionService session;

	@Autowired
	ParamService paramService;

	@Autowired
	DeliveryAddressServiceImpl deliveryAddressServiceImpl;

	@GetMapping("/locationCostumer/list")
	public String getlocationCostumer(Model model) {
		Users userCurrent = (Users) session.get("userCurrent");
		List<DeliveryAddress> listDeliveryByUser = deliveryAddressServiceImpl.findAllByUser(userCurrent);
		model.addAttribute("listDeliveryAddress", listDeliveryByUser);
		
		return "locationCostumer";

	}

	@GetMapping("/locationCostumer/add-form")
	public String getlocationCostumerAddForm() {

		return "locationCreateCostumer";

	}

	@PostMapping("/locationCostumer/add-Address")
	public String getlocationCostumerAddAddress(DeliveryAddress deliveryAddress, Model model) {
		Boolean status = paramService.getBoolean("status", false);
		Users userCurrent = (Users) session.get("userCurrent");

		if (userCurrent == null) {

			return "redirect:/login-form";
		}

		try {
			Integer.parseInt(deliveryAddress.getPhone());
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("ValidatePhone", true);
			return "locationCreateCostumer";
		}

		if(status) {
			checkAndResetDefaultLocation(userCurrent);
			
		}
		
		deliveryAddress.setStatus(status);
		deliveryAddress.setUser(userCurrent);

		deliveryAddressServiceImpl.save(deliveryAddress);

		model.addAttribute("message", "Đã thêm thành công");
		return "locationCreateCostumer";

	}
	
	@GetMapping("/locationCostumer/update-form/{id}")
	public String getlocationCostumerUpdateForm(@PathVariable("id") int idDeliveryAddress,Model model) {

		DeliveryAddress deliveryAddress = deliveryAddressServiceImpl.findById(idDeliveryAddress);
		
		if(deliveryAddress==null) {
			
			return "404";
		}
		
		model.addAttribute("deliveryAddress", deliveryAddress);
		
		return "locationUpdateCostumer";

	}
	
	@PostMapping("/locationCostumer/update-Address")
	public String getlocationCostumerUpdateAddress(DeliveryAddress deliveryAddress, Model model) {
		Boolean status = paramService.getBoolean("status", false);
		Users userCurrent = (Users) session.get("userCurrent");

		if (userCurrent == null) {

			return "redirect:/login-form";
		}

		try {
			Integer.parseInt(deliveryAddress.getPhone());
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("ValidatePhone", true);
			return "locationCreateCostumer";
		}

		if(status) {
			checkAndResetDefaultLocation(userCurrent);
			
		}
		
		deliveryAddress.setStatus(status);
		deliveryAddress.setUser(userCurrent);

		deliveryAddressServiceImpl.save(deliveryAddress);

		model.addAttribute("message", "Đã Sửa thành công");
		return "locationCreateCostumer";

	}
	
	
	

	public void checkAndResetDefaultLocation( Users userCurrent) {

		List<DeliveryAddress> listDeliveryByUser = deliveryAddressServiceImpl.findAllByUser(userCurrent);

		if (!listDeliveryByUser.isEmpty()) {

			for (DeliveryAddress element : listDeliveryByUser) {
				element.setStatus(false);
				deliveryAddressServiceImpl.save(element);
			}

		}

	}

}
