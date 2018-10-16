package com.playkids.domain;

import java.util.Date;

public class ReserveVO {

	private int rno;
	private String mid; /* 회원아이디 */
	private int cno; /* 클래스 아이디 */
	private int dno; /* 자녀 아이디 */
	private Date regdate;/* 확정일 */

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReserveVO [rno=" + rno + ", mid=" + mid + ", cno=" + cno + ", dno=" + dno + ", regdate=" + regdate
				+ "]";
	}

}
