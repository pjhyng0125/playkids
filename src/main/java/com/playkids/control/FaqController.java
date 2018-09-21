package com.playkids.control;

import javax.inject.Inject;  

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.playkids.domain.Criteria;
import com.playkids.domain.FaqVO;
import com.playkids.domain.PageMaker;
import com.playkids.domain.SearchCriteria;
import com.playkids.service.FaqService;

@Controller
@RequestMapping("faq")
public class FaqController {

	@Inject
	private FaqService service;
	
	
	@RequestMapping(value="faqInsert", method=RequestMethod.GET)//�Է��� ���̱�
	public String faqGet()throws Exception {
		
		return "faq/faqInsert";
	}

	@RequestMapping(value="faqInsert", method=RequestMethod.POST)//db�Է�
	public String faqPost(FaqVO faq)throws Exception {
		System.out.println("faq="+faq);
		service.create(faq);
		System.out.println("��ϼ���!");
		return "redirect:/faq/faqList";
	}
	
	@RequestMapping(value="faqList", method=RequestMethod.GET)//db�Է�
	public String faqList(SearchCriteria cri, Model model)throws Exception {
	
		model.addAttribute("list", service.faq_criteria(cri));
		
		PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setTotalRecord(service.faq_criteriaCount(cri));
			model.addAttribute("pm", pm);
			
		
		return "faq/faq";
	}


	
	
	
}
