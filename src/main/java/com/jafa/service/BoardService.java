package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.BoardVO;
import com.jafa.domain.Criteria;
import com.jafa.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	BoardRepository boardRepository;
	
	// 질문게시판 등록
	@Transactional
	public void ask(BoardVO vo) {
		BoardVO boardVo = BoardVO.builder()
				.tag(vo.getTag())
				.title(vo.getTitle())
				.content(vo.getContent())
				.writer(vo.getWriter())
				.build();
		boardRepository.ask(boardVo);
	}
	
	// 공지 등록
	public void notice(BoardVO vo) {
		BoardVO boardVO = BoardVO.builder()
				.tag(vo.getTag())
				.title(vo.getTitle())
				.content(vo.getContent())
				.writer(vo.getWriter())
				.build();
		boardRepository.notice(boardVO);
	}
	
	// 공지 조회
	public List<BoardVO> noticeList(Criteria criteria) {
		return boardRepository.noticeList(criteria);
	}
	
	// 질문 조회
	public List<BoardVO> askList(Criteria criteria) {
		return boardRepository.askList(criteria);
	}

	public BoardVO noticeDetail(Long bno) {
		return boardRepository.noticeDetail(bno);
	}

	public int getTotalCount(Criteria criteria) {
		return boardRepository.getTotalCount(criteria);
	}
	
	public int getNoticeTotalCount(Criteria criteria) {
		return boardRepository.getNoticeTotalCount(criteria);
	}
	
	public int getAsktotalCount(Criteria criteria) {
		return boardRepository.getAskTotalCount(criteria);
	}

	public BoardVO askDetail(Long bno) {
		return boardRepository.askDetail(bno);
	}

	public void delete(Long bno) {
		boardRepository.delete(bno);
	}

	public void updateViews(Long bno) {
		boardRepository.updateViews(bno);
	}

	public Object myAsk(String memberId) {
		return boardRepository.myAsk(memberId);
	}

}
