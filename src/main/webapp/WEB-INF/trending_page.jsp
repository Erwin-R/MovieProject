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
			<form id="form" action="/search_movies" method="post">
				<input id="search" name="searchCriteria" class="search-bar" placeholder="Search..." type="text"></input>
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
		<div id="pages">
			<ul class="d-flex justify-content-evenly align-items-center" id="nav-list">
				<li><a class="active" href="#">Trending</a></li>
				<li><a href="#">Playlists</a></li>
				<li><a href="/watchlist">Watchlist</a></li>
				<li><a href="/contact">Contact</a></li>
				<li><a href="/login_page"><button class="login-btn">Sign in</button></a></li>
			</ul>			
		</div>
	</div>
	<div id="title">
		<h1>Most Popular Movies Right Now</h1>
	</div>
	<div id="main">
	<c:forEach var="popularMovie" items="${popularMovies.results}">
			<div class="movie">
				<img src="https://image.tmdb.org/t/p/w500${popularMovie.posterPath}" alt="MoviePoster">
				<div class="movie-title">
					<h3>${popularMovie.title}</h3>
					<c:choose>
						<c:when test="${popularMovie.voteAverage >= 8 }">
							<span class="green">${popularMovie.voteAverage}</span>
						</c:when>
						<c:when test="${popularMovie.voteAverage >= 5 }">
							<span class="yellow">${popularMovie.voteAverage}</span>
						</c:when>
						<c:otherwise>
							<span class="red">${popularMovie.voteAverage}</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="movie-description">
					<h3>Synopsis</h3>
					<p>${popularMovie.overview}</p>
					<div class="d-flex">
						<form:form action="/addMovie" method="POST" modelAttribute="movies">
							<form:input type="hidden" path="user" value="${id}"></form:input>
							<form:input type="hidden" path="movie_id" value="${popularMovie.imdbID}"></form:input>
							<form:input type="hidden" path="title" value="${popularMovie.title}"></form:input>
							<form:input type="hidden" path="poster_path" value="${popularMovie.posterPath}"></form:input>
							<form:input type="hidden" path="vote_average" value="${popularMovie.voteAverage}"></form:input>
							<form:input type="hidden" path="overview" value="${popularMovie.overview}"></form:input>
							<form:input type="hidden" path="release_date" value="${popularMovie.releaseDate}"></form:input>
							<input type="submit" class="btn me-2" value="Add to Playlist">
						</form:form>
						<form action="/movie/${popularMovie.id}/details">
							<input type="submit" class="btn" value="More Details">
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
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


	<script type="text/javascript" src="/js/trending.js"></script>
</body>
</html>