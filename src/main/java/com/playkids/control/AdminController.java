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
		model.addAttribute("list",service.selectmember());
		
		return "/admin/member_list";
	}
	
	@RequestMapping(value="adminBusiness", method=RequestMethod.GET)
	public String admin_businessGET(Model model)throws Exception{
		
		model.addAttribute("list",service.selectbusiness());
		
		return "/admin/business_list";
	}
	
	@RequestMapping(value="adminClassInfo", method=RequestMethod.GET)
	public String admin_classinfoGET(Model model)throws Exception{
		model.addAttribute("list",service.selectclassinfo());
		
		return "/admin/classinfo_list";
		
	}
	
	@RequestMapping(value="adminBoard", method=RequestMethod.GET)
	public String admin_boardGET(Model model)throws Exception{
		
		model.addAttribute("list",service.selectboard());
		
		return "/admin/board_list";
	}
	
	
}