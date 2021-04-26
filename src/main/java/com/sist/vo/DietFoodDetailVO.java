package com.sist.vo;
/*
 *  NO               NUMBER         
	UNO              NUMBER         
	TITLE            VARCHAR2(1000) 
	POSTER           VARCHAR2(1000) 
	PRICE            VARCHAR2(100)  
	DETAIL_POSTER    VARCHAR2(4000) 
 */
public class DietFoodDetailVO {
	private int no;
	private int uno;
	private String title;
	private String poster;
	private String price;
	private String detail_poster;
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
	public String getDetail_poster() {
		return detail_poster;
	}
	public void setDetail_poster(String detail_poster) {
		this.detail_poster = detail_poster;
	}
	
}
