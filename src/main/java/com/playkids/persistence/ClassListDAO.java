package com.playkids.persistence;

import java.util.List;
import java.util.Map;

import com.playkids.domain.ClassCriteria;
import com.playkids.domain.ClassListVO;
import com.playkids.domain.ClassVO;

public interface ClassListDAO {
	public List<ClassListVO> selectClist(Map map,ClassCriteria classCri);
	
	public List<String> selectGu(Map map);
}
