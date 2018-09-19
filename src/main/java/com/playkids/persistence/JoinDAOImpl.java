package com.playkids.persistence;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.MemberVO;

@Repository
public class JoinDAOImpl implements JoinDAO{
	@Inject
	private SqlSession session;
	
	public List<String> listgugun() throws SQLException{
		return session.selectList("join.selectgugun");
	}
	
	public List<String> listdong(String gugun) throws SQLException{
		return session.selectList("join.selectdong",gugun);
	}

	@Override
	public List<String> listtype() throws SQLException {
		return session.selectList("join.selecttype");
	}

	@Override
	public List<String> listact(String ptype) throws SQLException {
		return session.selectList("join.selectact",ptype);
	}

	@Override
	public boolean insertmember(MemberVO member) throws SQLException {
		int n=session.insert("join.insertmember", member);
		if(n==1)
			return true;
		else
			return false;
	}

	@Override
	public boolean insertbusiness(BusinessVO business) throws SQLException {
		int n=session.insert("join.insertbusiness", business);
		if(n==1)
			return true;
		else
			return false;
	}

	@Override
	public boolean loginmember(Map<String, String> map) throws SQLException {
		int n=session.selectOne("join.loginmember", map);
		if(n==1)
			return true;
		else
			return false;
	}

	@Override
	public boolean loginbusiness(Map<String, String> map) throws SQLException {
		int n=session.selectOne("join.loginbusiness", map);
		if(n==1)
			return true;
		else
			return false;
	}

	@Override
	public boolean findidcheck(String checkid) {
		int n=session.selectOne("join.findidcheck",checkid);
		if(n==1)
			return true;
		else
			return false;
	}

	@Override
	public boolean findidcheckbusin(String checkid) {
		int n=session.selectOne("join.findidcheckbusin",checkid);
		if(n==1)
			return true;
		else
			return false;
	}
}
