package com.playkids.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	// �ϴ� ��ȣ ���
	private int startPage;	// ���۹�ȣ
	private int endPage;	// ����ȣ
	
	private int totalRecord;	// db�� ��ü �� ��
	private int displayPageNum = 5;	// �� ������ ���� ���� [1]~[10]
	
	private Criteria cri;
	
	private boolean prev;	// << ��ư ���
	private boolean next;	// >> ��ư ���
	
	
	public String makeQuery(int page) {		// url ������ el�� �����Ͽ� �ش� �ּҷ� �̾����� ��
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
									  .queryParam("page", page)
									  .queryParam("perPageNum", cri.getPerPageNum())
									  .build();
		return uriComponents.toUriString();
	}
	
	
	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		calcNum();
	}
	
	private void calcNum() {
		// ��ü �� ���� �� ȭ�鿡 ������ ���ڵ� ���� ���� startPage�� endPage�� ���ϱ� 
		endPage = (int)  Math.ceil(cri.getPage() / (double)displayPageNum)*displayPageNum ;
		                               // 3/10
		                                // 0.3  ---> 1 * 10
		System.out.println("endPageNum>>>"+ endPage);
				
		startPage=endPage-(displayPageNum-1);
		           // 10   - 9            		
		System.out.println("��ü���ڵ��>>>"+ totalRecord);
		int realEndPage = (int) Math.ceil(totalRecord/(double)cri.getPerPageNum());
		         // 5
		System.out.println("realEndPageNum>>>"+ realEndPage);
		
		if(endPage > realEndPage) {
			endPage=realEndPage;	
		}
		
		if(startPage!=1) prev= true;
		
		if(endPage != realEndPage) next=true;
	}
	
	public String makeSearch(int page) {	// url �������ڿ� ����
		
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
									  .queryParam("page", page)
									  .queryParam("perPageNum", cri.getPerPageNum())
									  .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
									  .queryParam("keyword",
											  				encoding(
											  					((SearchCriteria)cri).getKeyword()
											  						)
											  	
											  )
									  .build();
		
		return uriComponents.toString();
	}
	
	private String encoding(String str) {
		if(str==null|| str.trim().length()==0) return "";
		
		try {
			str = URLEncoder.encode(str, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}

	@Override
	public String toString() {
		return "PageMaker [startPage=" + startPage + ", endPage=" + endPage + ", totalRecord=" + totalRecord
				+ ", displayPageNum=" + displayPageNum + ", cri=" + cri + ", prev=" + prev + ", next=" + next + "]";
	}
	
	
	
}
