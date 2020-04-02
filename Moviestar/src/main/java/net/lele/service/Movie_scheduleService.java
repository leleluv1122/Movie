package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Movie_schedule;
import net.lele.repository.Movie_scheduleRepository;

@Service
public class Movie_scheduleService {
	@Autowired
	Movie_scheduleRepository msr;

	public List<Movie_schedule> findAll() {
		return msr.findAll();
	}

	public List<Movie_schedule> findByStIdAndMovieId(int st, int mv) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		return msr.findByStIdAndMovieIdAndStartrunningAfter(st, mv, timestamp);
	}
	
	public Movie_schedule findById(int id) {
		return msr.findById(id);
	}
}
