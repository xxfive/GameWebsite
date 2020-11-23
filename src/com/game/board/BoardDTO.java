package com.game.board;

public class BoardDTO {
	private int num;
	private String writer;
	private String Userid;
	private String Pwd;
	private String content;
	private String subject;
	private String reg_date;
	private int readcount;
	
	public String getUserid() {
		return Userid == null ? "" : Userid.trim();
	}
	public void setUserid(String userid) {
		Userid = userid;
	}
	public String getPwd() {
		return Pwd == null ? "" : Pwd.trim();
	}
	public void setPwd(String pwd) {
		Pwd = pwd;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
}
