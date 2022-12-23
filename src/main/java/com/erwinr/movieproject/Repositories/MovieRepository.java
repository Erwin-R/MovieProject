package com.erwinr.movieproject.Repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erwinr.movieproject.Models.Movie;
import com.erwinr.movieproject.Models.User;

@Repository
public interface MovieRepository extends CrudRepository<Movie, Long> {

    // Get all movies in database
    List <Movie> findAll();
    // Returns movie user's watchlist searching by the API's "movie_id"
    Optional<Movie> findByUserAndApiMovieId(User user, Integer movieId);
}
