package com.jafa.repository;

import java.util.List;

import javax.validation.Valid;

import com.jafa.domain.MemberDTO;
import com.jafa.domain.MemberVO;

public interface MemberRepository {
	// 회원가입
	void save(MemberDTO dto);
	// 로그인 체크 
	MemberVO read(String memberId);
	// 회원목록 
	List<MemberVO> memberList();
	
	void memberUpdate(MemberDTO dto);
}
