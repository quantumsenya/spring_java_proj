package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.ProductVO;
import com.jafa.domain.Category;
import com.jafa.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductRepository productRepository;
	
	

	public List<ProductVO> productList(String cid) {
		return productRepository.productList(cid);
	}

	public void add(ProductVO vo) {
		productRepository.add(vo);
	}

	public List<Category> getCateList() {
		return productRepository.getCateList();
	}

}
