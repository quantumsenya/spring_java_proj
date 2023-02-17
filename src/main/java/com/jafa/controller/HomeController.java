package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.BoardVO;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberVO;
import com.jafa.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("/")
	public String home(Model model, Authentication auth) {
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO vo = principal.getMemberVO();
		model.addAttribute("name", vo.getMemberId());
		model.addAttribute("welcome", "관리페이지");
		return "index";
	}
	
	@GetMapping("/notice")
	public void noticeList(Model model, Authentication auth) {
		List<BoardVO> noticeList = boardService.noticeList();
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO vo = principal.getMemberVO();
		model.addAttribute("memberInfo", vo);
		model.addAttribute("notice", noticeList);
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/ask")
	public String askForm(Authentication auth, Model model) {
		log.info("질문 폼 이동 - 로그인한 사용자만 접근 가능");
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO vo = principal.getMemberVO();
		model.addAttribute("memberInfo", vo);
		return "/askForm";
	}
	
	@GetMapping("/service")
	public void service(Model model) {
		log.info("서비스 안내 이동");
	}
	
	@PostMapping("/ask")
	public String ask(BoardVO vo, RedirectAttributes rttr) {
		log.info("질문 등록");
		boardService.ask(vo);
		return "redirect:/ask";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
	@GetMapping("noticeForm")
	public void noticeForm() {
		log.info("공지 작성");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
	@PostMapping("/notice")
	public String postNotice(BoardVO vo, RedirectAttributes rttr) {
		log.info("공지 등록");
		boardService.notice(vo);
		return "redirect:/notice";
	}
	
	public String noticeDetail(BoardVO vo) {
		boardService.noticeDetail(vo);
		return "/askDetail";
	}
}
