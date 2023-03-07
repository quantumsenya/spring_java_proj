package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.Criteria;
import com.jafa.domain.ProductVO;

@Repository
public interface ProductRepository {

	List<ProductVO> productList(Criteria criteria);
	
	void add(ProductVO vo);

	ProductVO detail(Long pid);
	
	int getTotalCount(Criteria criteria);

	void delete(Long pid);

	void edit(ProductVO vo);
}
