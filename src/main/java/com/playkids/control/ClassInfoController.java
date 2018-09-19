package com.playkids.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.service.ClassInfoService;

@Controller
@RequestMapping("/class")
public class ClassInfoController {

	@Inject
	private ClassInfoService service;
	
	@RequestMapping("/info")
	public String select_info(String cname,String bid, Model model)throws Exception{
		if(cname==null || bid==null) {
			cname="키즈복싱";
			bid="키즈키즈";
		}
		
		ClassVO classVO = service.select_info(cname);
		BusinessVO businessVO = service.select_business(bid);
		
		
		model.addAttribute("classVO", classVO);
		model.addAttribute("businessVO", businessVO);
		return "classInfo/classInfo";
	}

	@RequestMapping("/map")
	public String select_info(String bid, Model model)throws Exception{
		if(bid==null) {
			bid="키즈키즈";
		}
		
		BusinessVO businessVO = service.select_business(bid);
		
		model.addAttribute("businessVO", businessVO);
		return "api/mapApi";
	}
	
	
	
	
}
