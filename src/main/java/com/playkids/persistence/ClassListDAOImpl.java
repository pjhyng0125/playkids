package com.playkids.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.ClassCriteria;
import com.playkids.domain.ClassListVO;
import com.playkids.domain.ClassVO;

@Repository
public class ClassListDAOImpl implements ClassListDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<ClassListVO> selectClist(Map map,ClassCriteria classCri) {
		RowBounds bounds = new RowBounds(classCri.getPageStart(), classCri.getPerPageNum()); 
		return sqlsession.selectList("classList.selectClist", map,bounds);
	}

	@Override
	public List<String> selectGu(Map map) {
		return sqlsession.selectList("classList.selectGu", map);
	}

}
