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
	private String name;
	private String subject;
	private String pwd;
	private Date regdate;
	private int hit;
	private String answer;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
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
