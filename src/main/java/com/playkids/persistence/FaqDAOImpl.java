package com.playkids.persistence;

import java.util.List; 


import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.Criteria;
import com.playkids.domain.FaqVO;
import com.playkids.domain.SearchCriteria;

@Repository
public class FaqDAOImpl implements FaqDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(FaqVO faq) throws Exception {
		sqlSession.insert("faq.create",faq);
	}

	@Override
	public List<FaqVO> listAll() throws Exception {
		return sqlSession.selectList("faq.listAll");		
	}

	@Override
	public List<FaqVO> faq_criteria(Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("faq.listAll",null,bound);
	}

	@Override
	public int faq_criteriaCount(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne("faq.listSearchCount", cri);
	}


}
