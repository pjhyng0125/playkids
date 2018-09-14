package com.playkids.dbtest;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	@Test
	public void testConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		try(Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
				"playkids", "1234")){
		System.out.println("DB 연결 성공!");
		}
	}
}
