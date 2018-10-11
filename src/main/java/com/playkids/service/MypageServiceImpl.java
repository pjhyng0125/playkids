package com.playkids.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.MyClassVO;
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

	@Override
	public List<MyClassVO> selectClass(Map map) {
		return mypageDAO.selectClass(map);
	}

	@Override
	public boolean updateCash(Map map) {
		if(mypageDAO.updateCash(map)) return true;
		return false;
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public boolean deleteReserve(Map<String, Object> map) {
		if(mypageDAO.deleteReserve(map)){
			if(mypageDAO.updateCash(map)) return true;
		}
		return false;
	}

}
