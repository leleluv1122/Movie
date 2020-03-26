package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Movie_schedule;
import net.lele.repository.Movie_scheduleRepository;

@Service
public class Movie_scheduleService {
	@Autowired
	Movie_scheduleRepository msr;
	
	public List<Movie_schedule> findAll(){
		return msr.findAll();
	}
	
	public List<Movie_schedule> findByStId(int id){
		return msr.findByStId(id);
	}
}
