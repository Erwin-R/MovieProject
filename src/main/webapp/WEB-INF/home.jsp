<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/trending.css"/>
<script src="https://kit.fontawesome.com/f217b10d44.js" crossorigin="anonymous"></script>
<title>Home Page</title>
</head>
<body>
	<div id="navbar" class="d-flex align-items-center justify-content-around">
		<div id="logo">
			<p><a href="/home">Movie Spree</a></p>
		</div>
		<div id="search-container">
			<form id="form">
				<input id="search" class="search-bar" placeholder="Search..." type="text"></input>
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
		<div id="pages">
			<ul class="d-flex justify-content-evenly align-items-center" id="nav-list">
				<li><a href="/trending/movies">Trending</a></li>
				<li><a href="#">Playlists</a></li>
				<li><a href="#">Watchlist</a></li>
				<li><a href="#">Contact</a></li>
				<li><a href="/login_page">
					<button class="login-btn">Sign in</button>
				</a></li>
			</ul>			
		</div>
	</div>

	<div id="title">
		<h1>Most Popular Movies Right Now</h1>
	</div>
	<div id="main">
		<div class="movie">
			<img src="/imgs/sample_image.jpg" alt="MoviePoster">
			<div class="movie-title">
				<h3>Movie Title</h3>
				<span class="green">9.8</span>
			</div>
			<div class="movie-description">
				<h3>Synopsis</h3>
				<p>
					Lorem ipsum dolor, sit amet consectetur adipisicing elit. Suscipit voluptas officia quae nemo maiores mollitia architecto velit? 
					Eligendi, expedita? Perspiciatis provident vero odio consequuntur sunt id labore inventore necessitatibus soluta!
				</p>
				<form action="/addMovie">
					<input type="submit" class="btn" value="Add movie">
				</form>
			</div>
		</div>
	</div>


	<div class="page-list">
		<div class="page" id="previous-page">
			<p>Previous</p> 
		</div>
		<div class="current" id="current-page">
			<p>1</p>
		</div>
		<div class="page" id="next">
			<p>Next</p>
		</div>
	</div>


	<script type="text/javascript" src="/js/home.js"></script>
</body>
</html>