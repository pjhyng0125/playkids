package com.playkids.domain;

public class MemberVO {
	private String mid;
	private String mpw;
	private String mname;
	private String maddress;
	private String mphone;
	private String mbirth;
	private String minterest;
	private String mregdate;
	private String mcash;
	
	private int messageFlag;

	public MemberVO() {
		super();
	}

	
	public MemberVO(String mid, String mpw, String mname, String maddress, String mphone, String mbirth,
			String minterest, String mregdate, String mcash) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.maddress = maddress;
		this.mphone = mphone;
		this.mbirth = mbirth;
		this.minterest = minterest;
		this.mregdate = mregdate;
		this.mcash = mcash;
	}

	
	public int getMessageFlag() {
		return messageFlag;
	}


	public void setMessageFlag(int messageFlag) {
		this.messageFlag = messageFlag;
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

	public String getMregdate() {
		return mregdate;
	}

	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}

	public String getMcash() {
		return mcash;
	}

	public void setMcash(String mcash) {
		this.mcash = mcash;
	}


	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", maddress=" + maddress + ", mphone="
				+ mphone + ", mbirth=" + mbirth + ", minterest=" + minterest + ", mregdate=" + mregdate + ", mcash="
				+ mcash + ", messageFlag=" + messageFlag + "]";
	}

	
}
