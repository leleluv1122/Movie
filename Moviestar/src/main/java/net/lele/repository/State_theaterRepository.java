package net.lele.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.State_theater;

public interface State_theaterRepository extends JpaRepository<State_theater, Integer> {
	List<State_theater> findByStateId(int id);
	State_theater findById(int id);
}
