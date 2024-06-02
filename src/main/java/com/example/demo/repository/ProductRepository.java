package com.example.demo.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	public Page<Product> findAllByNameLike(String name,Pageable pageable);
	
}
