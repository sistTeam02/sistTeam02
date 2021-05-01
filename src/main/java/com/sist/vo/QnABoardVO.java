package com.sist.vo;

import java.util.Date;

/*
 *  NO         NOT NULL NUMBER         
	NAME       NOT NULL VARCHAR2(34)   
	SUBJECT    NOT NULL VARCHAR2(1000) 
	CONTENT    NOT NULL CLOB           
	PWD        NOT NULL VARCHAR2(10)   
	REGDATE             DATE           
	HIT                 NUMBER         
	GROUP_ID            NUMBER         
	GROUP_STEP          NUMBER         
	GROUP_TAB           NUMBER         
	ROOT                NUMBER         
	DEPTH               NUMBER 
 */
public class QnABoardVO {
	private int no;
	private String id;
	private String subject;
	private String pwd;
	private String regdate;
	private int hit;
	private String answer;
	private String content;
	private QnABoard_ReplyVO qnABoard_ReplyVO;
	
	
	public QnABoard_ReplyVO getQnABoard_ReplyVO() {
		return qnABoard_ReplyVO;
	}
	public void setQnABoard_ReplyVO(QnABoard_ReplyVO qnABoard_ReplyVO) {
		this.qnABoard_ReplyVO = qnABoard_ReplyVO;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	

}
