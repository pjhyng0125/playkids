package com.playkids.service;

import java.util.List;

import com.playkids.domain.Criteria;
import com.playkids.domain.FaqVO;
import com.playkids.domain.SearchCriteria;

public interface FaqService {
	
	public void create(FaqVO faq)throws Exception;
	
	public List<FaqVO> listAll()throws Exception;
	
	public List<FaqVO> faq_criteria(Criteria cri)throws Exception;

	public int faq_criteriaCount(SearchCriteria cri)throws Exception;

	public void update_faq(FaqVO faq) throws Exception;

	public void delete_faq(int fno) throws Exception;

	public FaqVO select_faq(int fno) throws Exception;


}
