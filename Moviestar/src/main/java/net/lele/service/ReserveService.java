package net.lele.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Reserve;
import net.lele.repository.ReserveRepository;

@Service
public class ReserveService {
	@Autowired
	ReserveRepository reserveRepository;
	
	public void save(Reserve r) {
		Reserve re = new Reserve();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		re.setMovie(r.getMovie());
		re.setReservenum(r.getReservenum());
		re.setRow(r.getRow());
		re.setCol(r.getCol());
		re.setMs(r.getMs());
		re.setUser(r.getUser());
		re.setReservetime(timestamp);
		
		reserveRepository.save(re);
	}
}
