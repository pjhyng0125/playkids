package com.playkids.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.BoardVO;
import com.playkids.domain.BusinessVO;
import com.playkids.domain.ChildInfoVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.domain.MyClassVO;

@Repository
public class MypageDAOImpl implements MypageDAO{

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public boolean insertChild(ChildInfoVO childInfo) {
		int t = sqlsession.insert("mypage.insertChild",childInfo);
		if(t>0) return true;
		return false;
	}

	@Override
	public List<ChildInfoVO> selectChild(String login_id) {
		return sqlsession.selectList("mypage.selectChild", login_id);
	}

	@Override
	public MemberVO selectMyInfo(String login_id) {
		return sqlsession.selectOne("mypage.selectMyInfo", login_id);
	}

	@Override
	public List<MyClassVO> selectClass(Map<String,String> map) {
		return sqlsession.selectList("mypage.selectClass",map);
	}

	@Override
	public boolean updateCash(Map<String, Object> map) {
		int t = sqlsession.update("mypage.updateCash",map);
		if(t>0) return true;
		return false;
	}

	@Override
	public boolean deleteReserve(Map<String, Object> map) {
		int t = sqlsession.delete("mypage.deleteReserve",map);
		if(t>0) return true;
		return false;
	}

	@Override
	public boolean updateMyInfo(MemberVO member) {
		int t = sqlsession.update("mypage.updateMyInfo",member);
		if(t>0) return true;
		return false;
	}

	@Override
	public List<BoardVO> selectMyBoard(String login_id) {
		return sqlsession.selectList("mypage.selectMyBoard",login_id);
	}

	
	// business
	@Override
	public BusinessVO selectBusinessInfo(String login_id) {
		return sqlsession.selectOne("mypage.selectBusinessInfo",login_id);
	}

	@Override
	public List<ClassVO> selectCurrentBClass(String login_id) {
		return sqlsession.selectList("mypage.selectCurrentBClass", login_id);
	}

	@Override
	public boolean updateBusinessInfo(BusinessVO business) {
		int t = sqlsession.update("mypage.updateBusinessInfo",business);
		if(t>0) return true;
		return false;
	}

	@Override
	public List<MyClassVO> selectBusinessPayInfo(Map<String, String> map) {
		return sqlsession.selectList("mypage.selectBusinessPayInfo",map);
	}

	@Override
	public List<ClassVO> selectRegClass(String login_id) {
		return sqlsession.selectList("mypage.selectRegClass",login_id);
	}

	@Override
	public boolean insertAdminProfit(Map<String, Object> map) {
		int t = sqlsession.update("mypage.insertAdminProfit",map);
		if(t>0) return true;
		return false;
	}

	@Override
	public boolean updateBusinessProfit(Map<String, Object> map) {
		int t = sqlsession.update("mypage.updateBusinessProfit",map);
		if(t>0) return true;
		return false;
	}

	@Override
	public String selectBid(int rno) {
		return sqlsession.selectOne("mypage.selectBid",rno);
	}

	@Override
	public List<BoardVO> selectBusinessBoard(String login_id) {
		return sqlsession.selectList("mypage.selectBusinessBoard",login_id);
	}


}
