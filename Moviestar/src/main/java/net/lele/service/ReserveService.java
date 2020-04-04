package net.lele.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Reserve;
import net.lele.repository.ReserveRepository;

@Service
public class ReserveService {
	@Autowired
	ReserveRepository reserveRepository;
	
	public int save(Reserve r) {
		Reserve re = new Reserve();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		re.setMovie(r.getMovie());
		re.setReservenum(r.getReservenum());
		re.setMs(r.getMs());
		re.setUser(r.getUser());
		re.setReservetime(timestamp);
		
		reserveRepository.save(re);
		return re.getId();
	}
	
	public List<Reserve> findByMsId(int id){
		return reserveRepository.findByMsId(id);
	}
	
	public List<Reserve> findByUserUserIdOrderByIdDesc(String userId){
		return reserveRepository.findByUserUserIdOrderByIdDesc(userId);
	}
	
	public Reserve findById(int id) {
		return reserveRepository.findById(id);
	}
}
