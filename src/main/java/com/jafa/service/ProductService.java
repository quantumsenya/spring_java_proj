package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.ProductVO;
import com.jafa.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	

	public List<ProductVO> productList() {
		return productRepository.productList();
	}



	public void add(ProductVO vo) {
		
		
		productRepository.add(vo);
	}

}
