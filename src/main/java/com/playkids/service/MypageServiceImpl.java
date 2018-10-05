package com.playkids.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;
import com.playkids.persistence.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService{

	@Inject
	private MypageDAO mypageDAO;
	
	@Override
	public MemberVO selectMyInfo(String login_id) {
		return mypageDAO.selectMyInfo(login_id);
	}

	@Override
	public List<ChildInfoVO> selectChild(String login_id) {
		return mypageDAO.selectChild(login_id);
	}

	@Override
	public boolean insertChild(ChildInfoVO childInfo) {
		if(mypageDAO.insertChild(childInfo)) return true;
		return false;
	}

}
