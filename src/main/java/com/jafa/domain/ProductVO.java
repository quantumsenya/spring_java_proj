package com.jafa.domain;

import java.sql.Date;
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
public class ProductVO {
	
	private Long pid;
	private String category;
	private String tag;
	private String pname;
	private String brand;
	private int price;
	private int count;
	private Date pDate;
}
