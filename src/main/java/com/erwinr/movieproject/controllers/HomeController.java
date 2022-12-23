package com.erwinr.movieproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.erwinr.movieproject.Models.Comment;
import com.erwinr.movieproject.Models.Contact;
import com.erwinr.movieproject.Models.LoginUser;
import com.erwinr.movieproject.Models.Movie;
import com.erwinr.movieproject.Models.User;
import com.erwinr.movieproject.Services.CommentService;
import com.erwinr.movieproject.Services.EmailService;
import com.erwinr.movieproject.Services.MovieService;
import com.erwinr.movieproject.Services.UserService;

import info.movito.themoviedbapi.TmdbApi;
import info.movito.themoviedbapi.TmdbMovies;
import info.movito.themoviedbapi.TmdbPeople;
import info.movito.themoviedbapi.TmdbSearch;
import info.movito.themoviedbapi.TmdbMovies.MovieMethod;
import info.movito.themoviedbapi.model.Artwork;
import info.movito.themoviedbapi.model.MovieDb;
import info.movito.themoviedbapi.model.core.MovieResultsPage;
import info.movito.themoviedbapi.model.people.PersonCredits;
import info.movito.themoviedbapi.model.people.PersonPeople;

@Controller
public class HomeController {

	@Autowired
	UserService userServ;

	@Autowired
	MovieService movieServ;

	@Autowired
	EmailService emailServ;

	@Autowired
	CommentService commentServ;


