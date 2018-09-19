package com.playkids.service;

import java.util.List;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;

public interface ClassInfoService {

	public ClassVO select_info(String cname) throws Exception;
	public BusinessVO select_business(String bid) throws Exception;
	
}