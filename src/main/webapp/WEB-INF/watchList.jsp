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
<link rel="stylesheet" href="/css/watchList.css"/>
<script src="https://kit.fontawesome.com/f217b10d44.js" crossorigin="anonymous"></script>
<title>Watch List</title>
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
				<li><a href="/watchlist" class="nav-link active">Watchlist</a></li>
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
	<div id="title">
		<h1 class="text-center">Your must see movies!</h1>
	</div>
	<div id="main">
		<c:forEach var="watchListMovie" items="${watchMovies}">
			<div class="movie">
				<img src="https://image.tmdb.org/t/p/w500${watchListMovie.poster_path}" alt="MoviePoster">
				<div class="movie-title">
					<h3>${watchListMovie.title}</h3>
					<h6>Release Date: ${watchListMovie.release_date}</h6>
					<c:choose>
						<c:when test="${watchListMovie.vote_average >= 8 }">
							<span class="green">${watchListMovie.vote_average}</span>
						</c:when>
						<c:when test="${watchListMovie.vote_average >= 5 }">
							<span class="yellow">${watchListMovie.vote_average}</span>
						</c:when>
						<c:otherwise>
							<span class="red">${watchListMovie.vote_average}</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="movie-description">
					<h3>Synopsis</h3>
					<p>${watchListMovie.overview}</p>
					<div class="d-flex">
						<form action="/removeMovie/${watchListMovie.id}" method="POST">
							<input type="hidden" name="_method" value="delete">
							<input type="submit" class="btn me-2" value="Remove From Watchlist">
						</form>
						<form action="/movie/${watchListMovie.movie_id}/details">
							<input type="submit" class="btn" value="More Details">
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
<!-- 
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
	</div> -->


	<script type="text/javascript" src="/js/trending.js"></script>
</body>
</html>