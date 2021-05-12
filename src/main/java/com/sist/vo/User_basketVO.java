package com.sist.vo;
/*
 *  ID                  VARCHAR2(40)   고객id
	NO         NOT NULL NUMBER         고유키
	PNO                 NUMBER         제품번호
	TITLE               VARCHAR2(1000) 
	POSTER              VARCHAR2(400)  
	PRICE               NUMBER         
	ORDERCOUNT          NUMBER   기본값 1
	CNO                 NUMBER   카테고리 번호(0:운동용품, 1:다이어트식품)
	ORDDATE             DATE 
	STATE				NUMBER   결제 상태(기본값 0) 
	ADDRESS              VARCHAR2(500)  
	TOTAL_PRICE          NUMBER         
 */
import java.util.*;
public class User_basketVO {
	private String id;  // 고객 id
	private int no;     // 고유키
	private int pno;    // 제품번호
	private String title;
	private String poster;
	private String price;
	private int ordercount;  // (default 1)
	private int cno;     // 카테고리 번호
	private Date orddate;
	private int state;   // 결제상태(default 0)
	private String address;
	private String trainer;
	private GoodsVO gvo=new GoodsVO();
	private DietFoodVO dvo=new DietFoodVO();
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public GoodsVO getGvo() {
		return gvo;
	}
	public void setGvo(GoodsVO gvo) {
		this.gvo = gvo;
	}
	public DietFoodVO getDvo() {
		return dvo;
	}
	public void setDvo(DietFoodVO dvo) {
		this.dvo = dvo;
	}
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTrainer() {
		return trainer;
	}
	public void setTrainer(String trainer) {
		this.trainer = trainer;
	}
	
}
