package com.playkids.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;

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
}
