package com.playkids.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.ReserveVO;

@Repository
public class ClassInfoDAOImpl implements ClassInfoDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public ClassVO select_info(int cno) throws Exception {
		return sqlSession.selectOne("classInfo.select_info",cno);
	}

	@Override
	public BusinessVO select_business(String bid) throws Exception {
		return sqlSession.selectOne("classInfo.select_business",bid);
	}
	
	@Override
	public void insert_reserve(ReserveVO reserveVO) throws Exception{
		sqlSession.insert("classInfo.insert_reserve",reserveVO);
	}

	@Override
	public boolean permit_class(int cno) throws Exception {
		int t=  sqlSession.update("classInfo.permit_class", cno);
		if(t==1) return true;
		else return false;
	}

	@Override
	public List<ChildInfoVO> select_babylist(String mid) throws Exception {
		return sqlSession.selectList("classInfo.select_babylist", mid);
	}

	@Override
	public int select_member_cash(String mid) throws Exception {
		return sqlSession.selectOne("classInfo.select_member_cash", mid);
	}

	@Override
	public boolean make_reserve(String mid, int cno, int dno) throws Exception {
		Map<Object, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("cno",cno);
		map.put("dno", dno);
		int t = sqlSession.insert("classInfo.make_reserve", map);
		if(t==1) return true;
		else {
			System.out.println("error point>> ClassInfoDAOImpl make_reserve" );
			return false;
		}
	}

	@Override
	public boolean set_member_cost(String mid, int mcash) throws Exception {
		Map<Object, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("mcash", mcash);
		int t= sqlSession.update("classInfo.set_member_cost", map);
		if(t==1) return true;
		else {
			System.out.println("error point>> ClassInfoDAOImpl set_member_cost" );
			return false;
		}
	}

	@Override
	public boolean add_business_profit(String bid, int bprofit) throws Exception {
		Map<Object, Object> map = new HashMap<>();
		map.put("bid", bid);
		map.put("bprofit", bprofit);
		int t= sqlSession.update("classInfo.add_business_profit", map);
		if(t==1) return true;
		else {
			System.out.println("error point>> ClassInfoDAOImpl add_business_profit" );
			return false;
		}
	}
}
