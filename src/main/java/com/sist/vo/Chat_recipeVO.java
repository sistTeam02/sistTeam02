package com.sist.vo;
/*
 * NO                      NUMBER         
TITLE          NOT NULL VARCHAR2(2000) 
POSTER                  VARCHAR2(260)  
INFO                    VARCHAR2(4000) 
INGRE                   VARCHAR2(4000) 
CONTENT_POSTER          VARCHAR2(4000) 
CONTENT                 VARCHAR2(4000) 
 * 
 */
public class Chat_recipeVO {
	private int no;
	private String title,poster,info,ingre,content,content_poster;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getIngre() {
		return ingre;
	}
	public void setIngre(String ingre) {
		this.ingre = ingre;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent_poster() {
		return content_poster;
	}
	public void setContent_poster(String content_poster) {
		this.content_poster = content_poster;
	}
	
}
