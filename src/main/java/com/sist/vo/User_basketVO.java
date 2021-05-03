package com.sist.vo;
/*
 *  ID                  VARCHAR2(40)   
	NO         NOT NULL NUMBER         
	PNO                 NUMBER         
	TITLE               VARCHAR2(1000) 
	POSTER              VARCHAR2(400)  
	PRICE               NUMBER         
	ORDERCOUNT          NUMBER         
	CNO                 NUMBER   
	ORDDATE             DATE       
	STATE				NUMBER         
 */
import java.util.*;
public class User_basketVO {
	private String id;  // 고객 id
	private int no;     // 고유키
	private int pno;    // 제품번호
	private String title;
	private String poster;
	private int price;
	private int ordercount;  // (default 1)
	private int cno;     // 카테고리 번호
	private Date orddate;
	private int state;   // 결제상태(default 0)
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOrdercount() {
		return ordercount;
	}
	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public Date getOrddate() {
		return orddate;
	}
	public void setOrddate(Date orddate) {
		this.orddate = orddate;
	}
	
}
