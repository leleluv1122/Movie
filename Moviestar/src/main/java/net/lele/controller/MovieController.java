package net.lele.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.lele.model.UserRegistrationModel;
import net.lele.service.MovieService;
import net.lele.service.Movie_imageService;
import net.lele.service.StateService;
import net.lele.service.State_theaterService;
import net.lele.service.UserService;

@Controller
public class MovieController {
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
	
	@RequestMapping("/")
	public String index(Model model) throws Exception {
		
		return "movies/index";
	}
	
	@RequestMapping("movies/login")
	public String login(Model model) throws Exception {

		return "movies/login";
	}
	
	@RequestMapping(value = "movies/register", method = RequestMethod.GET)
	public String register(UserRegistrationModel userModel, Model model) throws Exception {
		return "movies/register";
	}
	
	@RequestMapping(value = "movies/register", method = RequestMethod.POST)
	public String register(@Valid UserRegistrationModel userModel, BindingResult bindingResult, Model model)
			throws Exception {
		/*
		 * if (userService.hasErrors(userModel, bindingResult)) { return
		 * "movies/register"; }
		 */
		userService.save(userModel);
		return "redirect:index";
	}
	
	@RequestMapping("movies")
	public String movies(Model model) {
		model.addAttribute("movies", movieService.findAll());		
		return "movies";
	}
	
	@RequestMapping("movies/theater")
	public String theater(Model model) {
		model.addAttribute("state", stateService.findAll());
		model.addAttribute("st", sts.findAll());
		return "movies/theater";
	}
}
