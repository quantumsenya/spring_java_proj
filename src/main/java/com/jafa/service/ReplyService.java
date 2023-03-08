package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jafa.domain.ReplyVO;
import com.jafa.repository.ReplyRepository;

@Service
public class ReplyService {

	@Autowired
	ReplyRepository replyRepository;
	
	public void replyWrite(ReplyVO vo) {
		replyRepository.replyWrite(vo);
	}
	
	public void replymodify(ReplyVO vo) {
		replyRepository.replyModify(vo);
	}
	
	public List<ReplyVO> replyList(Long bno) {
		return replyRepository.replyList(bno);
	}
	
	public void replyDelete (ReplyVO vo) {
		replyRepository.replyDelete(vo);
	}
}
