package com.playkids.service;

import java.util.List;
import java.util.Map;

import com.playkids.domain.BoardVO;
import com.playkids.domain.SearchCriteria;

public interface BoardService {

	public boolean insert_page(BoardVO vo)throws Exception;

	public boolean delete_page(int bno)throws Exception;
	
	public boolean update_page(BoardVO vo)throws Exception;
	
	public BoardVO select_board(int bno)throws Exception;

	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public List<BoardVO> listNotice() throws Exception;

	//public List<String> listClass(String mid) throws Exception;
	public  List<Map> listClass(String mid) throws Exception;
}
