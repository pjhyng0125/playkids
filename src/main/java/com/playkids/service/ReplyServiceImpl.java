package com.playkids.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.playkids.domain.ReplyVO;
import com.playkids.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> list_reply(int bno) throws Exception {
		return dao.list_reply(bno);
	}

	@Override
	public boolean create_reply(ReplyVO vo) throws Exception {
		return dao.create_reply(vo);
	}

	@Override
	public boolean remove_reply(int rno) throws Exception {
		return dao.remove_reply(rno);
	}

	@Override
	public boolean update_reply(ReplyVO vo) throws Exception {
		return dao.update_reply(vo);
	}

}
