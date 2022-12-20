console.log("hey its me!")
const api_key = "api_key=5d9be5688e6be5edda3299019fd5922a";
const base_url = "https://api.themoviedb.org/3";
const popularity_url = base_url + "/discover/movie?sort_by=popularity.desc&" + api_key;
const search_url = base_url + "/search/movie?" + api_key;

const movie_poster_url = "https://image.tmdb.org/t/p/w500";

const main = document.getElementById("main");
const form = document.getElementById("form");
const search = document.getElementById("search");

const previous = document.getElementById("previous-page");
const next = document.getElementById("next");
const current = document.getElementById("current-page");

var currentPage = 1;
var nextPage = 2;
var prevPage = 3;
var lastUrl = "";
var totalPages = 50;


getMovies(popularity_url);

function getMovies(url){
    lastUrl = url;
    fetch(url).then(res => res.json()).then(data => {
        if(data.results.length !== 0){
            showMovies(data.results);
            currentPage = data.page;
            nextPage = currentPage + 1;
            prevPage = currentPage - 1;
            totalPages = data.total_pages;
            // totalPages = 10; do this if you only want to display a set amount of pages

            current.innerText = currentPage;
            if(currentPage <= 1 ){
                previous.classList.add("disabled");
                next.classList.remove("disabled");
            } else if(currentPage >= totalPages){
                previous.classList.remove("disabled");
                next.classList.add("disabled");
            } else{
                previous.classList.remove("disabled");
                next.classList.remove("disabled");
            }
            
        } else{
            main.innerHTML = `<h1 class="no-results">No Results Found </h1>`
        }
    })
    .catch(err => {
        console.log("Something is wrong");
        console.log(err);
    })
}


function showMovies(data){
    main.innerHTML = '';

    data.forEach(movie => {
        const {title, poster_path, vote_average, overview} = movie;
        const movieElement = document.createElement("div");
        movieElement.classList.add("movie");
        movieElement.innerHTML = `
        <img src="${poster_path? movie_poster_url + poster_path: 'http://via.placeholder.com/500x750?text=Movie+Image+Not+Found'}" alt="${title}">

        <div class="movie-title">
            <h3>"${title}"</h3>
            <span class="${getColor(vote_average)}">${vote_average}</span>
        </div>

        <div class="movie-description">
            <h3>Synopsis</h3>
            <p>${overview? overview: 'No synopsis is available.'}</p>
            <div class="d-flex">
                <form action="/addMovie" >
                    <input type="submit" class="btn me-2" value="Add to Playlist">
                </form>
                <form action="/showMovieDetails">
                    <input type="submit" class="btn" value="More Details">
                </form>
            </div>
        </div>
        `
        main.appendChild(movieElement);
    })

}

function getColor(rating){
    if(rating >= 8){
        return "green";
    } else if(rating >=5){
        return "yellow";
    } else{
        return "red";
    }
}


form.addEventListener("submit", (e) => {
    e.preventDefault();

    const searchTerm = search.value;

    if(searchTerm){
        getMovies(search_url + "&query=" + searchTerm)
    }
})

previous.addEventListener("click" , () => {
    if(prevPage > 0){
        pageCall(prevPage);
    }
})

next.addEventListener("click" , () => {
    if(nextPage <= totalPages){
        pageCall(nextPage);
    }
})

function pageCall(page){
    let urlSplit = lastUrl.split("?");
    let queryParams = urlSplit[1].split("&");
    let key = queryParams[queryParams.length - 1].split("=");
    if(key[0] != "page"){
        let url = lastUrl + "&page=" + page;
        getMovies(url); 
    } 
    else{
        key[1] = page.toString();
        let a = key.join("=");
        queryParams[queryParams.length - 1] = a;
        let b = queryParams.join("&");
        let url = urlSplit[0] + "?" + b;
        getMovies(url);
    }
}