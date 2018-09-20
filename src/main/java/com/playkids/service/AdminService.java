package com.playkids.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.MemberVO;

public interface AdminService {
	
	public List<MemberVO > selectmember(String mid) throws Exception;
	public List<BusinessVO> selectbusiness(String bid) throws Exception;
}
