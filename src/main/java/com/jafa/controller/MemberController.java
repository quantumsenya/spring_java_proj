package com.jafa.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.AuthListDTO;
import com.jafa.domain.AuthVO;
import com.jafa.domain.MemberDTO;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberType;
import com.jafa.domain.MemberVO;
import com.jafa.service.MemberService;
import com.jafa.validation.MemberDTOValidator;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	@Autowired
	MemberService memberService; 
	
	@GetMapping("/all")
	public void doAll() {
		log.info("모두 접근 허용");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
	@GetMapping("/admin")
	public void doAdmin(Model model) {
		log.info("관리자만 접근가능");
		List<MemberVO> memberList = memberService.memberList();
		model.addAttribute("list", memberList);
		model.addAttribute("mType", MemberType.values());
	}
	
	@GetMapping("/accessError")
	public void accessError() {
		log.info("접근이 거부됨.");
		// member/accessError.jsp 생성
	}
	
	// 로그인 페이지 
	@RequestMapping("/login")
	public String login(Authentication authentication, RedirectAttributes rttr) {
		log.info("로그인 페이지");
		if(authentication!=null && authentication.isAuthenticated()) { // 인증된 사용자가 있을 때 
			rttr.addFlashAttribute("loginOn", "이미 로그인한 상태입니다.");
			return "redirect:/";
		}
		return "/member/login";
	}
	
	// 회원가입폼
	@GetMapping("/join")
	public void joinForm(MemberDTO dto) {
		
	}
	
	//회원가입처리
	@PostMapping("/join")
	public String join(@Valid MemberDTO dto, Errors errors, RedirectAttributes rttr) {
		if(errors.hasErrors()) {
			System.out.println("에러!");
			return "/member/join";
		}
		memberService.join(dto);
		return "redirect:/";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberDTOValidator());
	}
	
	// 회원등급변경 6
	@PreAuthorize("hasAnyRole('ROLE_REGULAR_MEMBER','ROLE_ASSOCIATE_MEMBER')")
	@PostMapping("/updateMemberType")
	public String updateMemberType(AuthListDTO authListDTO, RedirectAttributes rttr) {
		log.info(authListDTO.getAuthList());
		List<AuthVO> authList = authListDTO.getAuthList();
		for(AuthVO vo : authList) {
			if(vo.getMemberId()!=null&&vo.getMemberType()!=null){
				memberService.updateMemberType(vo);
			}
		}
		rttr.addFlashAttribute("updateMember", "등급변경");
		return "redirect:/member/admin";
	}
	
	// Authentication : 인증된 사용자의정보가 담겨 있는 객체 
	@PreAuthorize("isAuthenticated()") // 인증된 사용자 
	@GetMapping("/mypage")
	public String myPage(Authentication auth, Model model) {
		log.info("로그인한 사용자만 접근 가능");
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO vo = principal.getMemberVO();
		model.addAttribute("memberInfo", vo);
		model.addAttribute("mType", MemberType.values());
		return "member/mypage";
	}

}
