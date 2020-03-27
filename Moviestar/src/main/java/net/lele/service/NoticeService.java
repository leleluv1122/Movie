package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import net.lele.domain.Notice;
import net.lele.repository.NoticeRepository;

@Service
public class NoticeService {
	@Autowired
	NoticeRepository noticeRepository;

	public void save(Notice n) {
		Notice not = new Notice();

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		not.setTitle(n.getTitle());
		not.setSort(n.getSort());
		not.setDetail(n.getDetail());
		not.setWritetime(timestamp);
		
		noticeRepository.save(not);
	}
	
	public List<Notice> findAll(){
		return noticeRepository.findAll();	
	}
	
	public List<Notice> findByOrderByIdDesc(){
		return noticeRepository.findByOrderByIdDesc();
	}
	
	public List<Notice> findByOrderByIdDesc(Pageable pageable){
		return noticeRepository.findByOrderByIdDesc(pageable);
	}
	
	public Notice findById(int id) {
		return noticeRepository.findById(id);
	}
}
