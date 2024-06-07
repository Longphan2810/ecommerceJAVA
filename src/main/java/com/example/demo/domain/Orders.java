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
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity @Table
public class Orders {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idOrder;
	private String  status;
	private float amount;
	@Temporal(TemporalType.DATE)
	private Date orderDate = new Date();

	@ManyToOne()
	@JoinColumn(name = "id_user")
	private Users user;
	
	
	@OneToMany(mappedBy = "order")
	private List<OrderDetail> listOrderDetails;
	
}
