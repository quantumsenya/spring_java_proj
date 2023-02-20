package com.jafa.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class BoardVO {
	
	private int bno;
	private String tag;
	private String title;
	private String content;
	private String writer;
	private int views;
	private Date writeDate;
}
