package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Reserve_detail;
import net.lele.repository.Reserve_detailRepository;

@Service
public class Reserve_detailService {
	@Autowired
	Reserve_detailRepository reserve_detailRepository;
	
	public void save(Reserve_detail rd) {
		Reserve_detail r = new Reserve_detail();
		r.setReserve(rd.getReserve());
		r.setColnum(rd.getColnum());
		r.setRownum(rd.getRownum());
		
		reserve_detailRepository.save(r);
	}
	
	public List<Reserve_detail> findByReserveId(int id){
		return reserve_detailRepository.findByReserveId(id);
	}
}
