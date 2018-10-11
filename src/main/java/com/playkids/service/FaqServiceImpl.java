package com.playkids.service;

import java.util.List;  

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.Criteria;
import com.playkids.domain.FaqVO;
import com.playkids.domain.SearchCriteria;
import com.playkids.persistence.FaqDAO;

@Service
public class FaqServiceImpl implements FaqService{

	@Inject
	private FaqDAO dao;
	
	@Override
	public void create(FaqVO faq) throws Exception {
		dao.create(faq);
	}
	
	@Override
	public FaqVO select_faq(int fno) throws Exception{
		return dao.select_faq(fno);
	}

	@Override
	public List<FaqVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<FaqVO> faq_criteria(Criteria cri) throws Exception {
		return dao.faq_criteria(cri);
	}

	
	@Override
	public int faq_criteriaCount(SearchCriteria cri) throws Exception {
		return dao.faq_criteriaCount(cri);
	}
	
	@Override
	public void update_faq(FaqVO faq) throws Exception{
		dao.update_faq(faq);
	}
	
	@Override
	public void delete_faq(int fno) throws Exception{
		dao.delete_faq(fno);
	}

	

}
