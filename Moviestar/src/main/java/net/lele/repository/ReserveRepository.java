package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Reserve;

public interface ReserveRepository extends JpaRepository<Reserve, Integer> {
	List<Reserve> findByMsId(int id);
	Reserve findById(int id);
	List<Reserve> findByUserUserIdOrderByIdDesc(String userid);
}
