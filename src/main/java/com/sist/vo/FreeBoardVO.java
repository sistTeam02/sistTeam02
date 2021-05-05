package com.sist.vo;

import java.util.Date;

/*
 *  NO      NOT NULL NUMBER         
	ID               VARCHAR2(34)   
	NAME    NOT NULL VARCHAR2(34)   
	SUBJECT NOT NULL VARCHAR2(1000) 
	PWD     NOT NULL VARCHAR2(10)   
	CONTENT NOT NULL CLOB           
	REGDATE          DATE           
	HIT              NUMBER 
 */
public class FreeBoardVO {
	private int no;
	private String id;
	private String name;
	private String subject;
	private String pwd;
	private String content;
	private Date regdate;
	private int hit;
	private MemberVO mvo=new MemberVO();
	
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	

}
