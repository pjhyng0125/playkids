package com.playkids.domain;

import java.util.Date;

public class MyClassVO {
	private int cno;
	private String ctype;
	private String cname;
	private String dname;
	private Date dbirth; 
	private Date regdate;
	private int dage;
	private int price;
	
	
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDage() {
		return dage;
	}
	public void setDage(int dage) {
		this.dage = dage;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public Date getDbirth() {
		return dbirth;
	}
	public void setDbirth(Date dbirth) {
		this.dbirth = dbirth;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MyClassVO [cno=" + cno + ", ctype=" + ctype + ", cname=" + cname + ", dname=" + dname + ", dbirth="
				+ dbirth + ", regdate=" + regdate + ", dage=" + dage + ", price=" + price + "]";
	}



	
}
