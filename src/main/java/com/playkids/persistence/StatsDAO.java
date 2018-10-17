package com.playkids.persistence;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface StatsDAO {
	
	public Map<String, Integer> selectAge() throws SQLException;
	public Map<String, Integer> selectAct() throws SQLException;
	
	public String selectgu(String login_id) throws SQLException;
	public List<String> selectdisInterest(String gu) throws SQLException;
	public List<String> selectInterest(String gu) throws SQLException;
	
}
