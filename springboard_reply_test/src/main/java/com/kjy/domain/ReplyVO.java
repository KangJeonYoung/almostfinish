package com.kjy.domain;

import java.util.Date;

import lombok.Data;


//import java.sql.Date;
import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno;
	private Long bno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
}