package net.lele.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Movie_image;

public interface Movie_imageRepository extends JpaRepository<Movie_image, Integer> {
	@Query(nativeQuery = true, value = "select * from Movie_image m GROUP BY movieid")
	Movie_image findByMovieidgroup();
}
