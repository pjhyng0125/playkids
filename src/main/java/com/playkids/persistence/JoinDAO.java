package com.playkids.persistence;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;

public interface JoinDAO {
	
	public List<String> listgugun() throws SQLException;
	public List<String> listdong(String gugun) throws SQLException;
	public List<String> listtype() throws SQLException;
	public List<String> listact(String ptype) throws SQLException;
	public boolean insertmember(MemberVO member) throws SQLException;	
	public boolean insertbusiness(BusinessVO business) throws SQLException;
	public boolean loginmember(Map<String, String> map) throws SQLException;
	public boolean loginbusiness(Map<String, String> map) throws SQLException;
//중복체크
	public boolean findidcheck(String checkid);
	public boolean findidcheckbusin(String checkid);
	public boolean findphonecheck(String checkphone);
	public boolean findphonecheckbusin(String checkphone);

	public boolean insertclass(ClassVO cv);
	public int selectcno(Map<String, String> map);
	public int selectcnocount(Map<String, String> map);
	public boolean updatefile(Map<String, Object> map);
	
	public String findmemberid(Map<String, String> map);
	public String findbusinessid(Map<String, String> map);
	public boolean findmemberpw(Map<String, String> map);
	public boolean findbusinesspw(Map<String, String> map);
	
	public boolean updatepw(Map<String, String> map);
	public boolean updatepwbusin(Map<String, String> map);
	
}
