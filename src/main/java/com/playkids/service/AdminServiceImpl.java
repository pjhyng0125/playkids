package com.playkids.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionException;
import org.springframework.stereotype.Service;

import com.playkids.domain.BoardVO;
import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.ProfitVO;
import com.playkids.persistence.AdminDAO;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO dao;

	@Override
	public List<MemberVO> selectmember() throws Exception {
		return dao.admin_member();
	}

	@Override
	public List<BusinessVO> selectbusiness() throws Exception {

		return dao.admin_business();
	}

	@Override
	public List<ClassVO> selectclassinfo() throws Exception {

		return dao.admin_classinfo();
	}

	@Override
	public List<BoardVO> selectboard() throws Exception {

		return dao.admin_board();
	}

	@Override
	public List<ProfitVO> selectprofit() throws Exception {
		return dao.admin_profit();
	}
	
	@Override
	public boolean insert_notice(BoardVO vo) throws Exception {
		return dao.insert_notice(vo);
	}

	
	
}
