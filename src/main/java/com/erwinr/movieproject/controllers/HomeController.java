package com.erwinr.movieproject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String home() {
		return "home.jsp";
	}
	
	
	@GetMapping("/login_page")
	public String login_page() {
		return "login.jsp";
	}
	
	@GetMapping("/register_page")
	public String register_page() {
		return "register.jsp";
	}

	@PostMapping("")
}
