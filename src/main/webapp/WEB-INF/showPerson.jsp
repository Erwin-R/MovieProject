<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/showPerson.css" />
    <script src="https://kit.fontawesome.com/f217b10d44.js" crossorigin="anonymous"></script>
    <title>Movie Spree - Details</title>
</head>

<body>
    <div id="navbar" class="d-flex align-items-center justify-content-around">
        <div id="logo">
            <p><a href="/home">Movie Spree</a></p>
        </div>
        <div id="search-container">
            <form id="form" action="/search_movies">
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
    <div id="main" class="container mx-auto mt-5">
        <div class="movie">
            <div class="title-bar text-light">
                <div class="title-header d-flex justify-content-start align-items-end gap-5">
                    <h1 id="title" class="title-text fst-italic">${person.name}</h1>
                </div>
                <div class="tagline">
                    <p id="tagline" class="fst-italic title-text">${movie.tagline}</p>
                </div>
            </div>
            <div class="d-flex flex-row row">
                <div class="left-column d-flex flex-column justify-content-start gap-3 col-3">
                    <div class="poster card">
                        <c:choose>
                            <c:when test="${person.profilePath != null}">
                                <img src="https://image.tmdb.org/t/p/w500${person.profilePath}" alt="Person image">
                            </c:when>
                            <c:otherwise>
                                <div style="background-color: gray; height: 400px; width: 100%;" class="no-poster">
                                    <p class="text-center text-light text-wrap">Image Not Available</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="known-for card p-2">
                        <div class="known-for-header">
                            <h4 class="mb-3">Known For</h4>
                        </div>
                        <p>${person.knownForDepartment}</p>
                    </div>
                    <div class="birthday card p-2">
                        <div class="birthday-header">
                            <h4 class="mb-3">Birthday</h4>
                        </div>
                        <p>${person.birthday}</p>
                    </div>
                    <c:if test="${person.deathday != ''}">
                        <div class="deathday card p-2">
                            <div class="deathday-header">
                                <h4 class="mb-3">Death Day</h4>
                            </div>
                            <p>${person.deathday}</p>
                        </div>
                    </c:if>
                    <div class="place-of-birth card p-2">
                        <div class="place-of-birth-header">
                            <h4 class="mb-3">Place of Birth</h4>
                        </div>                    
                        <p>${person.birthplace}</p>
                    </div>
                </div>
                <div class="right-column d-flex flex-column justify-content-start gap-3 col-9">
                    <div class="biography card p-2">
                        <div class="biography-header">
                            <h4  class="mb-3">Biography</h4>
                        </div>
                        <p id="biography">${person.biography}</p>
                    </div>
                    <div class="appeared-in card p-2">
                        <div class="appeared-in-header">
                            <h4 class="mb-3">Appeared In</h4>
                        </div>
                        <div class="container d-flex flex-wrap align-self-center gap-3">
                            <c:forEach var="movie" items="${personCredits.cast}" varStatus="count">
                                <c:if test="${movie.mediaType == 'movie'}">
                                    <div style="width: 100px; height: auto;"> 
                                        <c:choose>
                                            <c:when test="${movie.posterPath != null}">
                                                <a href="/movie/${movie.id}/details">
                                                    <img class="movie"
                                                        src="https://image.tmdb.org/t/p/w500${movie.posterPath}"
                                                        alt="Movie Poster">
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <div style="background-color: gray; height: 150px; width: 100px;" class="no-poster movie">
                                                    <p class="text-center text-light text-wrap">Poster Not Available</p>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <p class="movie-details text-wrap">${movie.movieTitle}</p>
                                        <p class="movie-details text-secondary text-wrap fst-italic">
                                            ${movie.character}</p>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="images card p-2">
                        <div class="images-header">
                            <h4  class="mb-3">Images</h4>
                        </div>
                        <div class="container d-flex flex-row flex-wrap gap-3">
                            <c:forEach var="image" items="${personImages}">
                                <div class="m-2">
                                    <img src="https://image.tmdb.org/t/p/w500${image.filePath}" alt="Person image" height="100%" width="200px">
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>