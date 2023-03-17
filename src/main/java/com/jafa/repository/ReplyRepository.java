package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.ReplyVO;

@Repository
public interface ReplyRepository {

	// 댓글작성
	void replyWrite(ReplyVO vo);
	
	// 댓글목록
	List<ReplyVO> replyList(Long bno);
	
	// 댓글삭제
	void replyDelete (ReplyVO vo);
	
}
