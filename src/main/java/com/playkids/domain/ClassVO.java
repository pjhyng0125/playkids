package com.playkids.domain;

import java.util.Date;

public class ClassVO {
	private String ctype;
	private String cname;
	private Date cdate;
	private String cpic;
	private String bid;
	private String cage;
	private String cintro;
	private String cteacher;
	private String cteacherpic;
	private String prepare;
	private String notice;
	private int price;
	private int autho;

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

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public String getCpic() {
		return cpic;
	}

	public void setCpic(String cpic) {
		this.cpic = cpic;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
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

	public String getCteacher() {
		return cteacher;
	}

	public void setCteacher(String cteacher) {
		this.cteacher = cteacher;
	}

	public String getCteacherpic() {
		return cteacherpic;
	}

	public void setCteacherpic(String cteacherpic) {
		this.cteacherpic = cteacherpic;
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

	public int getAutho() {
		return autho;
	}

	public void setAutho(int autho) {
		this.autho = autho;
	}

	@Override
	public String toString() {
		return "ClassVO [ctype=" + ctype + ", cname=" + cname + ", cdate=" + cdate + ", cpic=" + cpic + ", bid=" + bid
				+ ", cage=" + cage + ", cintro=" + cintro + ", cteacher=" + cteacher + ", cteacherpic=" + cteacherpic
				+ ", prepare=" + prepare + ", notice=" + notice + ", price=" + price + ", autho=" + autho + "]";
	}

}
