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
	List<BoardVO> askList(Criteria criteria);
	
	// 나의 질문목록
	List<BoardVO> myAsk(String memberId);
	
	// 전체게시물 갯수
	int getTotalCount(Criteria criteria);
	
	// 공지사항 게시물 갯수
	int getNoticeTotalCount(Criteria criteria);
	
	// 질문 갯수
	int getAskTotalCount(Criteria criteria);
	
	// 공지 세부
	BoardVO noticeDetail(Long bno);

	// 질문 상세
	BoardVO askDetail(Long bno);

	// 글 삭제
	void delete(Long bno);

	// 조회수 +1
	void updateViews(Long bno);

}
