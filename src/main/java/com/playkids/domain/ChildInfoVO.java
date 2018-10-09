package com.playkids.domain;

import java.util.Date;

public class ChildInfoVO {
	private int dno;
	private String mid;
	private String dname;
	private String dgender;
	private Date dbirth;
	private int dage;
	
	
	public int getDage() {
		return dage;
	}
	public void setDage(int dage) {
		this.dage = dage;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDgender() {
		return dgender;
	}
	public void setDgender(String dgender) {
		this.dgender = dgender;
	}
	public Date getDbirth() {
		return dbirth;
	}
	public void setDbirth(Date dbirth) {
		this.dbirth = dbirth;
	}
	@Override
	public String toString() {
		return "ChildInfoVO [dno=" + dno + ", mid=" + mid + ", dname=" + dname + ", dgender=" + dgender + ", dbirth="
				+ dbirth + ", dage=" + dage + "]";
	}

	
	
	
}
