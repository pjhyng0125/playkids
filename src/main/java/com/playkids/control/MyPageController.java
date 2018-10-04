package com.playkids.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("mypage")
	public String readMypage() {
		return "mypage/readMypage";
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
