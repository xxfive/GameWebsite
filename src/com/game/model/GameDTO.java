package com.game.model;

public class GameDTO {
	public int num;
	public String name;
	public String userid;
	public String pwd;
	public String pwdck;
	public String email;
	public String phone;
	public int admin;
	
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name == null ? "" : name.trim();
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid == null ? "" : userid.trim();
	}
	public void setUserid(String id) {
		this.userid = id;
	}
	public String getPwd() {
		return pwd == null ? "" : pwd.trim();
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdck() {
		return pwdck == null ? "" : pwdck.trim();
	}
	public void setPwdck(String pwdck) {
		this.pwdck = pwdck;
	}
	public String getEmail() {
		return email == null ? "" : email.trim();
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone == null ? "" : phone.trim();
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	
}
