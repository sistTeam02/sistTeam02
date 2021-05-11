package com.sist.vo;

/*
 *  VIDEOID      NOT NULL VARCHAR2(100)  
	REGDATE               VARCHAR2(50)   
	TITLE                 VARCHAR2(1000) 
	THUMBNAILS            VARCHAR2(1000) 
	CHANNELTITLE          VARCHAR2(100)  
	DESCRIPTION           VARCHAR2(2000) 
	NO                    NUMBER       
 */
public class HometPayVO {
	private String videoid;
	private String regdate;
	private String title;
	private String thumbnails;
	private String channelTitle;
	private String description;
	private int no;

	public String getVideoid() {
		return videoid;
	}

	public void setVideoid(String videoid) {
		this.videoid = videoid;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnails() {
		return thumbnails;
	}

	public void setThumbnails(String thumbnails) {
		this.thumbnails = thumbnails;
	}

	public String getChannelTitle() {
		return channelTitle;
	}

	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

}
