package com.playkids.persistence;

import java.sql.SQLException;
import java.util.Map;


public interface StatsDAO {
	
	public Map<String, Integer> selectAge() throws SQLException;
	public Map<String, Integer> selectAct() throws SQLException;
	
}
