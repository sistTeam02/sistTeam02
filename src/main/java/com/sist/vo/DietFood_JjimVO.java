package com.sist.vo;

public class DietFood_JjimVO {
	private int no;   // Jjim number
	private int cno;  // Check Number default 0
	private String id;  // member ID
	private int pno;  // 제품 number
	
	private DietFoodVO dvo;
	
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public DietFoodVO getDvo() {
		return dvo;
	}
	public void setDvo(DietFoodVO dvo) {
		this.dvo = dvo;
	}
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}


