package com.playkids.domain;

public class MemberVO {
	private String mid;
	private String mpw;
	private String mname;
	private String maddress;
	private String mphone;
	private String mbirth;
	private String minterest;
	
	public MemberVO() {
		super();
	}

	public MemberVO(String mid, String mpw, String mname, String maddress, String mphone, String mbirth,
			String minterest) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.maddress = maddress;
		this.mphone = mphone;
		this.mbirth = mbirth;
		this.minterest = minterest;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMinterest() {
		return minterest;
	}

	public void setMinterest(String minterest) {
		this.minterest = minterest;
	}

	@Override
	public String toString() {
		return "Member [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", maddress=" + maddress + ", mphone="
				+ mphone + ", mbirth=" + mbirth + ", minterest=" + minterest + "]";
	}
}
