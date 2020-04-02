package net.lele.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.lele.domain.Movie;
import net.lele.domain.Movie_schedule;
import net.lele.domain.Reserve;
import net.lele.domain.State_theater;
import net.lele.domain.User;
import net.lele.service.MovieService;
import net.lele.service.Movie_imageService;
import net.lele.service.Movie_scheduleService;
import net.lele.service.ReserveService;
import net.lele.service.SeatService;
import net.lele.service.StateService;
import net.lele.service.State_theaterService;
import net.lele.service.UserService;
import net.lele.utils.DateUtil;

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
	@Autowired
	ReserveService reserveService;
	DateUtil date = new DateUtil();

	@RequestMapping("user/tmovie")
	public String tickets(Model model) throws Exception {
		model.addAttribute("movies", movieService.findAll());

		return "user/tmovie";
	}

	@RequestMapping("user/tschedule")
	public String tschedule(@RequestParam("movie") String movie, Model model) throws Exception {
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
	public List<Movie_schedule> moviefind(@RequestParam(value = "theater") String tt,
			@RequestParam(value = "movie") int movie, Model model) {
		int theater = Integer.parseInt(tt.substring(9));
		return mss.findByStIdAndMovieId(theater, movie);
	}

	@RequestMapping("user/booking")
	public String booking(@RequestParam("movie") String movie, @RequestParam("state") int state,
			@RequestParam("stheater") int stheater, @RequestParam("schedule") int schedule, Model model) {
		model.addAttribute("seat", seatService.findByStId(stheater));

		model.addAttribute("s", mss.findById(schedule));
		return "user/booking";
	}

	@RequestMapping(value = "user/reserve")
	public String reserve(HttpServletRequest request) throws Exception {
		Random rand = new Random();
		int rr = rand.nextInt(1000000) + 1;

		/* int cnt = Integer.parseInt(request.getParameter("cnt")); */
		int u = Integer.parseInt(request.getParameter("user"));
		int m = Integer.parseInt(request.getParameter("movie"));
		int s = Integer.parseInt(request.getParameter("schedule"));
		
		String[] ck = request.getParameterValues("ck");
		User user = userService.findById(u);
		Movie movie = movieService.findById(m);
		Movie_schedule ms = mss.findById(s);

		for (int i = 0; i < ck.length; ++i) {
			Reserve r = new Reserve();
			r.setUser(user);
			r.setMovie(movie);
			r.setMs(ms);

			r.setReservenum(date.getDate() + "-" + rr);
			r.setRow(Integer.parseInt(ck[i].substring(1, 1)));
			r.setCol(Integer.parseInt(ck[i].substring(5)));

			reserveService.save(r);
		}

		return "redirect:/";
	}

	/*
	 * @RequestMapping("user/seatfind")
	 * 
	 * @ResponseBody public Seat seatfind(@RequestParam int stheater) throws
	 * Exception { return seatService.findByStId(stheater); }
	 */

}
