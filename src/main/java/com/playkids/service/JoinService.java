package com.playkids.service;

import java.sql.SQLException;
import java.util.List;

public interface JoinService {

	public List<String> selectgugun() throws SQLException;
	public List<String> selectdong(String gugun) throws SQLException;
	public List<String> selecttype() throws SQLException;
	public List<String> selectact(String ptype) throws SQLException;
}
