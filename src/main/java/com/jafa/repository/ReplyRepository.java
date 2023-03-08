package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.ReplyVO;

@Repository
public interface ReplyRepository {

	void replyWrite(ReplyVO vo);
	
	void replyModify(ReplyVO vo);
	
	List<ReplyVO> replyList(Long bno);
	
	void replyDelete (ReplyVO vo);
	
}
