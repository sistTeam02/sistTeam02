package com.sist.vo;

public class YoutubeVO {
	
	private String videoid;
	private String regdate;
	private String title;
	private String thumbnails;
	private String channeltitle;
	private String description;
	private int no;
	private int cno;
	private String poster;
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
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
	public String getChanneltitle() {
		return channeltitle;
	}
	public void setChanneltitle(String channeltitle) {
		this.channeltitle = channeltitle;
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
