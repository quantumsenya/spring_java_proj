package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.Criteria;
import com.jafa.domain.Pagination;
import com.jafa.domain.ProductVO;
import com.jafa.service.ProductService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = {"/list", "/list/{category}"})
	public String list(Model model,@PathVariable(required = false) String category,
						@ModelAttribute("cri") Criteria criteria) {
		log.info(criteria);
		model.addAttribute("product", productService.productList(criteria));
		model.addAttribute("p", new Pagination(criteria, productService.getTotalCount(criteria)));
		return "/product/list";
	}
	
	@GetMapping("/detail")
	public String detail(int pid, ProductVO vo) {
		log.info("상품상세이지" + pid);
		
		return "/product/detail";
	}
	
	@GetMapping("/add")
	public String addForm() {
		log.info("상품추가 폼 이동");
		return "/product/add";
	}
	
	@PostMapping("/add")
	public String add(ProductVO vo, RedirectAttributes rttr) {
		log.info("상품 등록");
		productService.add(vo);
		return "redirect:/product/list";
	}
	
	
}
