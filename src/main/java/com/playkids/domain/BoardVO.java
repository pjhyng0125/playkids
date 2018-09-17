package com.playkids.domain;

import java.sql.Date;

public class BoardVO {

	private int bno;					// 게시물 번호
	private String category;			// 게시물 카테고리
	private String mid;					// 작성자 - 유저id
	private String title;				// 제목
	private String content;				// 내용
	private Date regdate;				// 작성일자
	private int count;					// 조회수
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", category=" + category + ", mid=" + mid + ", title=" + title + ", content="
				+ content + ", regdate=" + regdate + ", count=" + count + "]";
	}
}
