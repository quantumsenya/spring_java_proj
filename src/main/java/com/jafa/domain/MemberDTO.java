package com.jafa.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import com.jafa.validation.FieldMatch;

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
@FieldMatch(first = "password", second = "confPassword", message = "비밀번호가 일치하지 않습니다.")
public class MemberDTO {
	
	@NotBlank(message = "아이디는 필수 입력 항목입니다.")
	@Length(min = 4, max = 16, message = "아이디는 4~16자이어야 합니다.")
	private String memberId;
	
	@NotBlank(message = "이름은 필수 입력 항목입니다.")
	@Length(min = 2, max = 10, message = "이름은 2~10자이어야 합니다.")
	private String memberName;
	
	@Pattern(regexp = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$")
	private String password; 
	private String confPassword;
	
	@Email(message = "올바른 이메일 형식이 아닙니다.")
	@NotBlank(message = "이메일은 필수항목 입니다.")
	private String email;
	
	@NotBlank(message = "전화번호는 필수 입력 항목입니다.")
	private String phoneNum;
}
