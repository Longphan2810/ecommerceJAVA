package com.example.demo.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Order {

	private int idOrder;
	private int idUser;
	private int idDeliveryAddress;
	private String  status;
	private float amount;
	private Date orderDate;
	
}
