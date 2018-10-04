package com.playkids.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;

@Repository
public class ClassInfoDAOImpl implements ClassInfoDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public ClassVO select_info(int cno) throws Exception {
		return sqlSession.selectOne("classInfo.select_info",cno);
	}

	@Override
	public BusinessVO select_business(String bid) throws Exception {
		return sqlSession.selectOne("classInfo.select_business",bid);
	}

	

}
