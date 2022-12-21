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
	<div id="title">
		<h1 class="text-center">Results</h1>
	</div>
	<div id="main">
        <c:forEach var="result" items="${movieSearch.results}">
            <div class="movie card">
				<a href="/movie/${result.id}/details">
                    <img src="https://image.tmdb.org/t/p/w500${result.posterPath}" alt="MoviePoster" height="auto" width="200px">
                </a>
                <p>${result.title}</p>
            </div>
        </c:forEach>
	</div>

	<!-- <div class="page-list">
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