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
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/homepage.css"/>
<script src="https://kit.fontawesome.com/f217b10d44.js" crossorigin="anonymous"></script>
<title>Home Page</title>
</head>
<body>
	<div id="navbar" class="d-flex align-items-center justify-content-around">
		<div id="logo">
			<p><a href="/home">Movie Spree</a></p>
		</div>
		<div id="search-container">
			<form id="form" action="/search_movies" method="post">
				<input id="search" name="searchCriteria" class="search-bar" placeholder="Search..." type="text"></input>
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
		<div id="pages">
			<ul class="d-flex justify-content-evenly align-items-center" id="nav-list">
				<li><a href="/trending/movies">Trending</a></li>
				<li><a href="/watchlist">Watchlist</a></li>
				<li><a href="#">Contact</a></li>
				<c:choose>
					<c:when test="${id == null}">
						<li><a href="/login_page"><button class="login-btn">Sign in</button></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/logout"><button class="login-btn">Log Out</button></a></li>
					</c:otherwise>
				</c:choose>
			</ul>			
		</div>
	</div>
	<h1 class="category-headings">Top Rated Movies</h1>
	<div id="popular-movie-container" class="d-flex swiper mySwiper">
		<div class="swiper-wrapper">
			<c:forEach var="topRatedMovie" items="${topRatedMovies.results}">
				<div class="movie me-4 swiper-slide">
					<div class="mt-4">
						<a href="/movie/${topRatedMovie.id}/details"><img src="https://image.tmdb.org/t/p/w500${topRatedMovie.posterPath}" alt="${topRatedMovie.title}" class="movie-image" height="auto" width="200px"></a>
						<h3 class="mt-4">${topRatedMovie.title}</h3>
						<h6>${topRatedMovie.releaseDate}</h6>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<h1 class="category-headings-2 mt-5">Now Playing</h1>
	<div id="now-playing-container" class="d-flex swiper mySwiper">
		<div class="swiper-wrapper">
			<c:forEach var="nowPlayingItem" items="${nowPlayingItems.results}">
				<div class="movie me-4 swiper-slide">
					<div class="mt-4">
						<a href="/movie/${nowPlayingItem.id}/details"><img src="https://image.tmdb.org/t/p/w500${nowPlayingItem.posterPath}" alt="${nowPlayingItem.title}" class="movie-image" height="auto" width="200px"></a>
					</div>
					<h3 class="mt-4">${nowPlayingItem.title}</h3>
					<h6>${nowPlayingItem.releaseDate}</h6>
				</div>
			</c:forEach>
		</div>
	</div>
	<h1 class="category-headings-2">Upcoming Movies</h1>
	<div id="upcoming-container" class="d-flex swiper mySwiper">
		<div class="swiper-wrapper">
			<c:forEach var="upcomingMovie" items="${upcomingMovies.results}">
				<div class="movie me-4 swiper-slide">
					<div class="mt-4">
						<a href="/movie/${upcomingMovie.id}/details"><img src="https://image.tmdb.org/t/p/w500${upcomingMovie.posterPath}" alt="${upcomingMovie.title}" class="movie-image" height="auto" width="200px"></a>
					</div>
					<h3 class="mt-4">${upcomingMovie.title}</h3>
					<h6>${upcomingMovie.releaseDate}</h6>
				</div>
			</c:forEach>
		</div>
	</div> 
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="/js/home.js"></script>
</body>
</html>