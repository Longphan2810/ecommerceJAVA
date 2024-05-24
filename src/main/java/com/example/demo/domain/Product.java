package com.example.demo.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Product {

	private int idProduct;
	private String name;
	private int quanlity;
	private float price;
	private String image;
	private int idCategory;
	private String status;
	private float disscount;
	private String description;
	private Date productDate;
	private int idUser;
	
	
}
