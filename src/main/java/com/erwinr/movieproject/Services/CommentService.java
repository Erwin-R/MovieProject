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

    public List<Comment> allComments(){
        return commentRepo.findAll();
    }

    public Comment addComment(Comment comment){
        return commentRepo.save(comment);
    }

    public Comment updateComment(Comment comment){
        return commentRepo.save(comment);
    }

    public void deleteNote(Comment comment){
        commentRepo.delete(comment);
    }

    public Comment findOneComment(Long id){
        Optional<Comment> oneComment = commentRepo.findById(id);
        if(oneComment.isPresent()){
            return oneComment.get();
        } else{
            return null;
        }
    }

    public List<Comment> movieComments(Long movieId){
        return commentRepo.findByMovieIdIs(movieId);
    }
}
