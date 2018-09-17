package com.playkids.domain;

import java.sql.Date;

public class BoardVO {

	private int bno;					// �Խù� ��ȣ
	private String category;			// �Խù� ī�װ�
	private String mid;					// �ۼ��� - ����id
	private String title;				// ����
	private String content;				// ����
	private Date regdate;				// �ۼ�����
	private int count;					// ��ȸ��
	
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
