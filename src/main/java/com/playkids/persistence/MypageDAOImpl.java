package com.playkids.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.MyClassVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public boolean insertChild(ChildInfoVO childInfo) {
		int t = sqlsession.insert("mypage.insertChild",childInfo);
		if(t>0) return true;
		return false;
	}

	@Override
	public List<ChildInfoVO> selectChild(String login_id) {
		return sqlsession.selectList("mypage.selectChild", login_id);
	}

	@Override
	public MemberVO selectMyInfo(String login_id) {
		return sqlsession.selectOne("mypage.selectMyInfo", login_id);
	}

	@Override
	public List<MyClassVO> selectClass(Map map) {
		return sqlsession.selectList("mypage.selectClass",map);
	}

	@Override
	public boolean updateCash(Map map) {
		int t = sqlsession.update("mypage.updateCash",map);
		if(t>0) return true;
		return false;
	}
}