package com.erwinr.movieproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erwinr.movieproject.Models.LoginUser;
import com.erwinr.movieproject.Models.Movie;
import com.erwinr.movieproject.Models.User;
import com.erwinr.movieproject.Services.EmailService;
import com.erwinr.movieproject.Services.MovieService;
import com.erwinr.movieproject.Services.UserService;

import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.TmdbMovies.MovieMethod;
import info.movito.themoviedbapi.model.MovieDb;
import info.movito.themoviedbapi.model.core.MovieResultsPage;

@Controller
public class HomeController {

	@Autowired
	UserService userServ;

	@Autowired
	MovieService movieServ;

	@Autowired
	EmailService emailServ;

	@GetMapping("/")
	public String index() {
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String home() {
		return "home.jsp";
	}
	
	
	@GetMapping("/login_page")
	public String login_page(@ModelAttribute("newLogin") LoginUser newLogin) {
		return "login.jsp";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
			BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}
		session.setAttribute("userId", user.getId());
		session.setAttribute("userName", user.getUserName());
		return "redirect:/home";
	}
	
	@GetMapping("/register_page")
	public String register_page(Model model) {
		model.addAttribute("newUser", new User());
		return "register.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, Model model, HttpSession session) {
		User user = userServ.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register.jsp";
		}
		session.setAttribute("userId", user.getId());
		session.setAttribute("userName", user.getUserName());
		emailServ.sendMessage(newUser.getEmail(), "Movie Spree", "Thank you, " + newUser.getUserName() + " for registering to the best web site for movies ever made!!!");
		return "redirect:/home";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	@GetMapping("/trending/movies")
	public String trending_page(Model model, HttpSession session){
		TmdbMovies movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getMovies();
		MovieResultsPage popularMovies = movies.getPopularMovies("en", 1);
		System.out.println(popularMovies);

		model.addAttribute("popularMovies", popularMovies);
		model.addAttribute("movies", new Movie());
		model.addAttribute("id", session.getAttribute("userId"));
		return "trending_page.jsp";
	}


	@GetMapping("/movie/{id}/details")
	public String showDetails(@PathVariable("id") int id, Model model) {
		model.addAttribute("id", id);
		TmdbMovies movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getMovies();
		MovieDb movie = movies.getMovie(id,"en", MovieMethod.images, MovieMethod.videos, MovieMethod.credits, MovieMethod.similar);
		model.addAttribute("movie", movie);
		return "showMovie.jsp";
	}

	@PostMapping("/addMovie")
	public String addMovie(@Valid @ModelAttribute("movies")Movie movie,BindingResult result, Model model, HttpSession session){
		// if(session.getAttribute("userId") == null) {
		// 	return "redirect:/register_page";
		// }
		model.addAttribute("id", session.getAttribute("userId"));
		movieServ.create(movie);
		return "redirect:/watchlist";
	}

		@GetMapping("/contact")
	public String sendContact(HttpSession session, Model model){
		Long userId = (Long) session.getAttribute("userId");
		User u = userServ.findById(userId);
		model.addAttribute("user", u);
		emailServ.sendMessage(u.getEmail(), "Movie Spree Contacts", "Hello, " + u.getUserName() + " here is our contact info");
		return "";
	}


	@GetMapping("/watchlist")
	public String watchlist(Model model, HttpSession session){
		// Long userId = (Long) session.getAttribute("userId");
		// User user = userServ.findById(userId);
		
		model.addAttribute("watchMovies", movieServ.allMovies());
		// if(session.getAttribute("userId") == null) {
		// 	return "redirect:/register_page";
		// }
		return "watchList.jsp";
	}


	@PostMapping("search_movies")
	public String searchMovies(@RequestParam(value="searchCriteria") String searchCriteria, Model model) {
		// TmdbMovies movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getMovies();
		TmdbSearch movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getSearch();
		MovieResultsPage movieSearch = movies.searchMovie(searchCriteria, null, searchCriteria, false, null);
		model.addAttribute("movieSearch", movieSearch);
		return "searchResults.jsp";
	}

}

