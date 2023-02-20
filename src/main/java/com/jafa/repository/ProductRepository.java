package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.ProductVO;
import com.jafa.domain.Category;

@Repository
public interface ProductRepository {

	List<ProductVO> productList(String id);
	
	void add(ProductVO vo);

	List<Category> getCateList();
}
