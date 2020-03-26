package net.lele.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.lele.service.FaqService;

@Controller
public class SupportController {
	@Autowired
	FaqService faqService;
	
	@RequestMapping("support")
	public String support(Model model) {
		return "support";
	}
	
	@RequestMapping("support/faq")
	public String faq(Model model) {
		model.addAttribute("faq", faqService.findByOrderByIdDesc());
		return "support/faq";
	}
}
