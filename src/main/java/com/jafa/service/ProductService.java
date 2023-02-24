package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.Criteria;
import com.jafa.domain.ProductVO;
import com.jafa.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	

	public List<ProductVO> productList(Criteria criteria) {
		return productRepository.productList(criteria);
	}

	public void add(ProductVO vo) {
		productRepository.add(vo);
	}

	public int getTotalCount(Criteria criteria) {
		return productRepository.getTotalCount(criteria);
	}


}
