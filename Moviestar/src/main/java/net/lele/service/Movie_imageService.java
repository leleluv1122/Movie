package net.lele.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.lele.domain.Movie_image;
import net.lele.repository.Movie_imageRepository;

@Service
public class Movie_imageService {
	@Autowired
	Movie_imageRepository mir;
	
	public void save(Movie_image mi) {
		Movie_image mm = new Movie_image();
		mm.setFilename(mi.getFilename());
		mm.setFileOriName(mi.getFileOriName());
		mm.setFileurl(mi.getFileurl());
		mm.setMovie(mi.getMovie());
		
		mir.save(mm);
	}
	
	public Movie_image findByMovieidgroup() {
		return mir.findByMovieidgroup();
	}
}
