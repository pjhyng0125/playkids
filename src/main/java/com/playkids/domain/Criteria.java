package com.playkids.domain;

public class Criteria {
    private int page;//0 ����������
    private int perPageNum;//0 ��ȭ�鿡 ������ ���ڵ�(��) ��
	
    
    public Criteria() {
	   //�⺻�� ����(�Ķ���� ������ ������)
       	page=1;
       	perPageNum=5;
	}
    
    //IN  <----- ����� ��û     /board/listCri?page=3&perPageNum=10
    public void setPage(int page) {
    	if(page <=0 ) {
    	  this.page=1;//�߸��� �Ķ���� ���޽� 1�������� �⺻������!!	
    	  return;
    	}
    	this.page=page;
    }
    public void setPerPageNum(int perPageNum) {
        if(perPageNum<=0 || perPageNum>100) {
        	perPageNum=5;//�� �������� ����� �⺻ ���!!
        	return;
        }
    	this.perPageNum=perPageNum;
    }

    //OUT  -----> DAO  ----> XML(sql)
    public int getPageStart() {
    	/*                pageStart(perPage 10)    perPage 20
    	   1�������� ���          0(skip)                      0
    	   2�������� ���        10(skip)                     20
    	   3�������� ���        20(skip)                     40
    	*/
       return (page-1)* perPageNum;
    }
    public int getPerPageNum() {
       return perPageNum;
    }

	public int getPage() {
		return page;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
    
    
    
}
