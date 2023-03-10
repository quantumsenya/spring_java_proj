package com.jafa.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.jafa.domain.BoardVO;

public class BoardVOValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return BoardVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		BoardVO vo = (BoardVO) target;
		
		
		if(vo.getTitle()==null || vo.getTitle().isBlank()) {
			errors.rejectValue("title", "reqired.title");
		} else {
			String title = vo.getTitle();
			if(title.length()<2 || title.length()>30) {
				errors.rejectValue("title", "length.title");
			}
		}
		
		if(vo.getContent()==null || vo.getContent().isBlank()) {
			errors.rejectValue("content", "reqired.content");
		} else {
			String content = vo.getContent();
			if(content.length()<10 || content.length()>4000) {
				errors.rejectValue("content", "length.content");
			}
		}
	}

}
