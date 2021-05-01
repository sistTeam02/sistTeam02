package com.sist.vo;
/*
 *  NO            NUMBER(38)     
	TITLE         VARCHAR2(4000) 
	TITLE_LINK    VARCHAR2(4000) 
	POSTER        VARCHAR2(4000) 
	PART          VARCHAR2(4000) 
	GOOD          VARCHAR2(4000) 
 */
public class HometMainVO {
	private int no;
	private String title;
	private String title_link;
	private String poster;
	private String part;
	private String good;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle_link() {
		return title_link;
	}
	public void setTitle_link(String title_link) {
		this.title_link = title_link;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	
	
}
