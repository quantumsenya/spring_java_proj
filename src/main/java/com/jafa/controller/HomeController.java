package com.jafa.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;
import com.jafa.domain.MemberDetail;
import com.jafa.domain.MemberVO;
import com.jafa.domain.Pagination;
import com.jafa.domain.ReplyVO;
import com.jafa.service.BoardService;
import com.jafa.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	ReplyService replyService;
	
	@GetMapping("/")
	public String home(Model model) {
		return "index";
	}
	
	@RequestMapping(value = {"/notice"})
	public String noticeList(@ModelAttribute("cri") Criteria criteria, Model model, Authentication auth) {
		if(auth!=null && auth.isAuthenticated()) {
			MemberDetail principal = (MemberDetail)  auth.getPrincipal();
			MemberVO vo = principal.getMemberVO();
			model.addAttribute("memberInfo", vo);
		}
		model.addAttribute("notice", boardService.noticeList(criteria));
		model.addAttribute("p", new Pagination(criteria, boardService.getNoticeTotalCount(criteria)));
		return "/main/notice";
	}
	
	@RequestMapping("/noticeDetail")
	public ModelAndView detail(@RequestParam("bno") Long bno, Principal principal,
								HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
//		boardService.updateViews(bno);
		
		Cookie oldCookie = null;
		Cookie[] cookies = req.getCookies();
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				log.info("cookie.getName"+cookie.getName());
				log.info("cookie.getValue"+cookie.getValue());
				if(cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		} 
		
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + bno.toString() + "]")) {
				this.boardService.updateViews(bno);
				oldCookie.setValue(oldCookie.getValue()+"_["+bno+"]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60*60*24);
				resp.addCookie(oldCookie);
			}
		} else {
			this.boardService.updateViews(bno);
			Cookie newCookie = new Cookie("postView", "["+bno+"]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60*60*24);
			resp.addCookie(newCookie);
		}
		
		mav.setViewName("/main/noticeDetail");
		mav.addObject("board", boardService.noticeDetail(bno));
		if(principal!=null) {
			mav.addObject("userId", principal.getName());
			log.info(principal.getName());
		}
		
		return mav;
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/ask")
	public String askForm(Authentication auth, Model model) {
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO vo = principal.getMemberVO();
		model.addAttribute("memberInfo", vo);
		return "/main/askForm";
	}
	
	@GetMapping("/service")
	public String service(Model model) {
		return "/main/service";
	}
	
	@PostMapping("/ask")
	public String ask(BoardVO vo, RedirectAttributes rttr) {
		boardService.ask(vo);
		return "redirect:/main/ask";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
	@RequestMapping(value = {"/askList"})
	public String askList(@ModelAttribute("cri") Criteria criteria, Model model, Authentication auth) {
		if(auth!=null && auth.isAuthenticated()) {
			MemberDetail principal = (MemberDetail)  auth.getPrincipal();
			MemberVO vo = principal.getMemberVO();
			model.addAttribute("memberInfo", vo);
		}
		model.addAttribute("ask", boardService.askList(criteria));
		model.addAttribute("p", new Pagination(criteria, boardService.getAsktotalCount(criteria)));
		return "/main/askList";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
	@RequestMapping("/askDetail")
	public ModelAndView askDetail(@RequestParam("bno") Long bno, Authentication auth) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/askDetail");
		if(auth!=null && auth.isAuthenticated()) {
			MemberDetail principal = (MemberDetail)  auth.getPrincipal();
			MemberVO vo = principal.getMemberVO();
			mav.addObject("memberInfo", vo);
		}
		mav.addObject("board", boardService.askDetail(bno));
		mav.addObject("reply", replyService.replyList(bno));
		return mav;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
	@GetMapping("noticeForm")
	public String noticeForm(Authentication auth, Model model) {
		MemberDetail principal = (MemberDetail) auth.getPrincipal();
		MemberVO vo = principal.getMemberVO();
		model.addAttribute("memberInfo", vo);
		return "/main/noticeForm";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUB_ADMIN')")
	@PostMapping("/notice")
	public String postNotice(BoardVO vo, RedirectAttributes rttr) {
		boardService.notice(vo);
		return "redirect:/notice";
	}
	
	@PostMapping("/delNotice")
	public String noticeDel(@RequestParam("bno") Long bno, Authentication auth, Model model) {
		boardService.delete(bno);
		return "redirect:/notice";
	}
		
}
