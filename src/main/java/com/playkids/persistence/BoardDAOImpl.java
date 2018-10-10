package com.playkids.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.SearchCriteria;
import com.playkids.domain.BoardVO;
import com.playkids.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlsession;

	@Override
	public boolean insert_board(BoardVO vo) throws Exception {
		int t = sqlsession.insert("board.insert_board", vo);
		if(t==1) return true;
		else return false;
	}

	@Override
	public boolean delete_board(int bno) throws Exception{
		int t = sqlsession.delete("board.delete_board", bno);
		if(t==1) return true;
		else return false;
	}

	@Override
	public boolean update_board(BoardVO vo) throws Exception{
		int t = sqlsession.update("board.update_board", vo);
		if(t==1) return true;
		else return false;
	}

	@Override
	public BoardVO select_board(int bno) throws Exception {
		return sqlsession.selectOne("board.select_board", bno);
	}
	
	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlsession.selectList("board.listSearch", cri, bound);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return sqlsession.selectOne("board.listSearchCount", cri);
	}
	
	@Override
	public void updateViewCnt(int bno) {
		sqlsession.update("board.updateViewCnt", bno);
	}
	
	@Override
	public List<BoardVO> listNotice() throws Exception {
		return sqlsession.selectList("board.noticelistSearch");
	}
	
	@Override
	public List<String> joinClass_list(String mid) throws Exception{
		return sqlsession.selectList("board.joinclass", mid);
	}
	

}
