package com.erwinr.movieproject.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erwinr.movieproject.Models.Movie;
import com.erwinr.movieproject.Repositories.MovieRepository;

@Service
public class MovieService {

    @Autowired
    private MovieRepository movieRepo;

    public Movie create(Movie movie){
        return movieRepo.save(movie);
    }
    
    public Movie getMovie(Long id) {
		return movieRepo.findById(id).orElse(null);
	}

    public Movie findById(Long id) {
        Optional<Movie> optionalMovie = movieRepo.findById(id);
        if(optionalMovie.isPresent()) {
            return optionalMovie.get();
        } else {
            return null;
        }
    }

    public List<Movie> allMovies() {
        return movieRepo.findAll();
    }

    public Movie updateMovies(Movie movie) {
        return movieRepo.save(movie);
    }

    public void deleteMovie(Long id) {
        movieRepo.deleteById(id);
    }

    // public Movie findByUser(Integer movieId){
    //     Optional<Long> possibleMovie = movieRepo.findByUser(movieId);
    //     if(possibleMovie.isPresent()){
    //         return possibleMovie.get();
    //     } else{
    //         return null;
    //     }
    // }
}
