package com.playkids.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberVO> admin_member(String mid) throws Exception{
		return sqlSession.selectList("admin.admin_member", mid);
	}
	
	@Override
	public List<BusinessVO> admin_business(String bid) throws Exception{
		return sqlSession.selectList("admin.admin_business", bid);
	}
}
