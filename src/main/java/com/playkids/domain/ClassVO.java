package com.playkids.domain;

import java.util.Date;

public class ClassVO {
	private int cno;
	private String bid;
	private String ctype;
	private String cname;
	private String cpic;
	private String cage;
	private String cintro;
	private String cdate;
	private String prepare;
	private String notice;
	private int price;
	private String cteachername;
	private String cteacherpic;
	private String cteacher;

	private String park;
	private String protect;
	private String together;

	private Date cregdate;
	private boolean autho;

	public ClassVO() {
		super();
	}

	public ClassVO(int cno, String bid, String ctype, String cname, String cpic, String cage, String cintro,
			String cdate, String prepare, String notice, int price, String cteachername, String cteacherpic,
			String cteacher, String park, String protect, String together, Date cregdate, boolean autho) {
		super();
		this.cno = cno;
		this.bid = bid;
		this.ctype = ctype;
		this.cname = cname;
		this.cpic = cpic;
		this.cage = cage;
		this.cintro = cintro;
		this.cdate = cdate;
		this.prepare = prepare;
		this.notice = notice;
		this.price = price;
		this.cteachername = cteachername;
		this.cteacherpic = cteacherpic;
		this.cteacher = cteacher;
		this.park = park;
		this.protect = protect;
		this.together = together;
		this.cregdate = cregdate;
		this.autho = autho;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
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

	public String getCpic() {
		return cpic;
	}

	public void setCpic(String cpic) {
		this.cpic = cpic;
	}

	public String getCage() {
		return cage;
	}

	public void setCage(String cage) {
		this.cage = cage;
	}

	public String getCintro() {
		return cintro;
	}

	public void setCintro(String cintro) {
		this.cintro = cintro;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getPrepare() {
		return prepare;
	}

	public void setPrepare(String prepare) {
		this.prepare = prepare;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCteachername() {
		return cteachername;
	}

	public void setCteachername(String cteachername) {
		this.cteachername = cteachername;
	}

	public String getCteacherpic() {
		return cteacherpic;
	}

	public void setCteacherpic(String cteacherpic) {
		this.cteacherpic = cteacherpic;
	}

	public String getCteacher() {
		return cteacher;
	}

	public void setCteacher(String cteacher) {
		this.cteacher = cteacher;
	}

	public String getPark() {
		return park;
	}

	public void setPark(String park) {
		this.park = park;
	}

	public String getProtect() {
		return protect;
	}

	public void setProtect(String protect) {
		this.protect = protect;
	}

	public String getTogether() {
		return together;
	}

	public void setTogether(String together) {
		this.together = together;
	}

	public Date getCregdate() {
		return cregdate;
	}

	public void setCregdate(Date cregdate) {
		this.cregdate = cregdate;
	}

	public boolean isAutho() {
		return autho;
	}

	public void setAutho(boolean autho) {
		this.autho = autho;
	}

	@Override
	public String toString() {
		return "ClassVO [cno=" + cno + ", bid=" + bid + ", ctype=" + ctype + ", cname=" + cname + ", cpic=" + cpic
				+ ", cage=" + cage + ", cintro=" + cintro + ", cdate=" + cdate + ", prepare=" + prepare + ", notice="
				+ notice + ", price=" + price + ", cteachername=" + cteachername + ", cteacherpic=" + cteacherpic
				+ ", cteacher=" + cteacher + ", park=" + park + ", protect=" + protect + ", together=" + together
				+ ", cregdate=" + cregdate + ", autho=" + autho + "]";
	}

}
