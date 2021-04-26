package com.sist.vo;
/*
 *  NO               NUMBER        
	TITLE            VARCHAR2(300) 
	POSTER           VARCHAR2(400) 
	PRICE            NUMBER        
	DETAIL_POSTER    CLOB          
 */
public class GoodsDetailVO {
	private int no;
	private String title;
	private String poster;
	private int price;
	private String detail_poster;
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
	public String getDetail_poster() {
		return detail_poster;
	}
	public void setDetail_poster(String detail_poster) {
		this.detail_poster = detail_poster;
	}
	
}
