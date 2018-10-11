package com.playkids.service;

import java.util.List;
import java.util.Map;

import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.MyClassVO;

public interface MypageService {
	// member ����
	public MemberVO selectMyInfo(String login_id);
	
	// childinfo ����
	public List<ChildInfoVO> selectChild(String login_id);
	public boolean insertChild(ChildInfoVO childInfo);
	
	//myclass
	public List<MyClassVO> selectClass(Map map);
	
	public boolean updateCash(Map map);
	public boolean deleteReserve(Map<String, Object> map);
}
