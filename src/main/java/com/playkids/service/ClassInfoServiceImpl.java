package com.playkids.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.persistence.ClassInfoDAO;

@Service
public class ClassInfoServiceImpl implements ClassInfoService {

	@Inject
	private ClassInfoDAO dao;
	
	@Override
	public ClassVO select_info(int cno) throws Exception {
		return dao.select_info(cno);
	}

	@Override
	public BusinessVO select_business(String bid) throws Exception {
		return dao.select_business(bid);
	}

}
