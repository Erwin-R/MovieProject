package com.erwinr.movieproject.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.erwinr.movieproject.Models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long>{
    List<Comment>findAll();
    List<Comment>findByMovieIdIs(Long id);
}
