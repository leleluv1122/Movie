package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Seat;
import net.lele.repository.SeatRepository;

@Service
public class SeatService {
	@Autowired
	SeatRepository seatRepository;
	
	public Seat findByStId(int id){
		return seatRepository.findByStId(id);
	}
}
