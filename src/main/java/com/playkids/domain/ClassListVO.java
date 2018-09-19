package com.playkids.domain;

public class ClassListVO {
	private String ctype;
	private String cname;
	private String cdate;
	private String cpic;
	private String baddress;
	private String cage;
	private int price;
	private int startAge;
	private int endAge;
	
	
	
	public int getStartAge() {
		return startAge;
	}
	public void setStartAge(int startAge) {
		this.startAge = startAge;
	}
	public int getEndAge() {
		return endAge;
	}
	public void setEndAge(int endAge) {
		this.endAge = endAge;
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
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCpic() {
		return cpic;
	}
	public void setCpic(String cpic) {
		this.cpic = cpic;
	}
	public String getBaddress() {
		return baddress;
	}
	public void setBaddress(String baddress) {
		this.baddress = baddress;
	}
	public String getCage() {
		return cage;
	}
	public void setCage(String cage) {
		this.cage = cage;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ClassListVO [ctype=" + ctype + ", cname=" + cname + ", cdate=" + cdate + ", cpic=" + cpic
				+ ", baddress=" + baddress + ", cage=" + cage + ", price=" + price + ", startAge=" + startAge
				+ ", endAge=" + endAge + "]";
	}
	
}
