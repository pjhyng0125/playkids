package com.playkids.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("join")
@Controller
public class JoinController {
	@RequestMapping(value="login")
	public String login() {
		return "/join/login";
	}
	@RequestMapping(value="joinchoice")
	public String joinChoice() {
		return "/join/joinChoice";
	}
}
