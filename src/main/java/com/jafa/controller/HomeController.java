package com.jafa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("name", "홍길동");
		model.addAttribute("welcome", "우리집");
		return "index";
	}
	
	@GetMapping("/notice")
	public String notice(Model model) {
		
		return "/main/notice";
	}
	
	@GetMapping("/ask")
	public String ask(Model model) {
		
		return "/main/ask";
	}
	
	@GetMapping("/service")
	public String service(Model model) {
		
		return "/main/service";
	}
}
