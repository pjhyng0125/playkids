package com.playkids.domain;

public class FaqVO {
	private int fno;
	private String fcategory;
	private String ftitle;
	private String fanswer;

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFcategory() {
		return fcategory;
	}

	public void setFcategory(String fcategory) {
		this.fcategory = fcategory;
	}

	public String getFtitle() {
		return ftitle;
	}

	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}

	public String getFanswer() {
		return fanswer;
	}

	public void setFanswer(String fanswer) {
		this.fanswer = fanswer;
	}

	@Override
	public String toString() {
		return "FaqVO [fno=" + fno + ", fcategory=" + fcategory + ", ftitle=" + ftitle + ", fanswer=" + fanswer + "]";
	}

}