	@GetMapping("/")
	public String index() {
		return "redirect:/home";
	}

	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		TmdbMovies movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getMovies();
		MovieResultsPage topRatedMovies = movies.getTopRatedMovies("en", 1);
		MovieResultsPage nowPlaying = movies.getNowPlayingMovies("en", 1, "US");
		MovieResultsPage upcomingMovies = movies.getUpcoming("en", 1, "US");
		model.addAttribute("topRatedMovies", topRatedMovies);
		model.addAttribute("nowPlayingItems", nowPlaying);
		model.addAttribute("upcomingMovies", upcomingMovies);
		if (session.getAttribute("userId") != null) {
			model.addAttribute("id", session.getAttribute("userId"));
		}
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
		if (result.hasErrors()) {
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
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register.jsp";
		}
		session.setAttribute("userId", user.getId());
		session.setAttribute("userName", user.getUserName());
		emailServ.sendMessage(newUser.getEmail(), "Movie Spree", "Thank you, " + newUser.getUserName()
				+ " for registering to the best web site for movies ever made!!!");
		return "redirect:/home";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}

	@GetMapping("/trending/movies")
	public String trending_page(Model model, HttpSession session) {
		TmdbMovies movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getMovies();
		MovieResultsPage popularMovies = movies.getPopularMovies("en", 1);
		System.out.println(popularMovies);

		Long id = (Long) session.getAttribute("userId");
		if (session.getAttribute("userId") != null) {
			model.addAttribute("id", id);
			model.addAttribute("watchList", userServ.findUserMovies(id));
		}

		model.addAttribute("popularMovies", popularMovies);
		model.addAttribute("movies", new Movie());
		return "trending_page.jsp";
	}

	@GetMapping("/movie/{movieId}/details")
	public String showDetails(@PathVariable("movieId") int movieId, @ModelAttribute("movies") Movie addMovie,
			Model model, HttpSession session) {

		model.addAttribute("movieId", movieId);
		TmdbMovies movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getMovies();
		MovieDb movie = movies.getMovie(movieId, "en", MovieMethod.images, MovieMethod.videos, MovieMethod.credits,
				MovieMethod.similar);
		model.addAttribute("movie", movie);

		// check if user is logged in. If they are, get their watchlist
		// If there is any code that only applies to logged-in users, put it below!
		Long id = (Long) session.getAttribute("userId");
		if (id != null) {
			model.addAttribute("id", id);
			// model.addAttribute("watchList", userServ.findUserMovies(id));
			model.addAttribute("userWatchlistMovie", movieServ.findWatchlistMovie(userServ.findById(id), movieId));
			// model.addAttribute("newComment", new Comment());
			// model.addAttribute("movieComments", commentServ.movieComments((long) movie.getId()));
			// System.out.println(userServ.findUserMovies(id));
			System.out.println(movieServ.findWatchlistMovie(userServ.findById(id), movieId));
		}		
		return "showMovie.jsp";
	}

	@PostMapping("/addMovie")
	public String addMovie(@Valid @ModelAttribute("movies") Movie movie, BindingResult result, Model model,
			HttpSession session) {
		// if(session.getAttribute("userId") == null) {
		// return "redirect:/register_page";
		// }
		Long id = (Long) session.getAttribute("userId");
		if (id != null) {
			model.addAttribute("id", id);
			movieServ.create(movie);
		}
		return "redirect:/watchlist";
	}

	@DeleteMapping("/removeMovie/{movieId}")
	public String removeMovie(@PathVariable("movieId") Long id, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/home";
		}
		movieServ.deleteMovie(id);
		return "redirect:/watchlist";
	}


	@GetMapping("/watchlist")
	public String watchlist(Model model, HttpSession session) {
		Long id = (Long) session.getAttribute("userId");
		// User user = userServ.findById(userId);
		if (id != null) {
			model.addAttribute("id", session.getAttribute("userId"));
			model.addAttribute("watchlistMovies", movieServ.allMovies());
		}
		return "watchList.jsp";
	}


	@PostMapping("/send/contact")
	public String sendContact(@Valid @ModelAttribute("formdata") Contact contact, BindingResult result,
			HttpSession session, Model model) {
		emailServ.recieveMessage("User Contact", "The user " + contact.getFullName() + " with email contact at "
				+ contact.getEmail() + " is asking us " + contact.getQuestion());
		return "redirect:/home";
	}

	@GetMapping("/contact")
	public String contactpage(@ModelAttribute("formdata") Contact contact, BindingResult result, HttpSession session,
			Model model) {
		return "contact.jsp";
	}

	@GetMapping("search_movies")
	public String searchMovies(@RequestParam(value = "searchCriteria") String searchCriteria, Model model,
			HttpSession session) {
		// TmdbMovies movies = new
		// TmdbApi("5d9be5688e6be5edda3299019fd5922a").getMovies();
		TmdbSearch movies = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getSearch();
		MovieResultsPage movieSearch = movies.searchMovie(searchCriteria, null, searchCriteria, false, null);
		model.addAttribute("movieSearch", movieSearch);
		if (session.getAttribute("userId") != null) {
			model.addAttribute("id", session.getAttribute("userId"));
		}
		return "searchResults.jsp";
	}

	@GetMapping("/person/{personId}/details")
	public String showPersonDetails(@PathVariable("personId") int personId, Model model, HttpSession session) {
		model.addAttribute("personId", personId);
		TmdbPeople people = new TmdbApi("5d9be5688e6be5edda3299019fd5922a").getPeople();
		PersonPeople person = people.getPersonInfo(personId);
		PersonCredits personCredits = people.getCombinedPersonCredits(personId);
		List<Artwork> personImages = people.getPersonImages(personId);
		if (session.getAttribute("userId") != null) {
			model.addAttribute("id", session.getAttribute("userId"));
		}
		model.addAttribute("person", person);
		model.addAttribute("personCredits", personCredits);
		model.addAttribute("personImages", personImages);

		return "showPerson.jsp";
	}


	// @PostMapping("/movie/comment/{id}")
	// public String addComment(@Valid @ModelAttribute("newComment") Comment comment, BindingResult result, Model model, HttpSession session, @PathVariable("id") Long id){
	// 	Long userId =(Long) session.getAttribute("userId");
	// 	Movie thisMovie = movieServ.findById(userId);
	// 	if(result.hasErrors()){
	// 		model.addAttribute("oneMovie", movieServ.findById(id));
	// 		model.addAttribute("movieComments", commentServ.movieComments(id));
	// 		return "showMovie.jsp";
	// 	} else{
	// 		Comment newComment = new Comment(comment.getCommentInfo());
	// 		newComment.setMovie(thisMovie);
	// 		newComment.setCreator(userServ.findById(userId));
	// 		commentServ.addComment(newComment);
	// 		return "redirect:/movie/" +id +"/details";
	// 	}
	// }
}
