package com.erwinr.movieproject.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erwinr.movieproject.Models.Movie;

@Repository
public interface MovieRepository extends CrudRepository<Movie, Long> {

    List <Movie> findAll();
    
}