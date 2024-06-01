package com.example.demo.domain;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity @Table(name = "Products")
public class Product {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idProduct;
	private String name;
	private float price;
	private String status;
	private float disscount;
	
	private String description;
	private Date productDate;
	
	@ManyToOne
	@JoinColumn(name = "id_category")
	private Category category;
	
	@OneToMany(mappedBy = "product")
	private List<OrderDetail> listOrderDetails;
	
	@OneToMany(mappedBy = "product")
	private List<ProductDetail> listProductDetails;
	
}
