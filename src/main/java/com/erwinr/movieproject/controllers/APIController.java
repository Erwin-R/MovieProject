package com.erwinr.movieproject.controllers;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.erwinr.movieproject.Models.Movie;
import com.erwinr.movieproject.Services.ApiService;

@RestController
public class APIController {
    
    @Autowired
    ApiService apiServ;

    @GetMapping("/api/trending/movies")
    public List<Object> getTrendingMovies(){
        String url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=5d9be5688e6be5edda3299019fd5922a";
        RestTemplate restTemplate = new RestTemplate();

        Object trendingMovies = restTemplate.getForObject(url, Object[].class);
        return Arrays.asList(trendingMovies);
    }


    @GetMapping("/api/trendingMovie/{id}")
    public String getMovie(@PathVariable("id") Long id){
        String uri = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=5d9be5688e6be5edda3299019fd5922a";
        Movie m = apiServ.getTrendingMovie(uri, id);
        
        return m.getTitle();
        
    }
}
