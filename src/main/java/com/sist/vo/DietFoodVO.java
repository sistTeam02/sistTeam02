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
	private GoodsVO goodsvo;
	private String stockNo;
	private String stock;
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
	public GoodsVO getGoodsvo() {
		return goodsvo;
	}
	public void setGoodsvo(GoodsVO goodsvo) {
		this.goodsvo = goodsvo;
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
