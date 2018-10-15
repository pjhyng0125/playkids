package com.playkids.persistence;

import java.util.List;

import com.playkids.domain.BoardVO;
import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.ProfitVO;

public interface AdminDAO {
	
	public List<MemberVO> admin_member() throws Exception;
	
	public List<BusinessVO> admin_business() throws Exception;
	
	public List<ClassVO> admin_classinfo() throws Exception;
	
	public List<BoardVO> admin_board() throws Exception;
	
	public List<ProfitVO> admin_profit() throws Exception;
}
