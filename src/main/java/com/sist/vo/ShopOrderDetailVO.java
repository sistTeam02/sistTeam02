package com.sist.vo;
/*
 *  ODNO  NOT NULL NUMBER       
	ID             VARCHAR2(50) 
	PNO            NUMBER       
	STOCK          NUMBER       
 */
public class ShopOrderDetailVO {
	private int odno;
	private String id;
	private int pno;
	private int stock;
	public int getOdno() {
		return odno;
	}
	public void setOdno(int odno) {
		this.odno = odno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}
