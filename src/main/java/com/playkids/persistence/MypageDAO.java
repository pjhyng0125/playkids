package com.playkids.persistence;

import java.util.List;

import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;

public interface MypageDAO {
	
	// member ����
	public MemberVO selectMyInfo(String login_id);
	
	// childinfo ����
	public List<ChildInfoVO> selectChild(String login_id);
	public boolean insertChild(ChildInfoVO childInfo);
}
