package com.playkids.domain;

public class SearchCriteria extends Criteria{

	private String searchType;	// �˻����� - Ÿ��Ʋ, ����, �ۼ��� ��ɷ� �˻� �� ����
	private String keyword;		// �˻����� 
	
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
		return super.toString()+		// �θ� Criteria�� ������ �Բ� ����ϰڴٴ� �ǹ�
				"SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	
	
}
