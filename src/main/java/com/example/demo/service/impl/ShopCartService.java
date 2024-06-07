package com.example.demo.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.example.demo.DTO.ItemForCart;




@SessionScope
@Service
public class ShopCartService {

	Map<ItemForCart, Integer> shopCart = new HashMap<>();
	
	public Map<ItemForCart, Integer> getMap(){
		return this.shopCart;
	}
	
	public int size() {
		
		return this.shopCart.size();
	}

	public void addItem(ItemForCart product, int soLuong) {

		if (shopCart.containsKey(product)) {

			shopCart.put(product, shopCart.get(product) + soLuong);
			

		} else {

			shopCart.put(product, soLuong);
		

		}

	}

	public void remove(ItemForCart product) {

		if (shopCart.containsKey(product)) {

			shopCart.remove(product);

		}

	}

	public void update(ItemForCart product, int soLuong) {

		if (shopCart.containsKey(product)) {

			if(soLuong<1) {
				shopCart.remove(product);
			} else {
				shopCart.put(product, soLuong);

			}
			
		}

	}
	
	public void clear() {
		
		shopCart.clear();
	}
	
	

}
