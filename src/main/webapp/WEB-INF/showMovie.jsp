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
<link rel="stylesheet" href="/css/showMovie.css"/>
<script src="https://kit.fontawesome.com/f217b10d44.js" crossorigin="anonymous"></script>
<title>Movie Spree - Details</title>
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
				<li><a href="/trending">Trending</a></li>
				<li><a href="#">Playlists</a></li>
				<li><a href="/watchlist">Watchlist</a></li>
				<li><a href="#">Contact</a></li>
				<li><a href="/login_page">
					<button class="login-btn">Sign in</button>
				</a></li>
			</ul>			
		</div>
	</div>
	<div id="main" class="container mx-auto">
		<div class="movie">
            <div class="title-bar text-light">
                <div class="title-header d-flex justify-content-start align-items-end gap-3">
                    <input id="movie_id" type="hidden" value="${id}">
                    <h1 id="title">${movie.title}</h1>
                    <p id="release_date">${movie.releaseDate}</p>
                    <p id="runtime">${movie.runtime}</p>
                    <p id="vote_average">${movie.voteAverage}</p>
                </div>
                <div class="tagline">
                    <p id="tagline" class="fst-italic">${movie.tagline}</p>
                </div>
            </div>
            <div class="d-flex row">
                <div class="left-column d-flex flex-column justify-content-start gap-3 col-3">
                    <div class="poster card">
                        <img src="https://image.tmdb.org/t/p/w500${movie.posterPath}" alt="">
                    </div>
                    <div class="genres card p-2">
                        <div class="genre-header">
                            <h4>Genres</h4>
                        </div>
                        <c:forEach var="genre" items="${movie.genres}">
                            <p>${genre}</p>
                        </c:forEach>
                    </div>
                    <div class="director card p-2">
                        <div class="director-header">
                            <h4>Director</h4>
                        </div>
                        <c:forEach var="crewMember" items="${movie.credits.crew}">
                            <c:if test="${crewMember.job == 'Director'}">
                                <p>${crewMember.name}</p>
                            </c:if>    
                        </c:forEach>
                    </div>
                    <div class="writers card p-2">
                        <div class="writers-header">
                            <h4>Writers</h4>
                        </div>
                        <c:forEach var="crewMember" items="${movie.credits.crew}">
                            <c:if test="${crewMember.department == 'Writing'}">
                                <p>${crewMember.name}</p>
                            </c:if>    
                        </c:forEach>
                    </div>
                </div>
                <div class="center-column d-flex flex-column justify-content-start gap-3 col-6">
                    <div class="overview card p-2">
                        <div class="overview-header">
                            <h4>Overview</h4>
                        </div>
                        <p id="overview">${movie.overview}</p>
                    </div>
                </div>
                <div class="right-column d-flex flex-column justify-content-start gap-3 col-3">
                    <div class="other-details card p-2">
                        <h4>Status</h4>
                        <p id="status">${movie.status}</p>
                        <h4>Original Language</h4>
                        <p id="original_language">${movie.originalLanguage}</p>
                        <h4>Budget</h4>
                        <p id="budget">${movie.budget}</p>
                        <h4>Revenue</h4>
                        <p id="revenue">${movie.revenue}</p>
                    </div>
                </div>
            </div>
		</div>
	</div>

	<!-- <script type="text/javascript" src="/js/showMovie.js"></script> -->
</body>
</html>