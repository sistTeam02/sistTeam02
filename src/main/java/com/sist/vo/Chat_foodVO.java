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

public class Chat_foodVO {
	private String id,filename,foodname;
	private String whenfood;
	private String fooddate;
	private double foodkcal,foodgram;
	
	public double getFoodgram() {
		return foodgram;
	}
	public void setFoodgram(double foodgram) {
		this.foodgram = foodgram;
	}
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

	public String getWhenfood() {
		return whenfood;
	}
	public void setWhenfood(String whenfood) {
		this.whenfood = whenfood;
	}
	public String getFooddate() {
		return fooddate;
	}
	public void setFooddate(String fooddate) {
		this.fooddate = fooddate;
	}
	public double getFoodkcal() {
		return foodkcal;
	}
	public void setFoodkcal(double foodkcal) {
		this.foodkcal = foodkcal;
	}
	
	
}
