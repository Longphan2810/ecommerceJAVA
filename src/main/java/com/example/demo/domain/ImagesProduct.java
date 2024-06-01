package com.example.demo.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity @Table(name = "ImagesProduct")
public class ImagesProduct {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idImageProduct;

	private String nameImage;
	
	
	@ManyToOne()
	@JoinColumn(name="id_ProductDetail")
	private ProductDetail productDetail;
	
}
