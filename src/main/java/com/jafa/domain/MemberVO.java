package com.jafa.domain;

import java.sql.Timestamp;
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
public class MemberVO {
	private Long mno; 
	private String memberId;
	private String memberName;
	private String password; 
	private String email;
	private String phoneNum;
	private boolean enabled;
	private Timestamp joinDate;
	private List<AuthVO> authList;
}
