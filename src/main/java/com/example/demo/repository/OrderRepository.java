package com.example.demo.repository;



import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.domain.Orders;
import com.example.demo.domain.Users;

public interface OrderRepository extends JpaRepository<Orders, Integer>{

	public Page<Orders> findAllByUser(Users user, Pageable pageable);
	
	public Page<Orders> findAllByIdOrder(int id, Pageable pageable);
	
	public Page<Orders> findAllByIdOrderLike(int id, Pageable pageable);
}
