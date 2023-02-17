package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.domain.BoardVO;
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
	public List<BoardVO> noticeList() {
		return boardRepository.noticeList();
	}
	
	// 질문 조회
	public List<BoardVO> askList() {
		return boardRepository.askList();
	}

	public BoardVO noticeDetail(BoardVO vo) {
		return boardRepository.noticeDetail(vo);
	}

}
