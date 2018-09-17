package com.playkids.domain;

public class SearchCriteria extends Criteria{

	private String searchType;	// 검색조건 - 타이틀, 내용, 작성자 어떤걸로 검색 할 건지
	private String keyword;		// 검색내용 
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return super.toString()+		// 부모 Criteria의 정보와 함께 출력하겠다는 의미
				"SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	
}
