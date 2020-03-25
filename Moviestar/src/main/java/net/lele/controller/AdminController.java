package net.lele.controller;

import java.io.File;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.lele.domain.Movie;
import net.lele.domain.Movie_image;
import net.lele.repository.MovieRepository;
import net.lele.service.MovieService;
import net.lele.service.Movie_imageService;
import net.lele.utils.UploadFileUtils;

@Controller
public class AdminController {
	private String uploadPath = "D:/Movie/Moviestar/src/main/resources/static/images/";

	@Autowired
	MovieRepository movieRepository;
	@Autowired
	MovieService movieService;
	@Autowired
	Movie_imageService movie_imageService;

	@RequestMapping("/admin/index")
	public String index(Model model) {

		return "admin/index";
	}

	@RequestMapping("/admin/movieadd")
	public String movieadd(Model model) {
		return "admin/movieadd";
	}

	@RequestMapping(value = "admin/fileinsert")
	public String fileinsert(HttpServletRequest request, MultipartHttpServletRequest mtfRequest, Model model)
			throws Exception {
		Movie m = new Movie();
		Movie_image file = new Movie_image();

		String title = request.getParameter("title");
		String director = request.getParameter("director");
		String actor = request.getParameter("actor");
		String r = request.getParameter("release");
		Date releases = Date.valueOf(r);
		String detail = request.getParameter("detail");
		String genre = request.getParameter("genre");
		String run = request.getParameter("runningtime");
		int runningtime = Integer.parseInt(run);

		m.setActor(actor);
		m.setDetail(detail);
		m.setDirector(director);
		m.setGenre(genre);
		m.setReleases(releases);
		m.setTitle(title);
		m.setRunningtime(runningtime);
		MultipartFile mf = mtfRequest.getFile("imagetitle");

		String originFileName = mf.getOriginalFilename();
		String safeFile = uploadPath + originFileName;
		mf.transferTo(new File(safeFile));

		m.setImagetitle(originFileName);

		m.setId(movieService.save(m));
		movieRepository.flush();

		String imgUploadPath = uploadPath;
		List<MultipartFile> fileList = mtfRequest.getFiles("files");

		for (MultipartFile fi : fileList) {
			String sourceFileName = fi.getOriginalFilename();
			String fileName = null;
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			fileName = UploadFileUtils.fileUpload(imgUploadPath, sourceFileName, fi.getBytes(), ymdPath);

			file.setFilename(fileName);
			file.setMovie(m);
			file.setFileOriName(sourceFileName);
			file.setFileurl(imgUploadPath);

			movie_imageService.save(file);
		}

		return "redirect:/admin/index";
	}
}
