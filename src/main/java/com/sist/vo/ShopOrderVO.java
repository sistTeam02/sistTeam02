package com.sist.vo;

import java.util.Date;

/*
 *  ONO     NOT NULL varchar2(50)        
	ID               VARCHAR2(50)  
	NAME             VARCHAR2(34)  
	POST             NUMBER        
	ADDR1            VARCHAR2(100) 
	ADDR2            VARCHAR2(50)  
	TEL              VARCHAR2(13)  
	AMOUNT           NUMBER        
	ORDDATE          DATE          
 */
public class ShopOrderVO {
	private String ono;
	private String id;
	private String name;
	private int post;
	private String addr1;
	private String addr2;
	private String tel;
	private int amount;
	private Date orddate;
	
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getOrddate() {
		return orddate;
	}
	public void setOrddate(Date orddate) {
		this.orddate = orddate;
	}
	
}
