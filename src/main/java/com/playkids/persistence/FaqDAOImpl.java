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
	public FaqVO select_faq(int fno) throws Exception{
		return sqlSession.selectOne("faq.select_faq",fno);
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

	@Override
	public void update_faq(FaqVO faq)throws Exception{
		sqlSession.update("faq.update_faq",faq);
	
	}
	
	@Override
	public void delete_faq(int fno)throws Exception{
		int delCnt = sqlSession.delete("faq.delete_faq",fno);
		System.out.println("delCnt(삭제된행의수)="+delCnt);
	}

}
