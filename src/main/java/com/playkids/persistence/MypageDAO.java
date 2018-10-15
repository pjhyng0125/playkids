package com.playkids.persistence;

import java.util.List;
import java.util.Map;

import com.playkids.domain.BoardVO;
import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.MyClassVO;

public interface MypageDAO {
	
	// member 전용
	public MemberVO selectMyInfo(String login_id);
	public boolean updateMyInfo(MemberVO member);
	
	// childinfo 전용
	public List<ChildInfoVO> selectChild(String login_id);
	public boolean insertChild(ChildInfoVO childInfo);
	
	//myboard
	public List<BoardVO> selectMyBoard(String login_id);
	//myclass
	public List<MyClassVO> selectClass(Map<String, String> map);
	
	public boolean updateCash(Map<String, Object> map);
	
	public boolean deleteReserve(Map<String, Object> map);
}
