package com.jafa.domain;

import java.sql.Timestamp;

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
public class ReplyVO {
//		CREATE TABLE PRO_REPLY (
//			RNO NUMBER(10) not null,
//		    BNO NUMBER(10) not null,
//			WRITER 	VARCHAR2(30) not null,
//			CONTENT VARCHAR2(1000) not null,
//			REPLYDATE DATE DEFAULT SYSDATE,
//			PRIMARY KEY(rno, bno),
//			FOREIGN KEY(bno) REFERENCES PRO_BOARD(bno)
//		);
	
	private int rno;
	private int bno;
	private String writer;
	private String content;
	private Timestamp replyDate;
	
}
