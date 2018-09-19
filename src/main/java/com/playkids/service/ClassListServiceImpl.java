package com.playkids.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.ClassCriteria;
import com.playkids.domain.ClassListVO;
import com.playkids.domain.ClassVO;
import com.playkids.persistence.ClassListDAO;

@Service
public class ClassListServiceImpl implements ClassListService{

	@Inject
	private ClassListDAO classListDAO;
	
	@Override
	public List<ClassListVO> selectClist(Map map,ClassCriteria classCri) {
		return classListDAO.selectClist(map,classCri);
	}

	@Override
	public List<String> selectGu(Map map) {
		return classListDAO.selectGu(map);
	}

}
