package com.playkids.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface StatsService {

	public Map<String,Integer> findAge() throws SQLException;
	public Map<String,Integer> findAct() throws SQLException;
	
	public String findgu(String login_id) throws SQLException;
	public List<String> finddisInterest(String gu) throws SQLException;
	public List<String> findInterest(String gu) throws SQLException;
	
}
