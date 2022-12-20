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
                    <h1 id="title">Movie Title</h1>
                    <p id="release_date">Release Date</p>
                    <p id="runtime">Runtime</p>
                    <p id="vote_average">Vote Average</p>
                </div>
                <div class="tagline">
                    <p id="tagline" class="fst-italic">"How much can you know about yourself if you've never been in a fight?"</p>
                </div>
            </div>
            <div class="d-flex row">
                <div class="left-column d-flex flex-column justify-content-start gap-3 col-3">
                    <div class="poster card">
                        <img id="movie_poster" src="/imgs/fight_club_poster.jpg" alt="MoviePoster">
                    </div>
                    <div class="genres card p-2">
                        <div class="genre-header">
                            <h4>Genres</h4>
                        </div>
                        <p id="genres">genre</p>
                    </div>
                    <div class="director card p-2">
                        <div class="director-header">
                            <h4>Director</h4>
                        </div>
                        <p id="director"><a href="#">director</a></p>
                    </div>
                    <div class="writers card p-2">
                        <div class="writers-header">
                            <h4>Writers</h4>
                        </div>
                        <p id="writers"><a href="#">writer</a></p>
                    </div>
                </div>
                <div class="center-column d-flex flex-column justify-content-start gap-3 col-6">
                    <div class="overview card p-2">
                        <div class="overview-header">
                            <h4>Overview</h4>
                        </div>
                        <p id="overview">overview</p>
                    </div>
                </div>
                <div class="right-column d-flex flex-column justify-content-start gap-3 col-3">
                    <div class="other-details card p-2">
                        <h4>Status</h4>
                        <p id="status">status</p>
                        <h4>Original Language</h4>
                        <p id="original_language">language</p>
                        <h4>Budget</h4>
                        <p id="budget">budget</p>
                        <h4>Revenue</h4>
                        <p id="revenue">revenue</p>
                    </div>
                </div>
            </div>
		</div>
	</div>

	<script type="text/javascript" src="/js/showMovie.js"></script>
</body>
</html>