package com.playkids.domain;

public class BusinessVO {
	private String bid;
	private String bpw;
	private String bname;
	private String bintro;
	private String bphone;
	private String baddress;
	private String bregdate;
	private String baccount;
	
	public BusinessVO() {
		super();
	}

	public BusinessVO(String bid, String bpw, String bname, String bintro, String bphone, String baddress,
			String bregdate, String baccount) {
		super();
		this.bid = bid;
		this.bpw = bpw;
		this.bname = bname;
		this.bintro = bintro;
		this.bphone = bphone;
		this.baddress = baddress;
		this.bregdate = bregdate;
		this.baccount = baccount;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getBpw() {
		return bpw;
	}

	public void setBpw(String bpw) {
		this.bpw = bpw;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBintro() {
		return bintro;
	}

	public void setBintro(String bintro) {
		this.bintro = bintro;
	}

	public String getBphone() {
		return bphone;
	}

	public void setBphone(String bphone) {
		this.bphone = bphone;
	}

	public String getBaddress() {
		return baddress;
	}

	public void setBaddress(String baddress) {
		this.baddress = baddress;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}

	public String getBaccount() {
		return baccount;
	}

	public void setBaccount(String baccount) {
		this.baccount = baccount;
	}

	@Override
	public String toString() {
		return "BusinessVO [bid=" + bid + ", bpw=" + bpw + ", bname=" + bname + ", bintro=" + bintro + ", bphone="
				+ bphone + ", baddress=" + baddress + ", bregdate=" + bregdate + ", baccount=" + baccount + "]";
	}
	
	
}
