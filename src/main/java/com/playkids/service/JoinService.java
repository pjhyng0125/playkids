package com.playkids.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.MemberVO;

public interface JoinService {

	public List<String> selectgugun() throws SQLException;
	public List<String> selectdong(String gugun) throws SQLException;
	public List<String> selecttype() throws SQLException;
	public List<String> selectact(String ptype) throws SQLException;
	public boolean createmember(MemberVO member) throws SQLException;
	boolean createbusiness(BusinessVO business) throws SQLException;
	boolean findmember(Map<String, String> map) throws SQLException;
	boolean findbusiness(Map<String, String> map) throws SQLException;
	public boolean selectidcheck(String checkid);
	public boolean selectidcheckbusin(String checkid);
}
