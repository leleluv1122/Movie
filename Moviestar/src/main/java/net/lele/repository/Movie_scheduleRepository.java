package net.lele.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Movie_schedule;

public interface Movie_scheduleRepository extends JpaRepository<Movie_schedule, Integer> {
	List<Movie_schedule> findByStIdAndMovieIdAndStartrunningAfter(int st, int mv, Timestamp timestamp);
	
	Movie_schedule findById(int id);
}
