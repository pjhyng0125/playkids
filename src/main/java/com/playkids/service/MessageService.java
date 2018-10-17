package com.playkids.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.playkids.domain.MessageVO;

public interface MessageService {
	public boolean insertMessage(MessageVO messageVO);
	public List<MessageVO> selectMessageList(Map<String, Object> map);
	public boolean updateReadTime(Map<String,Object> map);
	public String checkUnreadMessage(String from_id);
	public Date selectSendTime(String from_id);
	public String selectMname(String mid);
}
