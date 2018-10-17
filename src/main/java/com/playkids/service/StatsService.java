package com.playkids.service;

import java.sql.SQLException;
import java.util.Map;


public interface StatsService {

	public Map<String,Integer> findAge() throws SQLException;
	public Map<String,Integer> findAct() throws SQLException;
}
