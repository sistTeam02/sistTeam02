package com.sist.vo;

public class Homet_pay_inputVO {
	private int no;
	private String id;
	private int cno;
	private String state;
	
	private YoutubeVO yvo = new YoutubeVO();
	
	public YoutubeVO getYvo() {
		return yvo;
	}
	public void setYvo(YoutubeVO yvo) {
		this.yvo = yvo;
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
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
