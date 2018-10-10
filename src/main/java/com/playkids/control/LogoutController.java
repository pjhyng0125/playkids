package com.playkids.control;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {

@RequestMapping("logout")
public ModelAndView logout(HttpSession session) {
	session.invalidate();
	ModelAndView mv = new ModelAndView();
	mv.setViewName("/main/mainView");
	return mv;
	}
}


/*if(session!=null) session.invalidate();
response.sendRedirect("mainView.jsp");*/

