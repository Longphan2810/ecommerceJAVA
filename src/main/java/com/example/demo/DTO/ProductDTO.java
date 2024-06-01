package com.example.demo.DTO;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class ProductDTO {

	private int idProduct;
	private String name;
	private float price;
	private String status;
	private float disscount;
	private String description;
	private Date productDate;
	private List<MultipartFile> listImage;
}
