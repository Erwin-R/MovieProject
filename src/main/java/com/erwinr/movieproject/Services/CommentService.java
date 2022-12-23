package com.erwinr.movieproject.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erwinr.movieproject.Models.Comment;
import com.erwinr.movieproject.Repositories.CommentRepository;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepo;

    // get all comment records
    public List<Comment> allComments(){
        return commentRepo.findAll();
    }

    // create new comment
    public Comment addComment(Comment comment){
        return commentRepo.save(comment);
    }

    // update existing comment
    public Comment updateComment(Comment comment){
        return commentRepo.save(comment);
    }

    // delete comment
    public void deleteComment(Comment comment){
        commentRepo.delete(comment);
    }

    // find comment by record ID
    public Comment findOneComment(Long id){
        Optional<Comment> oneComment = commentRepo.findById(id);
        if(oneComment.isPresent()){
            return oneComment.get();
        } else{
            return null;
        }
    }

    // find list of comments for one movie
    public List<Comment> findMovieComments(Integer apiMovieId){
        return commentRepo.findByApiMovieId(apiMovieId);
    }
}
