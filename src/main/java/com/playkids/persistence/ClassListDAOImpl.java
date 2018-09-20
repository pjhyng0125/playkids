package com.playkids.persistence;

import java.util.List;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.ClassListVO;
import com.playkids.domain.Criteria;

@Repository
public class ClassListDAOImpl implements ClassListDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<ClassListVO> selectClist(Map<String,String> map,Criteria cri) {
		RowBounds bounds = new RowBounds(cri.getPageStart(), cri.getPerPageNum()); 
		return sqlsession.selectList("classList.selectClist", map,bounds);
	}

	@Override
	public List<String> selectGu(Map<String,String> map) {
		return sqlsession.selectList("classList.selectGu", map);
	}

	@Override
	public int selectTotalCnt(Map<String,String> map) {
		return sqlsession.selectOne("classList.selectTotalCnt");
	}

}
