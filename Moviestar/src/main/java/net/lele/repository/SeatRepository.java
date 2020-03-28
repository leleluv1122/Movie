package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Seat;

public interface SeatRepository extends JpaRepository<Seat, Integer> {
	Seat findByStId(int id);
}
