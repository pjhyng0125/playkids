package com.playkids.domain;

public class ClassCriteria {
	private int page; //0 ����������
	private int perPageNum; //0 �� ȭ�鿡 ������ ���ڵ�(��) ��

	public ClassCriteria() {
		page = 1;
		perPageNum = 20;
	}
	
	//IN <----- ����� ��û /board/list?page=3&perPageNum=10
	public void setPage(int page) {
		if(page<=0) {
			this.page = 1; // �߸��� �Ķ���� ���޽� 1�������� �⺻������!
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum>100) {
			this.perPageNum = 20; // �� �������� ��µ� �⺻ �� ��!
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	//OUT-----> DAO ----> XML(sql)
	public int getPageStart() {
		return (page-1)*perPageNum; //skip
	}
	
	public int getPage() {
		return page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
