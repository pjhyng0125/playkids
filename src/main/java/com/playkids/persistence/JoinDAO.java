package com.playkids.persistence;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

public interface JoinDAO {
	
	public List<String> listgugun() throws SQLException;
	public List<String> listdong(String gugun) throws SQLException;
	public List<String> listtype() throws SQLException;
	public List<String> listact(String ptype) throws SQLException;
}
