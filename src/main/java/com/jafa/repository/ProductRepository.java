package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.Criteria;
import com.jafa.domain.ProductVO;

@Repository
public interface ProductRepository {

	// 상품목록
	List<ProductVO> productList(Criteria criteria);
	
	// 상품추가
	void add(ProductVO vo);

	// 상품상세
	ProductVO detail(Long pid);
	
	// 상품갯수
	int getTotalCount(Criteria criteria);

	// 상품삭제
	void delete(Long pid);

	// 상품수정
	void edit(ProductVO vo);
}
