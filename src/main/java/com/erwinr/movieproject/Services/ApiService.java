package com.erwinr.movieproject.Services;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.erwinr.movieproject.Models.Movie;

@Service
public class ApiService{

    public Movie getTrendingMovie(String uri, Long id){
        RestTemplate restTemplate = new RestTemplate();
        Movie trendingMovie = restTemplate.getForObject(uri + id, Movie.class);
        return trendingMovie;
    }

}