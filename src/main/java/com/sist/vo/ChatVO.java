package com.sist.vo;
/*
 * ID          VARCHAR2(40)  
FILENAME    VARCHAR2(200) 
FOODDATE    DATE          
WHENFOOD    NUMBER        
FOODNAME    VARCHAR2(300) 
FOODKCAL    NUMBER    
 * 
 */

import java.util.Date;

public class ChatVO {
	private String id,filename,foodname;
	private int whenfood;
	private Date fooddate;
	private double foodkcal;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public int getWhenfood() {
		return whenfood;
	}
	public void setWhenfood(int whenfood) {
		this.whenfood = whenfood;
	}
	public Date getFooddate() {
		return fooddate;
	}
	public void setFooddate(Date fooddate) {
		this.fooddate = fooddate;
	}
	public double getFoodkcal() {
		return foodkcal;
	}
	public void setFoodkcal(double foodkcal) {
		this.foodkcal = foodkcal;
	}
	
	
}
