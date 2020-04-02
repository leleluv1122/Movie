package net.lele.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Movie;
import net.lele.repository.MovieRepository;

@Service
public class MovieService {
	@Autowired
	MovieRepository movieRepository;

	public int save(Movie m) {
		Movie mo = new Movie();
		mo.setActor(m.getActor());
		mo.setDetail(m.getActor());
		mo.setDirector(m.getDirector());
		mo.setGenre(m.getGenre());
		mo.setReleases(m.getReleases());
		mo.setTitle(m.getTitle());
		mo.setRunningtime(m.getRunningtime());
		mo.setImagetitle(m.getImagetitle());
		movieRepository.save(mo);

		int i = mo.getId();

		return i;
	}
	
	public List<Movie> findAll(){
		return movieRepository.findAll();
	}
	
	public Movie findById(int id) {
		return movieRepository.findById(id);
	}
}
