package com.playkids.control;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playkids.domain.BusinessVO;
import com.playkids.domain.ClassVO;
import com.playkids.domain.MemberVO;
import com.playkids.service.ClassInfoService;

@Controller
@RequestMapping("/class")
public class ClassInfoController {
					
	@Inject
	private ClassInfoService service;
	
	@RequestMapping("/info")
	public String select_info(int cno,String mid, Model model)throws Exception{
		System.out.println("cno="+cno);//2 출력	
		ClassVO classVO = service.select_info(cno);
		
		//String bid = classVO.getBid();
		//System.out.println("bid="+bid);
		
		BusinessVO businessVO = service.select_business(classVO.getBid());
		
		model.addAttribute("classVO", classVO);
		model.addAttribute("businessVO", businessVO);
		
		return "classInfo/classInfo";
	}
	

	@RequestMapping("/map")
	public String select_info(String bid, Model model)throws Exception{
		
		BusinessVO businessVO = service.select_business(bid);
		
		model.addAttribute("businessVO", businessVO);
		return "api/mapApi";
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public @ResponseBody String prove_autho(int cno, HttpServletRequest request) throws Exception {
		System.out.println("cno:>>"+(cno+1));
		String result;
		if(service.permit_class(cno))
			result="true";
		else
			result="false";	
		//System.out.println("cno:"+cno+"클래스 승인결과 : "+result);
		request.setAttribute("cno", cno);
		return result;
	}
	
	
	
	
}
