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
    <link rel="stylesheet" href="/css/showMovie.css" />
    <script src="https://kit.fontawesome.com/f217b10d44.js" crossorigin="anonymous"></script>
    <title>Movie Spree - Details</title>
</head>

<body style="background-image: url('https://image.tmdb.org/t/p/original${movie.backdropPath}')">
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
                <c:if test="${id != null}">
                    <form:form action="/addMovie" method="POST" modelAttribute="movies">
                        <form:input type="hidden" path="user" value="${id}"></form:input>
                        <form:input type="hidden" path="movie_id" value="${movie.id}"></form:input>
                        <form:input type="hidden" path="title" value="${movie.title}"></form:input>
                        <form:input type="hidden" path="poster_path" value="${movie.posterPath}"></form:input>
                        <form:input type="hidden" path="vote_average" value="${movie.voteAverage}"></form:input>
                        <form:input type="hidden" path="overview" value="${movie.overview}"></form:input>
                        <form:input type="hidden" path="release_date" value="${movie.releaseDate}"></form:input>
                        <input type="submit" class="btn btn-warning mb-3" value="Add to Playlist">
                    </form:form>
                </c:if>
                <div class="title-header d-flex justify-content-start align-items-end gap-5">
                    <input id="movie_id" type="hidden" value="${id}">
                    <h1 id="title" class="title-text fst-italic">${movie.title}</h1>
                    <p id="release_date" class="title-text fst-italic">Released: ${movie.releaseDate}</p>
                    <p id="runtime" class="title-text fst-italic">Runtime: ${movie.runtime}m</p>
                    <p id="vote_average" class="title-text fst-italic">Average Rating: <fmt:formatNumber pattern="#.#" value="${movie.voteAverage}"/></p>
                </div>
                <div class="tagline">
                    <p id="tagline" class="fst-italic title-text">${movie.tagline}</p>
                </div>
            </div>
            <div class="d-flex flex-row row">
                <div class="left-column d-flex flex-column justify-content-start gap-3 col-3">
                    <div class="poster card">
                        <c:choose>
                            <c:when test="${movie.posterPath != null}">
                                <img src="https://image.tmdb.org/t/p/w500${movie.posterPath}" alt="MoviePoster">
                            </c:when>
                            <c:otherwise>
                                <div style="background-color: gray; height: 400px; width: 100%;" class="no-poster">
                                    <p class="text-center text-light text-wrap">Poster Not Available</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="genres card p-2">
                        <div class="genre-header">
                            <h4 class="mb-3">Genres</h4>
                        </div>
                        <c:forEach var="genre" items="${movie.genres}">
                            <p>${genre.name}</p>
                        </c:forEach>
                    </div>
                    <div class="director card p-2">
                        <div class="director-header">
                            <h4 class="mb-3">Director</h4>
                        </div>
                        <c:forEach var="crewMember" items="${movie.credits.crew}">
                            <c:if test="${crewMember.job == 'Director'}">
                                <p><a href="/person/${crewMember.id}/details">${crewMember.name}</a></p>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="writers card p-2">
                        <div class="writers-header">
                            <h4 class="mb-3">Writers</h4>
                        </div>
                        <c:forEach var="crewMember" items="${movie.credits.crew}">
                            <c:if test="${crewMember.department == 'Writing'}">
                                <p><a href="/person/${crewMember.id}/details">${crewMember.name}</a> - ${crewMember.job}</p>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="production card p-2">
                        <div class="production-header">
                            <h4 class="mb-3">Production Companies</h4>
                        </div>
                        <c:forEach var="company" items="${movie.productionCompanies}">
                            <p>${company.name}</p>
                        </c:forEach>
                    </div>
                </div>
                <div class="center-column d-flex flex-column justify-content-start gap-3 col-6">
                    <div class="overview card p-2">
                        <div class="overview-header">
                            <h4  class="mb-3">Overview</h4>
                        </div>
                        <p id="overview">${movie.overview}</p>
                    </div>
                    <div class="cast card p-2">
                        <div class="cast-header">
                            <h4 class="mb-3">Top Cast</h4>
                        </div>
                        <div class="container d-flex flex-wrap align-self-center gap-3">
                            <c:forEach var="castMember" items="${movie.credits.cast}">
                                <c:if test="${castMember.order < 10}">
                                    <div style="width: 100px; height: auto;"> 
                                        <c:if test="${castMember.profilePath != ''}">
                                            <a href="/person/${castMember.id}/details">
                                                <img class="cast_member"
                                                    src="https://image.tmdb.org/t/p/w500${castMember.profilePath}"
                                                    alt="Actor/actress image">
                                            </a>
                                        </c:if>
                                        <p class="cast_member_name text-wrap">${castMember.name}</p>
                                        <p class="cast_member_char text-secondary text-wrap fst-italic">
                                            ${castMember.character}</p>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="trailers card p-2">
                        <div class="trailers-header">
                            <h4  class="mb-3">Trailers</h4>
                        </div>
                        <c:forEach var="video" items="${movie.videos}">
                            <c:if test="${video.type == 'Trailer' && video.site == 'YouTube'}">
                                <div class="m-2">
                                    <iframe width="600px" height="450px"
                                    src="https://www.youtube.com/embed/${video.key}">
                                </iframe>
                            </div>
                        </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="right-column d-flex flex-column justify-content-start gap-3 col-3">
                    <div class="other-details card p-2">
                        <h4 class="mb-3">Status</h4>
                        <p id="status">${movie.status}</p>
                        <h4 class="mb-3">Budget</h4>
                        <p id="budget">
                            <fmt:formatNumber value="${movie.budget}" type="currency" />
                        </p>
                        <h4 class="mb-3">Revenue</h4>
                        <p id="revenue">
                            <fmt:formatNumber value="${movie.revenue}" type="currency" />
                        </p>
                    </div>
                    <div class="similar-movies card p-2">
                        <h4 class="mb-3">Similar Movies</h4>
                        <c:forEach var="similarMovie" items="${movie.similarMovies}" varStatus="count">
                            <c:if test="${count.index < 4}">
                                <a href="/movie/${similarMovie.id}/details" class="similar_movie_poster">
                                    <img src="https://image.tmdb.org/t/p/w500${similarMovie.posterPath}"
                                    alt="Movie Poster" width="100%" height="auto">
                                </a>
                                <p class="similar_movie_text mb-3">${similarMovie.title} <span class="fst-italic">(${similarMovie.releaseDate})</span></p>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>