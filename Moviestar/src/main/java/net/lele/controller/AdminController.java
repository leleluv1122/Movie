package net.lele.controller;

import java.io.File;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.lele.domain.Faq;
import net.lele.domain.Movie;
import net.lele.domain.Movie_image;
import net.lele.domain.Notice;
import net.lele.repository.MovieRepository;
import net.lele.service.FaqService;
import net.lele.service.MovieService;
import net.lele.service.Movie_imageService;
import net.lele.service.NoticeService;
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
	@Autowired
	FaqService faqService;
	@Autowired
	NoticeService noticeService;

	@RequestMapping("/admin/index")
	public String index(Model model) {

		return "admin/index";
	}
	
	@RequestMapping(value = "/admin/faqwrite", method = RequestMethod.GET)
	public String faqwrite(Model model, Faq faq) {
		
		return "admin/faqwrite";
	}
	
	@RequestMapping(value="/admin/faqwrite", method=RequestMethod.POST)
	public String faqwrite(Model model, Faq faq, BindingResult bindingResult) throws Exception{
		faqService.save(faq);
		return "redirect:/admin/index";
	}
	
	@RequestMapping(value = "/admin/noticewrite", method = RequestMethod.GET)
	public String noticewrite(Model model, Notice notice) {
		
		return "admin/noticewrite";
	}
	
	@RequestMapping(value="/admin/noticewrite", method=RequestMethod.POST)
	public String noticewrite(Model model, Notice notice, BindingResult bindingResult) throws Exception{
		noticeService.save(notice);
		return "redirect:/admin/index";
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
