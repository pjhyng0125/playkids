package com.playkids.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.MessageVO;
import com.playkids.persistence.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;
	
	@Override
	public boolean insertMessage(MessageVO messageVO) {
		return messageDAO.insertMessage(messageVO);
	}

	@Override
	public List<MessageVO> selectMessageList(Map<String, Object> map) {
		return messageDAO.selectMessageList(map);
	}

	@Override
	public boolean updateReadTime(String from_id) {
		return messageDAO.updateReadTime(from_id);
	}

	@Override
	public boolean checkUnreadMessage(String from_id) {
		return messageDAO.checkUnreadMessage(from_id);
	}

	@Override
	public Date selectSendTime(String from_id) {
		return messageDAO.selectSendTime(from_id);
	}

}
