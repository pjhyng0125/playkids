package com.playkids.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.persistence.JoinDAO;

@Service
public class JoinServiceImpl implements JoinService{
	@Inject
	JoinDAO joindao;

	@Override
	public List<String> selectgugun() throws SQLException {
		return joindao.listgugun();
	}

	@Override
	public List<String> selectdong(String gugun) throws SQLException {
		return joindao.listdong(gugun);
	}

	@Override
	public List<String> selecttype() throws SQLException {
		return joindao.listtype();
	}

	@Override
	public List<String> selectact(String ptype) throws SQLException {
		return joindao.listact(ptype);
	}

	@Override
	public boolean createmember(MemberVO member) throws SQLException {
		return joindao.insertmember(member);
	}

	@Override
	public boolean createbusiness(BusinessVO business) throws SQLException {
		return joindao.insertbusiness(business);
	}

	@Override
	public boolean findmember(Map<String, String> map) throws SQLException {
		return joindao.loginmember(map);
	}
	
	@Override
	public boolean findbusiness(Map<String, String> map) throws SQLException {
		return joindao.loginbusiness(map);
	}

	@Override
	public boolean selectidcheck(String checkid) {
		return joindao.findidcheck(checkid);
	}

	@Override
	public boolean selectidcheckbusin(String checkid) {
		return joindao.findidcheckbusin(checkid);
	}
	
	@Override
	public boolean selectphonecheck(String checkphone) {
		return joindao.findphonecheck(checkphone);
	}

	@Override
	public boolean selectphonecheckbusin(String checkphone) {
		return joindao.findphonecheckbusin(checkphone);
	}

	@Override
	public boolean createclass(ClassVO cv) {
		return joindao.insertclass(cv);
	}

	@Override
	public int getcno(Map<String, String> map) {
		return joindao.selectcno(map);
	}

	@Override
	public boolean modifyfile(Map<String, Object> map) {
		return joindao.updatefile(map);
	}

	@Override
	public int getcnocount(Map<String, String> map) {
		return joindao.selectcnocount(map);
	}

	@Override
	public String selectmemberid(Map<String, String> map) {
		return joindao.findmemberid(map);
	}

	@Override
	public String selectbusinessid(Map<String, String> map) {
		return joindao.findbusinessid(map);
	}

	@Override
	public boolean selectmemberpw(Map<String, String> map) {
		return joindao.findmemberpw(map);
	}

	@Override
	public boolean selectbusinesspw(Map<String, String> map) {
		return joindao.findbusinesspw(map);
	}

	
	

}
