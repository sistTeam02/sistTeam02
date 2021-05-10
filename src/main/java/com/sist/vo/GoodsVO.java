package com.sist.vo;
/*
 *  NO     NOT NULL NUMBER        
	TITLE           VARCHAR2(300) 
	POSTER          VARCHAR2(400) 
	PRICE           NUMBER        
	STOCK           VARCHAR2(20)  
 */
public class GoodsVO {
	private int no;
	private String title;
	private String poster;
	private int price;
	private String stockNo;
	private String stock;
	private int cno;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
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
	public String getStockNo() {
		return stockNo;
	}
	public void setStockNo(String stockNo) {
		this.stockNo = stockNo;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	
}
