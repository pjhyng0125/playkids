package com.playkids.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	@RequestMapping("mypage")
	public String readMypage() {
		return "mypage/readMypage";
	}
	
	@RequestMapping("myinfolist")
	public String myclassinfo() {
		return "mypage/result/myinfolist";
	}
}
