package com.example.demo.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class Users {

	private int idUser;
	private String password;
	private String email;
	private Date birhday;
	private int phone;
	private String address;
	private String status;
	private String name;
	private boolean role;
	
}
