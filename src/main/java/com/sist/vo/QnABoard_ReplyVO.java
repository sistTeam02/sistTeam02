package com.sist.vo;
/*
 * NO               NUMBER        
MNO              NUMBER        
ID      NOT NULL VARCHAR2(34)  
MSG     NOT NULL CLOB          
REGDATE          VARCHAR2(100) 
 * 
 */
public class QnABoard_ReplyVO {
	private int no,mno;
	private String id,msg,regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
