package com.playkids.persistence;

import java.util.List;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.MemberVO;

public interface AdminDAO {
	
	public List<MemberVO> admin_member(String mid) throws Exception;
	
	public List<BusinessVO> admin_business(String bid) throws Exception;
}
