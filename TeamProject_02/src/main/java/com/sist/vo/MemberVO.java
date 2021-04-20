package com.sist.vo;
// 회원
/*
	ID                VARCHAR2(34)  
	PWD               VARCHAR2(15)  
	NAME              VARCHAR2(23)  
	BIRTH             VARCHAR2(10)  
	TEL               VARCHAR2(13)  
	PHONE             VARCHAR2(13)  
	EMAIL             VARCHAR2(50)  
	POST              NUMBER        
	NICKNAME          VARCHAR2(50)  
	ADDR1             VARCHAR2(200) 
	ADDR2             VARCHAR2(200) 
	ADMIN             VARCHAR2(2)   
 */
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String birth;
	private String tel;
	private String phone;
	private String email;
	private String post;
	private String nickname;
	private String addr1;
	private String addr2;
	private String admin;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	
}
