package com.playkids.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.BoardVO;
import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> admin_member() throws Exception{
		return sqlSession.selectList("admin.admin_member");
	}
	
	@Override
	public List<BusinessVO> admin_business() throws Exception{
		return sqlSession.selectList("admin.admin_business");
	}

	@Override
	public List<ClassVO> admin_classinfo() throws Exception {
		return sqlSession.selectList("admin.admin_classinfo");
	}

	@Override
	public List<BoardVO> admin_board() throws Exception {
		return sqlSession.selectList("admin.admin_board");
	}
}
