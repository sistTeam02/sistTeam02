package com.sist.vo;
/*
 * NO         NOT NULL NUMBER         
CNO                 NUMBER         
CATEGORY            VARCHAR2(100)  
TITLE               VARCHAR2(50)   
REGDATE             VARCHAR2(50)   
POSTER              VARCHAR2(1000) 
ADDR                VARCHAR2(1000) 
SUBWAYINFO          VARCHAR2(1000) 
TAG                 VARCHAR2(1000) 
 */
public class WalkVO {
	private int no;
	private int cno;
	private String category;
	private String title;
	private String regdate;
	private String poster;
	private String addr;
	private String subwayinfo;
	private String tag;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSubwayinfo() {
		return subwayinfo;
	}
	public void setSubwayinfo(String subwayinfo) {
		this.subwayinfo = subwayinfo;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
}
