package com.playkids.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;


public interface ClassInfoDAO {
	
	public ClassVO select_info(String cname)throws Exception;
	
	public BusinessVO select_business(String bid)throws Exception;
	
}
