package com.playkids.service;

import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import com.playkids.domain.BoardVO;
import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.ProfitVO;

public interface AdminService {
	
	public List<MemberVO > selectmember() throws Exception;
	
	public List<BusinessVO> selectbusiness() throws Exception;
	
	public List<ClassVO> selectclassinfo() throws Exception;
	
	public List<BoardVO> selectboard() throws Exception;
	
	public List<ProfitVO> selectprofit() throws Exception;
}
