package com.playkids.persistence;

import java.util.List;

import java.util.Map;

import com.playkids.domain.ClassListVO;
import com.playkids.domain.Criteria;

public interface ClassListDAO {
	public List<ClassListVO> selectClist(Map<String, String> map,Criteria cri);
	
	public List<String> selectGu(Map<String, String> map);
	
	public int selectTotalCnt(Map<String, String> map);
}
