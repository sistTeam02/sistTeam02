package com.sist.vo;
/*
 * "NO" NUMBER, 
	"BNO" NUMBER, 
	"ID" VARCHAR2(20 BYTE) CONSTRAINT "WR_ID_NN" NOT NULL ENABLE, 
	"NAME" VARCHAR2(34 BYTE) CONSTRAINT "WR_NAME_NN" NOT NULL ENABLE, 
	"MSG" CLOB CONSTRAINT "WR_MSG_NN" NOT NULL ENABLE, 
	"REGDATE" DATE DEFAULT sysdate, 
	"GROUP_ID" NUMBER, 
	"GROUP_STEP" NUMBER DEFAULT 0, 
	"GROUP_TAB" NUMBER DEFAULT 0, 
	"ROOT" NUMBER DEFAULT 0, 
	"DEPTH" NUMBER DEFAULT 0, 
	 CONSTRAINT "WR_NO_PK" PRIMARY KEY ("NO")
 */

import java.util.Date;

public class WalkReplyVO {
	private int no;
	private int bno;
	private String id;
	private String name;
	private String msg;
	private Date regdate;
	private int group_id, group_step, group_tab, root, depth;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
}
