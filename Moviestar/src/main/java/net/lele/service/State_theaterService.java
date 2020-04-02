package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.State_theater;
import net.lele.repository.State_theaterRepository;

@Service
public class State_theaterService {
	@Autowired
	State_theaterRepository str;
	
	public List<State_theater> findAll(){
		return str.findAll();
	}
	
	public List<State_theater> findByStateId(int id){
		return str.findByStateId(id);	
	}
	
	public State_theater findById(int id) {
		return str.findById(id);
	}
}
