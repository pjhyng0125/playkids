package com.playkids.control;



import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playkids.service.AdminService;

@Controller
public class AdminController {
	@RequestMapping("admin")
	public String adminpage() {
		return "admin/admin_menu";
	}
	
	@Inject
	private AdminService service;

	
	@RequestMapping(value="adminMember", method=RequestMethod.GET)
	public String admin_memberGET(String mid, Model model)throws Exception{
		
		model.addAttribute("admin",service.selectmember(mid));
		
		return "admin/admin_member";
	}
	
	@RequestMapping(value="adminBusiness", method=RequestMethod.GET)
	public String admin_businessGET(String bid, Model model)throws Exception{
		
		model.addAttribute("admin",service.selectbusiness(bid));
		
		return "admin/admin_business";
	}
}