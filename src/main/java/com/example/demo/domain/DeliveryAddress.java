package com.example.demo.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class DeliveryAddress {
	private int idDeliveryAddress;
	private int idUser;
	private String city;
	private String address;
	private String status;
	private int phone;
	private String name;
	
}
