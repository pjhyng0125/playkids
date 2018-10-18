package com.playkids.service;

import java.util.List; 

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.ReserveVO;
import com.playkids.persistence.ClassInfoDAO;

@Service
public class ClassInfoServiceImpl implements ClassInfoService {

	@Inject
	private ClassInfoDAO dao;
	
	@Override
	public ClassVO select_info(int cno) throws Exception {
		return dao.select_info(cno);
	}

	@Override
	public BusinessVO select_business(String bid) throws Exception {
		return dao.select_business(bid);
	}
	
	@Override
	public void insert_reserve(ReserveVO reserveVO)throws Exception {
		dao.insert_reserve(reserveVO);
	}

	@Override
	public boolean permit_class(int cno) throws Exception {
		return dao.permit_class(cno);
	}

	@Override
	public List<ChildInfoVO> select_babylist(String mid) throws Exception {
		return dao.select_babylist(mid);
	}

	@Override
	public int select_member_cash(String mid) throws Exception {
		return dao.select_member_cash(mid);
	}

	@Override
	public boolean make_reserve(String mid, int cno, int dno) throws Exception {
		return dao.make_reserve(mid, cno, dno);
	}

	@Override
	public boolean set_member_cost(String mid, int mcash) throws Exception {
		return dao.set_member_cost(mid, mcash);
	}

	@Override
	public boolean add_business_profit(String bid, int bprofit) throws Exception {
		return dao.add_business_profit(bid, bprofit);
	}
}
