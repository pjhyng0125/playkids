package com.playkids.persistence;

import java.util.List;

import com.playkids.domain.ChildInfoVO;

public interface ChildInfoDAO {
	public boolean insertChild(ChildInfoVO childInfo);
	public List<ChildInfoVO> selectChild(String mid);
}
