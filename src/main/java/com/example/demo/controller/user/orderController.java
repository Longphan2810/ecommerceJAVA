package com.example.demo.controller.user;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.DTO.ItemForCart;
import com.example.demo.controller.vnpay.PaymentController;
import com.example.demo.domain.DeliveryAddress;
import com.example.demo.domain.OrderDetail;
import com.example.demo.domain.Orders;
import com.example.demo.domain.ProductDetail;
import com.example.demo.domain.Users;
import com.example.demo.service.impl.DeliveryAddressServiceImpl;
import com.example.demo.service.impl.OrderDetailServiceImpl;
import com.example.demo.service.impl.OrderServiceImpl;
import com.example.demo.service.impl.ParamService;
import com.example.demo.service.impl.ProductDetailServiceImpl;
import com.example.demo.service.impl.SessionService;
import com.example.demo.service.impl.ShopCartService;
import com.example.demo.vnpayConfig.Config;

@Controller
public class OrderController {

	@Autowired
	ShopCartService shopCartService;

	@Autowired
	SessionService session;

	@Autowired
	ParamService paramService;

	@Autowired
	ProductDetailServiceImpl productDetailServiceImpl;

	@Autowired
	OrderServiceImpl orderServiceImpl;

	@Autowired
	OrderDetailServiceImpl orderDetailServiceImpl;

	@Autowired
	DeliveryAddressServiceImpl deliveryAddressServiceImpl;
	
	@Autowired
	PaymentController paymentController;

	@PostMapping("/create-order")
	public String getOrder(Model model) {

		String paymentMethods = paramService.getString("paymentMethods", "");

		if (shopCartService.getMap().isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn sản phẩm trước khi thanh toán!");
			model.addAttribute("mapShopCart", shopCartService.getMap());
			return "shopingCart";
		}
		// check stock
		if (!checkOutOfStock()) {

			shopCartService.reFillQualityProduct();

			model.addAttribute("message", "Có vài món hàng vượt quá số lượng trong kho, vui lòng kiểm tra lại !");
			model.addAttribute("mapShopCart", shopCartService.getMap());

			return "shopingCart";
		}
		// check delivery address
		if (!checkDeliveryAddress()) {
			model.addAttribute("message", "Vui lòng thêm hoặc kiểm tra địa chỉ giao hàng !");
			model.addAttribute("mapShopCart", shopCartService.getMap());
			return "shopingCart";
		}
		if (paymentMethods.trim().equalsIgnoreCase("cash")) {

			handldePaymentCash();
			shopCartService.clear();
			model.addAttribute("message", "Đã đặt hàng thành công !");
		}
		if (paymentMethods.trim().equalsIgnoreCase("VNpay")) {
			try {
				return "redirect:"+ handldePaymentVNPay();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return "checkout";
	}

	private void handldePaymentCash() {

		Users userCurrent = (Users) session.get("userCurrent");

		DeliveryAddress da = deliveryAddressServiceImpl.findByUserAndStatus(userCurrent, true);

		Set<ItemForCart> keySet = shopCartService.getMap().keySet();

		Map<ItemForCart, Integer> shopCart = shopCartService.getMap();

		
		Orders order = new Orders();
		order.setUser(userCurrent);
		order.setAmount(shopCartService.getTotalPrice());
		order.setStatus("waiting");
		order.setPaymentMethod("cash");
		order.setName(da.getName());
		order.setAddress(da.getAddress());
		order.setCity(da.getCity());
		order.setPhone(da.getPhone());
		
		orderServiceImpl.save(order);

		for (ItemForCart itemForCart : keySet) {
			ProductDetail productDetail = productDetailServiceImpl.findById(itemForCart.getIdProductDetail());

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setProductDetail(productDetail);
			orderDetail.setOrder(order);
			orderDetail.setPrice(itemForCart.getPrice());
			orderDetail.setQuanlity(shopCart.get(itemForCart));

			productDetail.setQuality(productDetail.getQuality() - shopCart.get(itemForCart));

			orderDetailServiceImpl.save(orderDetail);
			productDetailServiceImpl.save(productDetail);

		}

	}
	
	
	private String handldePaymentVNPay() throws IOException {

		Users userCurrent = (Users) session.get("userCurrent");

		DeliveryAddress da = deliveryAddressServiceImpl.findByUserAndStatus(userCurrent, true);

		Set<ItemForCart> keySet = shopCartService.getMap().keySet();

		Map<ItemForCart, Integer> shopCart = shopCartService.getMap();

		String transactionCode = Config.getRandomNumber(8);
		
		//15m waiting for pay order by VNpay
		long countDownTimePayVNpay = new Date().getTime()+(60000 * 15);
	
		
		Orders order = new Orders();
		order.setUser(userCurrent);
		order.setAmount(shopCartService.getTotalPrice());
		order.setStatus("waiting");
		order.setPaymentMethod("vnpay");
		order.setName(da.getName());
		order.setAddress(da.getAddress());
		order.setCity(da.getCity());
		order.setPhone(da.getPhone());
		order.setTransactionCode(transactionCode);
		order.setPayedVNpay(false);
		order.setCountDownTimeTranVNpay(countDownTimePayVNpay);
		
	    
		orderServiceImpl.save(order);

		for (ItemForCart itemForCart : keySet) {
			ProductDetail productDetail = productDetailServiceImpl.findById(itemForCart.getIdProductDetail());

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setProductDetail(productDetail);
			orderDetail.setOrder(order);
			orderDetail.setPrice(itemForCart.getPrice());
			orderDetail.setQuanlity(shopCart.get(itemForCart));

			productDetail.setQuality(productDetail.getQuality() - shopCart.get(itemForCart));

			orderDetailServiceImpl.save(orderDetail);
			productDetailServiceImpl.save(productDetail);

		}
		
	  return paymentController.payment((int) shopCartService.getTotalPrice(), transactionCode);

	}

	// function will put value map parameter

	public boolean checkOutOfStock() {
		Set<ItemForCart> keySet = shopCartService.getMap().keySet();
		Map<ItemForCart, Integer> shopCart = shopCartService.getMap();

		boolean flatCheck = true;
		for (ItemForCart itemForCart : keySet) {
			ProductDetail productDetail = productDetailServiceImpl.findById(itemForCart.getIdProductDetail());
			if (shopCart.get(itemForCart) > productDetail.getQuality()) {

				flatCheck = false;
			}

		}

		return flatCheck;
	}

	// check delivery address

	public boolean checkDeliveryAddress() {

		boolean check = true;
		Users userCurrent = (Users) session.get("userCurrent");
		DeliveryAddress da = deliveryAddressServiceImpl.findByUserAndStatus(userCurrent, true);
		if (da == null) {
			check = false;
		}
		return check;
	}
	
	
	@RequestMapping("testlist1")
	@ResponseBody
	public String test1() {
		List<Orders> list = orderServiceImpl.findAllByPayedVNpayFalse();
		for (Orders orders : list) {
			
			System.out.println(orders.getIdOrder());
		}
		
		return "";
	}

}
