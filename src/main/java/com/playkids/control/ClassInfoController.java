package com.playkids.control;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.Array;
import java.util.Arrays;
import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	boolean flag_check;
	
	@Inject
	private ClassInfoService service;
	
	@RequestMapping("/info")
	public String select_info(int cno,String mid, Model model,HttpSession session)throws Exception{
		System.out.println("cno="+cno);//2 출력	
		ClassVO classVO = service.select_info(cno);
		String login_id= (String) session.getAttribute("login_id");	
		String login_type= (String)session.getAttribute("login_type");
		//String bid = classVO.getBid();
		//System.out.println("bid="+bid);
			BusinessVO businessVO = service.select_business(classVO.getBid());
			model.addAttribute("classVO", classVO);
			model.addAttribute("businessVO", businessVO);
		if(login_type==null||login_id.equals("manager")||login_type.equals("business")) {
			return "classInfo/classInfo";
		}else {
			model.addAttribute("member_cash",service.select_member_cash(login_id));
			model.addAttribute("babylist",service.select_babylist(login_id));
			//System.out.println("login_id : >"+login_id);
			
			flag_check = false;
			return "classInfo/classInfo";
		}
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
	
	// 구매하기 버튼 클릭시 
	@RequestMapping(value="update2", method=RequestMethod.POST)
	public @ResponseBody boolean reserve_class(HttpServletRequest request,HttpSession session,
												int cno, int dno,int remain, int cost, String bid) throws Exception {
		
		String login_id= (String) session.getAttribute("login_id");	
		
		//처리해야할 것 1 reserve 추가 mid= login_id / cno / dno
		boolean flag1 = service.make_reserve(login_id, cno, dno);
		boolean flag2 = false;
		boolean flag3 = false;
		System.out.println("bid >"+bid);
		System.out.println("cost >"+cost);
		if(flag_check==false) {
			flag_check= true;
			//한번씩만 처리할 것들
			//처리해야할 것 2 member remain 업데이트 멤버아이디 	mid= login_id / mcash = remain
			flag2 = service.set_member_cost(login_id, remain);
			//처리해야할 것 3 business bprofit 추가			bid = bid / bprofit에 추가cost
			flag3 = service.add_business_profit(bid, cost);     
		}
	
		if(flag1==flag2==flag3==true) {
			System.out.println("클래스 예약 완료");
			return true;
			
		}
		else return false;
	}
	
	
	
	
}
