package com.sist.vo;
/*
 *  NO        NUMBER         
	UNO       NUMBER         
	TITLE     VARCHAR2(1000) 
	POSTER    VARCHAR2(3000) 
	PRICE     VARCHAR2(40)   
	LINK      VARCHAR2(3000) 
 */
public class DietFoodVO {
	private int no;
	private int uno;
	private String title;
	private String poster;
	private String price;
	private String link;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
}
