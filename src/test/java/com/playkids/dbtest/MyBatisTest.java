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
	@Inject//roor-context.xml�� bean�� ����
	private SqlSessionFactory sqlFactory;
	
	@Test
	public void testFactory() throws Exception {
		//SqlSessionFactory ��ü �׽�Ʈ
		System.out.println("sqlFactory:"+sqlFactory);
	}

	@Test
	public void testSession() throws Exception {
		//SqlSession(MyBatis�� ���ǵ� sql�� ȣ���ϴ� ��ü)��ü �׽�Ʈ
		SqlSession session=sqlFactory.openSession();
		System.out.println("session:"+session);
	}
}
