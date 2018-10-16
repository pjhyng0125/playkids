package com.playkids.service;

import java.util.List;
import java.util.Map;

import com.playkids.domain.BoardVO;
import com.playkids.domain.BusinessVO;
import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.MyClassVO;

public interface MypageService {
	// member ����
	public MemberVO selectMyInfo(String login_id);
	public boolean updateMyInfo(MemberVO member);
	
	// childinfo ����
	public List<ChildInfoVO> selectChild(String login_id);
	public boolean insertChild(ChildInfoVO childInfo);
	
	//myclass
	public List<MyClassVO> selectClass(Map<String,String> map);
	
	public boolean updateCash(Map<String,Object> map);
	public boolean deleteReserve(Map<String, Object> map);
	
	//myBoard
	public List<BoardVO> selectMyBoard(String login_id);
	
	//business ����
	public BusinessVO selectBusinessInfo(String login_id);
	public List<ClassVO> selectCurrentBClass(String login_id);
	public boolean updateBusinessInfo(BusinessVO business);
	public List<MyClassVO> selectBusinessPayInfo(Map<String,String> map);
	public List<ClassVO> selectRegClass(String login_id);
}
