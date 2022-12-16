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
<link rel="stylesheet" href="/css/homepage.css"/>
<script src="https://kit.fontawesome.com/f217b10d44.js" crossorigin="anonymous"></script>
<title>Home Page</title>
</head>
<body>
	<div id="navbar" class="d-flex align-items-center justify-content-around">
		<div id="logo">
			<p>Movie Spree</p>
		</div>
		<div id="search-container">
			<form action="#">
				<input class="search-bar" placeholder="Search..." type="text"></input>
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
		<div id="pages">
           <ul class="d-flex justify-content-evenly align-items-center" id="nav-list">
               <li><a href="#">Trending</a></li>
               <li><a href="#">Playlists</a></li>
               <li><a href="#">Watchlist</a></li>
               <li><a href="#">Contact</a></li>
               <li><a href="/login_page">
                   <button class="login-btn">Sign in</button>
               </a></li>
           </ul>			
		</div>
	</div>
</body>
</html>