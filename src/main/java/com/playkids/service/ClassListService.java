package com.playkids.service;

import java.util.List;
import java.util.Map;

import com.playkids.domain.ClassCriteria;
import com.playkids.domain.ClassListVO;
import com.playkids.domain.ClassVO;

public interface ClassListService {
	public List<ClassListVO> selectClist(Map map,ClassCriteria classCri);
	
	public List<String> selectGu(Map map);
}
