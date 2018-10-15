package com.playkids.control;




import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.playkids.domain.BoardVO;
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
	
	@RequestMapping(value="adminProfit", method=RequestMethod.GET)
	public String admin_profitGET(Model model)throws Exception{
		
		model.addAttribute("list",service.selectprofit());
		
		return "/admin/profit_list";
	}
	
	@RequestMapping(value="adminInsert", method=RequestMethod.GET)
	public String admin_write_notice(HttpSession session, Model model) {
		
		String login_id= (String) session.getAttribute("login_id");	
		
		return "/admin/insert_notice";
	}
	
	@RequestMapping(value="adminInsert", method=RequestMethod.POST)
	public String admin_write_notice2(BoardVO vo, RedirectAttributes attr) throws Exception {
		System.out.println("���� ���� : "+vo);

		//service.insert_notice(vo);
		return "redirect:admin";
	}
	
	
}