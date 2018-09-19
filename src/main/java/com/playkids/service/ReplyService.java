package com.playkids.service;

import java.util.List;

import com.playkids.domain.Criteria;
import com.playkids.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> list_reply(int bno,Criteria cri) throws Exception;
	
	public boolean create_reply(ReplyVO vo) throws Exception;
	
	public boolean remove_reply(int rno) throws Exception;
	
	public boolean update_reply(ReplyVO vo) throws Exception;

	public int count(int bno) throws Exception;
}
