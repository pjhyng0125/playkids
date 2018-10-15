package com.playkids.service;

import java.util.List;
import java.util.Map;

import com.playkids.domain.MessageVO;

public interface MessageService {
	public boolean insertMessage(MessageVO messageVO);
	public List<MessageVO> selectMessageList(Map<String, Object> map);
	public boolean updateReadTime(String from_id);
	public boolean checkUnreadMessage(String from_id);
}