package com.playkids.service;

import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.persistence.StatsDAO;

@Service
public class StatsServiceImpl implements StatsService{
	@Inject
	StatsDAO statsdao;

	@Override
	public Map<String, Integer> findAge() throws SQLException {
		return statsdao.selectAge();
	}

	@Override
	public Map<String, Integer> findAct() throws SQLException {
		return statsdao.selectAct();
	}

}
