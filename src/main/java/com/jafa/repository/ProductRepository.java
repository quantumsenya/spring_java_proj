package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.ProductVO;

@Repository
public interface ProductRepository {

	List<ProductVO> productList();
	
	void add(ProductVO vo);
}
