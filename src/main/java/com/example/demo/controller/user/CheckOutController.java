package com.example.demo.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.DeliveryAddress;
import com.example.demo.domain.Users;
import com.example.demo.service.impl.DeliveryAddressServiceImpl;
import com.example.demo.service.impl.ParamService;
import com.example.demo.service.impl.SessionService;
import com.example.demo.service.impl.ShopCartService;

@Controller
public class CheckOutController {
	
	@Autowired
	ShopCartService shopCartService;
	
	@Autowired
	SessionService session;
	
	@Autowired
	ParamService paramService;

	
	@Autowired
	DeliveryAddressServiceImpl deliveryAddressServiceImpl;
	
	@RequestMapping("/checkout")
	public String getCheckout(Model model) {

		
		Users userCurrent = (Users) session.get("userCurrent");
		
		List<DeliveryAddress> listDeliveryInUser = deliveryAddressServiceImpl.findAllByUser(userCurrent);
		
		model.addAttribute("listDeliveryInUser", listDeliveryInUser);
		
		model.addAttribute("mapShopCart", shopCartService.getMap());
		
		return "checkout";

	}
	
	
	@PostMapping("/checkout/change-adrress")
	public String changeDeliveryAddress( ) {
		
		int idDeliveryAddress = paramService.getInt("idDeliveryAddress", -999);
		
		DeliveryAddress deliveryAddress = deliveryAddressServiceImpl.findById(idDeliveryAddress);
		
		if(deliveryAddress==null) {
			return "404";
		}
		
		Users userCurrent = (Users) session.get("userCurrent");
		
		checkAndResetDefaultLocation(userCurrent);
		
		deliveryAddress.setStatus(true);
		
		deliveryAddressServiceImpl.save(deliveryAddress);
		
		
		return "redirect:/checkout";
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
