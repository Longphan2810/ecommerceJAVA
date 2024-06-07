package com.example.demo.controller.user;

import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.DTO.ItemForCart;
import com.example.demo.domain.ProductDetail;
import com.example.demo.domain.Users;
import com.example.demo.service.impl.ProductDetailServiceImpl;
import com.example.demo.service.impl.SessionService;
import com.example.demo.service.impl.ShopCartService;

@Controller
public class ShopCartController {

	@Autowired
	ShopCartService shopCartService;

	@Autowired
	SessionService session;

	@Autowired
	ProductDetailServiceImpl productDetailServiceImpl;

	@PostMapping("/addToCard")
	public String addToCard(@RequestParam("idProduct") int idProdut, @RequestParam("quality") int quality,
			@RequestParam("size") String size, RedirectAttributes redirect) {

//		Users userCurrent = (Users) session.get("userCurrent");
//
//		if (userCurrent == null) {
//			return "redirect:/login-form";
//		}

		ProductDetail productDetail = productDetailServiceImpl.findBySizeAndIdProduct(size, idProdut);

		ItemForCart item = new ItemForCart();
		BeanUtils.copyProperties(productDetail, item);
		BeanUtils.copyProperties(productDetail.getProduct(), item);

		shopCartService.addItem(item, quality);

		session.set("sizeCart", shopCartService.size());

		redirect.addAttribute("message", "Đã thêm vào giỏ hàng");
		return "redirect:/detail?idProduct=" + idProdut;
	}

	@GetMapping("/shopCart")
	public String getShopCart(Model model) {

//		Users userCurrent = (Users) session.get("userCurrent");
//
//		if (userCurrent == null) {
//			return "redirect:/login-form";
//		}

		model.addAttribute("mapShopCart", shopCartService.getMap());
		session.set("sizeCart", shopCartService.size());
		return "shopingCart";

	}

	@RequestMapping("/shopCart/Update")
	public String updateShopCart(@RequestParam("idProductDetailInHashMap") int idProductDetail,
			@RequestParam("quality") int quality) {

		Set<ItemForCart> setKeyItemMap = shopCartService.getMap().keySet();

		ItemForCart itemNeedUpdate = null;

		for (ItemForCart itemForCart : setKeyItemMap) {
			if (itemForCart.getIdProductDetail() == idProductDetail) {
				itemNeedUpdate = itemForCart;
				break;
			}
		}

		if (itemNeedUpdate != null) {
			shopCartService.update(itemNeedUpdate, quality);

		}
		session.set("sizeCart", shopCartService.size());
		return "forward:/shopCart";
	}
	
	
	@RequestMapping("/shopCart/remove/{id}")
	public  String removeProductInShopCart(@PathVariable("id") int idProductDetail) {
		
		ProductDetail productDetail = productDetailServiceImpl.findById(idProductDetail);
		
		if(productDetail==null) {
			
			return"404";
		}
		
		Set<ItemForCart> setKeyItemMap = shopCartService.getMap().keySet();

		ItemForCart itemNeedUpdate = null;

		for (ItemForCart itemForCart : setKeyItemMap) {
			if (itemForCart.getIdProductDetail() == idProductDetail) {
				itemNeedUpdate = itemForCart;
				break;
			}
		}
		
		if (itemNeedUpdate != null) {
			shopCartService.remove(itemNeedUpdate);

		}
		session.set("sizeCart", shopCartService.size());
		return "forward:/shopCart";
	}

}
