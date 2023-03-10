package com.jafa.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
	private String memberId;
	private String memberName;
	private String password; 
	private String confPassword;
	private String email;
	private String phoneNum;
	private List<AuthVO> authList;
}
