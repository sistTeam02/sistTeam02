package com.sist.vo;

/*
 *  NO             NUMBER(38)     
	TITLE1         VARCHAR2(4000) 
	TITLE2         VARCHAR2(4000) 
	UPLOADDAY      VARCHAR2(4000) 
	HIT            VARCHAR2(4000) 
	COMMENT_HIT    VARCHAR2(4000) 
	VIDEO          VARCHAR2(4000) 
	VIDEO_TIME     VARCHAR2(4000) 
	VIDEO_PART     VARCHAR2(4000) 
	VIDEO_GRADE    VARCHAR2(4000) 
	VIDEO_KCAL     VARCHAR2(4000) 
	EMBED_TXT      VARCHAR2(4000) 
	EMBED_IMG      VARCHAR2(4000) 
 */
public class HometDetailVO {
	private int no;
	private String title1;
	private String title2;
	private String uploadDay;
	private String hit;
	private String comment_hit;
	private String video;
	private String video_time;
	private String video_part;
	private String video_grade;
	private String video_kcal;
	private String embed_txt;
	private String embed_img;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle1() {
		return title1;
	}

	public void setTitle1(String title1) {
		this.title1 = title1;
	}

	public String getTitle2() {
		return title2;
	}

	public void setTitle2(String title2) {
		this.title2 = title2;
	}

	public String getUploadDay() {
		return uploadDay;
	}

	public void setUploadDay(String uploadDay) {
		this.uploadDay = uploadDay;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public String getComment_hit() {
		return comment_hit;
	}

	public void setComment_hit(String comment_hit) {
		this.comment_hit = comment_hit;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getVideo_time() {
		return video_time;
	}

	public void setVideo_time(String video_time) {
		this.video_time = video_time;
	}

	public String getVideo_part() {
		return video_part;
	}

	public void setVideo_part(String video_part) {
		this.video_part = video_part;
	}

	public String getVideo_grade() {
		return video_grade;
	}

	public void setVideo_grade(String video_grade) {
		this.video_grade = video_grade;
	}

	public String getVideo_kcal() {
		return video_kcal;
	}

	public void setVideo_kcal(String video_kcal) {
		this.video_kcal = video_kcal;
	}

	public String getEmbed_txt() {
		return embed_txt;
	}

	public void setEmbed_txt(String embed_txt) {
		this.embed_txt = embed_txt;
	}

	public String getEmbed_img() {
		return embed_img;
	}

	public void setEmbed_img(String embed_img) {
		this.embed_img = embed_img;
	}

}
