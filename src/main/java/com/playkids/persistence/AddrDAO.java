package com.playkids.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AddrDAO {
	@Inject
	private SqlSession session;
	
	public List<String> selectgugun() throws SQLException{
		return session.selectList("join.selectgugun");
	}
	
	public List<String> selectdong(String gugun) throws SQLException{
		return session.selectList("join.selectdong",gugun);
	}
}
