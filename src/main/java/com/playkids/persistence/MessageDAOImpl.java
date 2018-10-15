package com.playkids.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.playkids.domain.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public boolean insertMessage(MessageVO messageVO) {
		int t = sqlsession.insert("qna.insertMessage",messageVO);
		if(t>0) return true;
		return false;
	}

	@Override
	public List<MessageVO> selectMessageList(Map<String, Object> map) {
		return sqlsession.selectList("qna.selectMessageList",map);
	}

	@Override
	public boolean updateReadTime(String from_id) {
		int t = sqlsession.update("qna.updateReadTime",from_id);
		if(t>0) return true;
		return false;
	}

	@Override
	public boolean checkUnreadMessage(String from_id) {
		int t = sqlsession.selectOne("qna.checkUnreadMessage",from_id);
		if(t>0) return true;
		return false;
	}

}
