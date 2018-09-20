package com.playkids.service;

import java.util.List;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.playkids.domain.ClassListVO;
import com.playkids.domain.Criteria;
import com.playkids.persistence.ClassListDAO;

@Service
public class ClassListServiceImpl implements ClassListService{

	@Inject
	private ClassListDAO classListDAO;
	
	@Override
	public List<ClassListVO> selectClist(Map<String,String> map,Criteria cri) {
		return classListDAO.selectClist(map,cri);
	}

	@Override
	public List<String> selectGu(Map<String,String> map) {
		return classListDAO.selectGu(map);
	}

	@Override
	public int selectTotalCnt(Map<String,String> map) {
		return classListDAO.selectTotalCnt(map);
	}

}
