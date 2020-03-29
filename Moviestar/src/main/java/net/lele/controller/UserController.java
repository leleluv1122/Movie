package net.lele.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.lele.domain.Movie_schedule;
import net.lele.domain.Seat;
import net.lele.domain.State_theater;
import net.lele.service.MovieService;
import net.lele.service.Movie_imageService;
import net.lele.service.Movie_scheduleService;
import net.lele.service.SeatService;
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
	@Autowired
	Movie_scheduleService mss;
	@Autowired
	SeatService seatService;

	@RequestMapping("user/tmovie")
	public String tickets(Model model) throws Exception {
		model.addAttribute("movies", movieService.findAll());

		return "user/tmovie";
	}
	
	@RequestMapping("user/tschedule")
	public String tschedule(@RequestParam("movie") String movie, Model model) throws Exception{
		model.addAttribute("state", stateService.findAll());
		return "user/tschedule";
	}

	@RequestMapping("user/sth")
	@ResponseBody
	public List<State_theater> sth(@RequestParam int state, Model model) {
		return sts.findByStateId(state);
	}

	@RequestMapping("user/moviefind")
	@ResponseBody
	public List<Movie_schedule> moviefind(@RequestParam int stheater, Model model) {
		return mss.findByStId(stheater);
	}

	@RequestMapping("user/seatfind")
	@ResponseBody
	public Seat seatfind(@RequestParam int stheater) throws Exception {
		return seatService.findByStId(stheater);
	}

}
