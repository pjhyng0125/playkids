package com.playkids.control;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalRecord(service.listSearchCount(cri));
		
		model.addAttribute("pm", pm);
		return "board/list";
	}
	
	
}
