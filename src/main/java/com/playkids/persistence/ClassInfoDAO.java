package com.playkids.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.ReserveVO;


public interface ClassInfoDAO {
	
	public ClassVO select_info(int cno)throws Exception;
	
	public BusinessVO select_business(String bid)throws Exception;

	public void insert_reserve(ReserveVO reserveVO) throws Exception;

	public boolean permit_class(int cno) throws Exception;
	
	public List<ChildInfoVO> select_babylist(String mid) throws Exception;

	public int select_member_cash(String mid) throws Exception;
	
	public boolean make_reserve(String mid, int cno, int dno) throws Exception;
	
	public boolean set_member_cost(String mid, int mcash) throws Exception;
	
	public boolean add_business_profit(String bid, int bprofit) throws Exception;
}
