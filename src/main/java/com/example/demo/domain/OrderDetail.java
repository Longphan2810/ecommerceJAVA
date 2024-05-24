package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class OrderDetail {

	private int idOrderDetail;
	private int idOrder;
	private int idProduct;
	private int quanlity;
	private float price;
	
}
