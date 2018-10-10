package com.playkids.control;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.playkids.domain.BoardVO;
import com.playkids.domain.PageMaker;
import com.playkids.domain.SearchCriteria;
import com.playkids.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	private BoardService service;
	
	@RequestMapping("list")
	public String list(SearchCriteria cri, Model model) throws Exception {
		model.addAttribute("cri", cri);
		
		model.addAttribute("notice", service.listNotice());
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalRecord(service.listSearchCount(cri));
		
		model.addAttribute("pm", pm);
		return "board/list";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String insertGet(String mid, Model model,HttpSession session) throws Exception {
		
		// ** 세션으로 부터 로그인 아이디를 받음.
		String login_id= (String) session.getAttribute("login_id");	
		model.addAttribute("listClass", service.listClass(login_id));
		
		
	//	model.addAttribute("joinclass", service.joinClass_list(mid));
		return "board/insert";
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertPost(BoardVO vo, RedirectAttributes attr) throws Exception {
		service.insert_page(vo);
	//	attr.addFlashAttribute("msg", "success");
		
		return "redirect:list";
	}
	
	@RequestMapping(value="showpage", method=RequestMethod.GET)
	public String showpage(int bno, HttpServletRequest request, SearchCriteria cri) throws Exception  {
		request.setAttribute("boardVO", service.select_board(bno));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalRecord(service.listSearchCount(cri));
		
		request.setAttribute("pm", pm);
		return "board/showpage";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int bno) throws Exception {
		service.delete_page(bno);
		return "redirect:list";
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateGet(int bno, HttpServletRequest request) throws Exception {
		request.setAttribute("boardVO", service.select_board(bno));
		return "board/update_page";
	}
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updatePost(BoardVO vo, HttpServletRequest request) throws Exception {
		service.update_page(vo);
		System.out.println("update complete");
		return "redirect:list";
	}
	
}
