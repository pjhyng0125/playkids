package com.playkids.control;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playkids.domain.ChildInfoVO;
import com.playkids.service.MypageService;

@Controller
public class MyPageController {
	
	@Inject
	private MypageService service;
	
	@RequestMapping("mypage")
	public String readMypage(HttpSession session, Model model) {
		String login_id = (String) session.getAttribute("login_id");
		System.out.println(login_id);
		if(login_id != null) {
			model.addAttribute("myInfo", service.selectMyInfo(login_id)); //ÀÌ¸§, Ä³½¬ ÀÜ¾×
			model.addAttribute("childInfo",service.selectChild(login_id));// ÀÚ³à Á¤º¸
		}
		return "mypage/readMypage";
	}
	
	@RequestMapping("insertChild")
	public void insertChild(ChildInfoVO childInfo) {
		System.out.println(childInfo);
	}
	
	@RequestMapping("myclasslist")
	public String myclasslist() {
		return "mypage/result/myclasslist";
	}

	@RequestMapping("mypaylist")
	public String mypaylist() {
		return "mypage/result/mypaylist";
	}
	
	@RequestMapping("chat")
	public String chat() {
		return "chat/qna";
	}
}
