package com.sist.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/*
 *  NO        NOT NULL NUMBER         
	ID                 VARCHAR2(34)   
	NAME      NOT NULL VARCHAR2(34)   
	SUBJECT   NOT NULL VARCHAR2(1000) 
	PWD       NOT NULL VARCHAR2(10)   
	CONTENT   NOT NULL CLOB           
	REGDATE            DATE           
	FILENAME           VARCHAR2(1000) 
	FILESIZE           VARCHAR2(500)  
	FILECOUNT          NUMBER         
	HIT                NUMBER
 */
public class NoticeBoardVO {
	private int no;
	private String id;
	private String name;
	private String subject;
	private String pwd;
	private String content;
	private Date regdate;
	private String filename;
	private String filesize;
	private int filecount;
	private int hit;
	private String dbday; // 날짜를 변환해서 받는다 
    private List<MultipartFile> files; // 파일업로드시 저장 => 여러개가 넘어온다 
    private MemberVO mvo=new MemberVO();
    
    
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	public int getFilecount() {
		return filecount;
	}
	public void setFilecount(int filecount) {
		this.filecount = filecount;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	

}
