package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;

@Repository
public interface BoardRepository {

	// 문의 등록
	void ask(BoardVO vo);
	
	// 공지 등록
	void notice(BoardVO vo);
	
	// 공지 목록 읽어오기
	List<BoardVO> noticeList(Criteria criteria);
	
	// 질문 목록 읽어오기 (관리자)
	List<BoardVO> askList();

	// 공지 세부
	BoardVO noticeDetail(Long bno);

	int getTotalCount(Criteria criteria);
	
	int getNoticeTotalCount(Criteria criteria);
	
	int getAskTotalCount(Criteria criteria);
}
