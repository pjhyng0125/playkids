package com.playkids.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.Criteria;
import com.playkids.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<ReplyVO> list_reply(int bno,Criteria cri) throws Exception {
		RowBounds rb = new RowBounds(cri.getPageStart(),cri.getPerPageNum() );
		return sqlsession.selectList("reply.list_reply", bno, rb);
	}

	@Override
	public boolean create_reply(ReplyVO vo) throws Exception {
		int t = sqlsession.insert("reply.create_reply", vo);
		if(t==1) return true;
		else return false;
	}

	@Override
	public boolean remove_reply(int rno) throws Exception {
		int t = sqlsession.delete("reply.remove_reply", rno);
		if(t==1) return true;
		else return false;
	}

	@Override
	public boolean update_reply(ReplyVO vo) throws Exception {
		int t = sqlsession.update("reply.update_reply", vo);
		if(t==1) return true;
		else return false;
	}
	
	@Override
	public int count(int bno) throws Exception{
		
		return sqlsession.selectOne("reply.count", bno);
	}

}
