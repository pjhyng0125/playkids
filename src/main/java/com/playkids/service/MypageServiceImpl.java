package com.playkids.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.playkids.domain.BoardVO;
import com.playkids.domain.BusinessVO;
import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.ClassVO;
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
		return mypageDAO.insertChild(childInfo);
	}

	@Override
	public List<MyClassVO> selectClass(Map<String,String> map) {
		return mypageDAO.selectClass(map);
	}

	@Override
	public boolean updateCash(Map<String,Object> map) {
		return mypageDAO.updateCash(map);
	}

	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public boolean deleteReserve(Map<String, Object> map) {
		if(mypageDAO.deleteReserve(map)){
			if(mypageDAO.updateCash(map)) return true;
		}
		return false;
	}

	@Override
	public boolean updateMyInfo(MemberVO member) {
		return mypageDAO.updateMyInfo(member);
	}

	@Override
	public List<BoardVO> selectMyBoard(String login_id) {
		return mypageDAO.selectMyBoard(login_id);
	}

	@Override
	public BusinessVO selectBusinessInfo(String login_id) {
		return mypageDAO.selectBusinessInfo(login_id);
	}

	@Override
	public List<ClassVO> selectCurrentBClass(String login_id) {
		return mypageDAO.selectCurrentBClass(login_id);
	}

	@Override
	public boolean updateBusinessInfo(BusinessVO business) {
		return mypageDAO.updateBusinessInfo(business);
	}

	@Override
	public List<MyClassVO> selectBusinessPayInfo(Map<String, String> map) {
		return mypageDAO.selectBusinessPayInfo(map);
	}

	@Override
	public List<ClassVO> selectRegClass(String login_id) {
		return mypageDAO.selectRegClass(login_id);
	}

}
