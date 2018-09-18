package com.playkids.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassListController {
	
	@RequestMapping("/totalClass")
	public String totalClass() {
		return "classList/selectClist";
	}
}
