package net.lele.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.lele.service.MovieService;
import net.lele.service.Movie_imageService;
import net.lele.service.StateService;
import net.lele.service.State_theaterService;
import net.lele.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	MovieService movieService;
	@Autowired
	Movie_imageService mis;
	@Autowired
	StateService stateService;
	@Autowired
	State_theaterService sts;
	
	@RequestMapping("user/tickets")
	public String tickets(Model model) throws Exception{
		model.addAttribute("movies", movieService.findAll());
		model.addAttribute("state", stateService.findAll());
		model.addAttribute("st", sts.findAll());
		
		return "user/tickets";
	}
}
