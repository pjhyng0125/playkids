package com.playkids.domain;

public class ClassCriteria {
	private int page; //0 현재페이지
	private int perPageNum; //0 한 화면에 보여줄 레코드(행) 수

	public ClassCriteria() {
		page = 1;
		perPageNum = 20;
	}
	
	//IN <----- 사용자 요청 /board/list?page=3&perPageNum=10
	public void setPage(int page) {
		if(page<=0) {
			this.page = 1; // 잘못된 파라미터 전달시 1페이지를 기본페이지!
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0 || perPageNum>100) {
			this.perPageNum = 20; // 한 페이지에 출력될 기본 행 수!
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
