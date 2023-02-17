package com.jafa.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jafa.domain.BoardVO;

@Repository
public interface BoardRepository {

	// 문의 등록
	void ask(BoardVO vo);
	
	// 공지 등록
	void notice(BoardVO vo);
	
	// 공지 목록 읽어오기
	List<BoardVO> noticeList();
	
	// 질문 목록 읽어오기 (관리자)
	List<BoardVO> askList();

	// 공지 세부
	BoardVO noticeDetail(BoardVO vo);
}
