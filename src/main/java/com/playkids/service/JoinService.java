package com.playkids.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
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
//�ߺ�üũ	
	public boolean selectidcheck(String checkid);
	public boolean selectidcheckbusin(String checkid);
	public boolean selectphonecheck(String checkphone);
	public boolean selectphonecheckbusin(String checkphone);

	public boolean createclass(ClassVO cv);
	public int getcno(Map<String, String> map);
	public int getcnocount(Map<String, String> map);
	public boolean modifyfile(Map<String, Object> map);
	
	public String selectmemberid(Map<String, String> map);
	public String selectbusinessid(Map<String, String> map);
	public boolean selectmemberpw(Map<String, String> map);
	public boolean selectbusinesspw(Map<String, String> map);
	
	public boolean modifypw(Map<String, String> map);
	public boolean modifypwbusin(Map<String, String> map);
}
