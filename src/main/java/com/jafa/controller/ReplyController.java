package com.jafa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jafa.domain.ReplyVO;
import com.jafa.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo) {
		replyService.replyWrite(vo);
		return "redirect:/askDetail?bno="+vo.getBno();
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ReplyVO vo) {
		replyService.replyDelete(vo);
		return "redirect:/askDetail?bno="+vo.getBno();
	}
	
}
