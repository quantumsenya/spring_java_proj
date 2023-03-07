package com.jafa.repository;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.jafa.config.RootConfig;
import com.jafa.config.SecurityConfig;
import com.jafa.config.ServletConfig;
import com.jafa.domain.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class, ServletConfig.class})
@WebAppConfiguration
@Log4j
public class ProductRepositoryTest {

	@Autowired
	ProductRepository productRepository;
	
	@Test
	public void test() {
		ProductVO vo = ProductVO.builder()
				.pid(690L)
				.category("ACC")
				.pname("수정테스트")
				.brand("수정브랜드")
				.price(555555)
				.count(55)
				.build();
		productRepository.edit(vo);
	}

}
