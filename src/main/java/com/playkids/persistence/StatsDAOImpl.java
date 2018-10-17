package com.playkids.persistence;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StatsDAOImpl implements StatsDAO{
	@Inject
	private SqlSession session;

	@Override
	public Map<String, Integer> selectAge() throws SQLException {
		return session.selectOne("stats.selectAge");
	}

	@Override
	public Map<String, Integer> selectAct() throws SQLException {
		return session.selectOne("stats.selectAct");
	}

	@Override
	public String selectgu(String login_id) throws SQLException {
		return session.selectOne("stats.selectgu", login_id); //gu ¹Þ±â
	}

	@Override
	public List<String> selectdisInterest(String gu) throws SQLException {
		return session.selectList("stats.selectdisInterest", gu);
	}

	@Override
	public List<String> selectInterest(String gu) throws SQLException {
		return session.selectList("stats.selectInterest", gu);
	}
}
