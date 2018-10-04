package com.playkids.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.ChildInfoVO;

@Repository
public class ChildInfoDAOImpl implements ChildInfoDAO{

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public boolean insertChild(ChildInfoVO childInfo) {
		int t = sqlsession.insert("mypage.insertChild",childInfo);
		if(t>0) return true;
		return false;
	}

	@Override
	public List<ChildInfoVO> selectChild(String mid) {
		return sqlsession.selectList("mypage.selectChild", mid);
	}

}
