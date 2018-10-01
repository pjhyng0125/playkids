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
	public String admin_memberGET(Model model)throws Exception{
		
		model.addAttribute("admin",service.selectmember());
		
		return "admin/admin_member";
	}
	
	@RequestMapping(value="adminBusiness", method=RequestMethod.GET)
	public String admin_businessGET(Model model)throws Exception{
		
		model.addAttribute("admin",service.selectbusiness());
		
		return "admin/admin_business";
	}
	
	@RequestMapping(value="adminClassInfo", method=RequestMethod.GET)
	public String admin_classinfoGET(Model model)throws Exception{
		
		model.addAttribute("admin",service.selectclassinfo());
		
		return "admin/admin_classinfo";
		
	}
	
	@RequestMapping(value="adminBoard", method=RequestMethod.GET)
	public String admin_boardGET(Model model)throws Exception{
		
		model.addAttribute("admin",service.selectboard());
		
		return "admin/admin_board";
	}
	
}