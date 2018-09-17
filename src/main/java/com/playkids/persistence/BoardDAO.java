package com.playkids.persistence;

import java.util.List;

import com.playkids.domain.BoardVO;
import com.playkids.domain.SearchCriteria;

public interface BoardDAO {

	public List<BoardVO> select_list() throws Exception;
	
	public boolean insert_board(BoardVO vo) throws Exception;
	
	public boolean delete_board(int bno) throws Exception;
	
	public boolean update_board(BoardVO vo) throws Exception;
	
	public BoardVO select_board(int bno) throws Exception;

	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
