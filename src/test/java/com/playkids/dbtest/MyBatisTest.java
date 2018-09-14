package com.playkids.dbtest;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//p.93-94
//MyBatisTest.java
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MyBatisTest {
	@Inject//roor-context.xml의 bean에 접근
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() throws Exception {
		//SqlSessionFactory 객체 테스트
		System.out.println("sqlFactory:"+sqlFactory);
	}

	@Test
	public void testSession() throws Exception {
		//SqlSession(MyBatis에 정의된 sql문 호출하는 객체)객체 테스트
		SqlSession session=sqlFactory.openSession();
		System.out.println("session:"+session);
	}
}
