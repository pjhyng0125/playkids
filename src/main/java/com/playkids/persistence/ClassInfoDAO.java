package com.playkids.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.ReserveVO;


public interface ClassInfoDAO {
	
	public ClassVO select_info(int cno)throws Exception;
	
	public BusinessVO select_business(String bid)throws Exception;

	public void insert_reserve(ReserveVO reserveVO) throws Exception;


	
}
