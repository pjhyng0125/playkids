package com.playkids.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.junit.runner.Request;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playkids.domain.ClassCriteria;
import com.playkids.domain.ClassListVO;
import com.playkids.service.ClassListService;

@Controller
public class ClassListController {
	
	@Inject
	private ClassListService service;
	
	@RequestMapping("/totalClass")
	public String totalClass(HttpServletRequest request,ClassCriteria classCri) {
		Map<String, String> map = new HashMap<>();
		 
		//전체 class List 보내기 
		
		List<ClassListVO> totalclass = service.selectClist(map,classCri);
		for(int i=0; i<totalclass.size();i++) {
			String[] ages = totalclass.get(i).getCage().split(",");
			ClassListVO classListVO = totalclass.get(i);
			classListVO.setStartAge(Integer.parseInt(ages[0])); 
			classListVO.setEndAge(Integer.parseInt(ages[1]));			
		}
		
		//중복되지 않는 guInfo 등록							
		List<String> guInfoList = service.selectGu(map);
		for(int i=0; i<guInfoList.size();i++) {
			guInfoList.set(i, guInfoList.get(i).split(" ")[1]);
		}
		
		request.setAttribute("guInfoList",guInfoList);
		request.setAttribute("totalclass", totalclass);
		
		if(request.getMethod().equals("POST")) {
			System.out.println("post 왔니?");
			return "classList/result/selectClistResult";			
		}
		return "classList/selectClist";
	}
	
	
	
}
