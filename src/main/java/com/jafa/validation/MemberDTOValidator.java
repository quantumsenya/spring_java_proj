package com.jafa.validation;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jafa.domain.MemberDTO;

public class MemberDTOValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO dto = (MemberDTO) target;
		
		if(dto.getMemberName()==null || dto.getMemberName().isBlank()) {
			errors.rejectValue("memberName", "reqired.name");
		} else {
			String memberName = dto.getMemberName();
			if(memberName.length()<2 || memberName.length()>6) {
				errors.rejectValue("memberName", "length.name");
			} else if(!Pattern.matches("^[가~힣|a-z|A-Z]*$", memberName)) {
				errors.rejectValue("memberName", "nameChar.name");
			}
		}
		
		if(dto.getPassword()==null || dto.getPassword().isBlank()) {
			errors.rejectValue("password", "required.password");
		} else {
			String password = dto.getPassword();
			if(!Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&=_])[A-Za-z\\d@$!%*#?&=_]{8,}$", password)) {
				errors.rejectValue("password", "limit.password");
			} else if (!password.equals(dto.getConfPassword())) {
				errors.rejectValue("password", "notMatching.password");
				errors.rejectValue("confPassword", "notMatching.password");
			}
		}
		
		if(dto.getConfPassword()==null || dto.getConfPassword().isBlank()) {
			errors.rejectValue("confPassword", "reqired.password");
		}
		
		if(dto.getEmail()==null || dto.getEmail().isBlank()) { // 이메일을 입력하지 않았을 때
			errors.rejectValue("email", "reqired.email");
		} else {
			String email = dto.getEmail();
			if(!Pattern.matches("^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", email)) {
				errors.rejectValue("email", "limit.email");
			}
		}
		
		if(dto.getPhoneNum()==null || dto.getPhoneNum().isBlank()) { // 번호를 입력하지 않았을 때
			errors.rejectValue("phoneNumber", "reqired.phoneNumber");
		} else {
			String phoneNumber = dto.getPhoneNum();
			if(!Pattern.matches("^010-?([0-9]{3,4})-?([0-9]{4})$", phoneNumber)) {
				errors.rejectValue("phoneNumber", "limit.phoneNumber");
			}
			
		}
	}

}
