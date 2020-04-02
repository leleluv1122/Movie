package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.lele.domain.Movie;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
	Movie findById(int id);
}
