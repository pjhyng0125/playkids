package com.playkids.control;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playkids.domain.ClassListVO;
import com.playkids.domain.Criteria;
import com.playkids.service.ClassListService;

@Controller
public class ClassListController {
	
	@Inject
	private ClassListService service;
	public ClassListController() {
		System.out.println("������ ȣ��");
	}
	
	@RequestMapping("/totalClass")
	public String totalClass(HttpServletRequest request,Criteria cri) {
		Map<String, String> map = new HashMap<>();
		request.setAttribute("ctype", "��ü����");
		cri.setPerPageNum(20);
		//��ü class List ������ 
		
		List<ClassListVO> classlist = service.selectClist(map,cri);
		System.out.println(classlist);
		for(int i=0; i<classlist.size();i++) {
			String[] ages = classlist.get(i).getCage().split(",");
			ClassListVO classListVO = classlist.get(i);
			classListVO.setStartAge(Integer.parseInt(ages[0])); 
			classListVO.setEndAge(Integer.parseInt(ages[1]));			
		}
		
		//�ߺ����� �ʴ� guInfo ���							
		List<String> guInfoList = service.selectGu(map);
		for(int i=0; i<guInfoList.size();i++) {
			guInfoList.set(i, guInfoList.get(i).split(" ")[1]);
		}
		request.setAttribute("totalPage", (int) Math.ceil(service.selectTotalCnt(map)/(double)cri.getPerPageNum()));
		request.setAttribute("guInfoList",guInfoList);
		request.setAttribute("classlist", classlist);
		if(request.getMethod().equals("POST")) {
			System.out.println("post �Դ�?");
			return "classList/result/selectClistResult";			
		}
		return "classList/selectClist";
	}

	@RequestMapping("/innerClass")
	public String innerClass(HttpServletRequest request,Criteria cri) {
		Map<String, String> map = new HashMap<>();
		map.put("ctype", "�ǳ�����");
		request.setAttribute("ctype", map.get("ctype"));
		cri.setPerPageNum(20);
		
		//��ü class List ������ 
		List<ClassListVO> classlist = service.selectClist(map,cri);
		for(int i=0; i<classlist.size();i++) {
			String[] ages = classlist.get(i).getCage().split(",");
			ClassListVO classListVO = classlist.get(i);
			classListVO.setStartAge(Integer.parseInt(ages[0])); 
			classListVO.setEndAge(Integer.parseInt(ages[1]));			
		}
		
		//�ߺ����� �ʴ� guInfo ���							
		List<String> guInfoList = service.selectGu(map);
		for(int i=0; i<guInfoList.size();i++) {
			guInfoList.set(i, guInfoList.get(i).split(" ")[1]);
		}
		request.setAttribute("totalPage", (int) Math.ceil(service.selectTotalCnt(map)/(double)cri.getPerPageNum()));
		request.setAttribute("guInfoList",guInfoList);
		request.setAttribute("classlist", classlist);
		if(request.getMethod().equals("POST")) {
			System.out.println("post �Դ�?");
			return "classList/result/selectClistResult";			
		}
		return "classList/selectClist";
	}
	
	
	
}
