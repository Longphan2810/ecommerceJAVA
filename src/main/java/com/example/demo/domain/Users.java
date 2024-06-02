package com.example.demo.domain;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
@Entity @Table(name = "Users")
public class Users {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idUser;
	private String password;
	private String email;
	private Date birhday;
	private String phone;
	private String status;
	private String passport;
	private String name;
	private boolean role;
	
	@OneToMany(mappedBy = "user")
	private List<DeliveryAddress> listDeliveryAddresses;
	
//	@OneToMany(mappedBy = "user")
//	private List<Order> listOrder;
}
