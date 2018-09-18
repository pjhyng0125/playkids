package com.playkids.domain;

import java.util.Date;

public class ClassVO {
	private String bid;
	private String ctype;
	private String cname;
	private String cpic;
	private String cage;
	private String cintro;
	private Date cdate;
	private String prepare;
	private String notice;
	private int price;
	private String cteachername;
	private String cteacherpic;
	private String cteacher;
	private Date cregdate;
	private int autho;

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

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
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

	public Date getCregdate() {
		return cregdate;
	}

	public void setCregdate(Date cregdate) {
		this.cregdate = cregdate;
	}

	public int getAutho() {
		return autho;
	}

	public void setAutho(int autho) {
		this.autho = autho;
	}

	@Override
	public String toString() {
		return "ClassVO [bid=" + bid + ", ctype=" + ctype + ", cname=" + cname + ", cpic=" + cpic + ", cage=" + cage
				+ ", cintro=" + cintro + ", cdate=" + cdate + ", prepare=" + prepare + ", notice=" + notice + ", price="
				+ price + ", cteachername=" + cteachername + ", cteacherpic=" + cteacherpic + ", cteacher=" + cteacher
				+ ", cregdate=" + cregdate + ", autho=" + autho + "]";
	}

}
