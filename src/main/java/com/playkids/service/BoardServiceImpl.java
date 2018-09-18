package com.playkids.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.SearchCriteria;
import com.playkids.domain.BoardVO;
import com.playkids.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;


	@Override
	public boolean insert_page(BoardVO vo)throws Exception {
		return dao.insert_board(vo);
	}

	@Override
	public boolean delete_page(int bno)throws Exception {
		return dao.delete_board(bno);
	}

	@Override
	public boolean update_page(BoardVO vo) throws Exception{
		return dao.update_board(vo);
	}

	@Override
	public BoardVO select_board(int bno) throws Exception{
		dao.updateViewCnt(bno);
		return dao.select_board(bno);
	}
	
	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearchCriteria(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	

}
