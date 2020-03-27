package net.lele.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import net.lele.service.FaqService;
import net.lele.service.NoticeService;

@Controller
public class SupportController {
	@Autowired
	FaqService faqService;
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("support")
	public String support(Model model) {
		return "support";
	}
	
	@RequestMapping("support/faq")
	public String faq(Model model) {
		model.addAttribute("faq", faqService.findByOrderByIdDesc());
		return "support/faq";
	}
	
	@RequestMapping("support/notice")
	public String notice(Model model, @PageableDefault(size=10) Pageable pageable) { 
		/* model.addAttribute("notice", noticeService.findByOrderByIdDesc()); */
		model.addAttribute("notice", noticeService.findByOrderByIdDesc(pageable));
		
		return "support/notice";
	}
	// @PageableDefault(sort = { "id" }, direction = Direction.DESC, size = 2) 
	// 만약findAll()에서 하려면..
	
	@RequestMapping("support/notice/detail/{id}")
	public String noticedetail(@PathVariable("id") int id, Model model) {
		model.addAttribute("notice", noticeService.findById(id));
		model.addAttribute("prev", noticeService.findById(id-1));
		model.addAttribute("next", noticeService.findById(id+1));
		
		return "support/notice/detail";
	}
}
