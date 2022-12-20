const api_key = "?api_key=5d9be5688e6be5edda3299019fd5922a";
const base_url = "https://api.themoviedb.org/3/movie/";
const lang_url = "&language=en-US";
const movie_id = document.getElementById("movie_id").value
const movie_details_url = base_url + movie_id + api_key + "&append_to_response=images,credits";

const movie_poster_url = "https://image.tmdb.org/t/p/w500";

const main = document.getElementById("main");
const form = document.getElementById("form");
const search = document.getElementById("search");

const title = document.getElementById("title");
const release_date = document.getElementById("release_date");
const poster_path = document.getElementById("movie_poster");
const vote_average = document.getElementById("vote_average");
const overview = document.getElementById("overview");
const film_status = document.getElementById("status");
const original_language = document.getElementById("original_language");
const budget = document.getElementById("budget");
const revenue = document.getElementById("revenue");
const runtime = document.getElementById("runtime");
const tagline = document.getElementById("tagline");

getMovieDetails(movie_details_url);

function getMovieDetails(url){
    lastUrl = url;
    fetch(url).then(res => res.json()).then(data => {
        if(data != null){
            console.log(data);
            showMovieDetails(data);
        } else{
            main.innerHTML = `<h1 class="no-results">No Results Found</h1>`
        }
    })
    .catch(err => {
        console.log("Something is wrong");
        console.log(err);
    })
}

function showMovieDetails(data){
    title.innerHTML = data.title;
    tagline.innerHTML = data.tagline;
    release_date.innerHTML = data.release_date;
    // document.getElementById("movie_poster").src = data.poster_path;
    vote_average.innerHTML = data.vote_average;
    overview.innerHTML = data.overview;
    film_status.innerHTML = data.status;
    original_language.innerHTML = data.original_language;
    budget.innerHTML = "$" + data.budget;
    revenue.innerHTML = "$" + data.revenue;
    runtime.innerHTML = data.runtime + "m";
}