package com.playkids.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionException;
import org.springframework.stereotype.Service;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.MemberVO;
import com.playkids.persistence.AdminDAO;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private AdminDAO dao;

	@Override
	public List<MemberVO> selectmember(String mid) throws Exception {
		return dao.admin_member(mid);
	}

	@Override
	public List<BusinessVO> selectbusiness(String bid) throws Exception {

		return dao.admin_business(bid);
	}

	
	
}
