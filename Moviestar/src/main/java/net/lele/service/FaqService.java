package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Faq;
import net.lele.repository.FaqRepository;

@Service
public class FaqService {
	@Autowired
	FaqRepository faqRepository;
	
	public List<Faq> findAll(){
		return faqRepository.findAll();
	}
	
	public void save(Faq f) {
		Faq faq = new Faq();
		faq.setAnswer(f.getAnswer());
		faq.setQuestion(f.getQuestion());
		
		faqRepository.save(faq);
	}
	
	public List<Faq> findByOrderByIdDesc(){
		return faqRepository.findByOrderByIdDesc();
	}
}
