package com.erwinr.movieproject.Models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;


import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="comments")
public class Comment {
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    
    @Size(min=3, message="Comments must be at least three characters long.")
	private String commentInfo;

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
	protected void onUpdate() {
	    this.updatedAt = new Date();
	}

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="comment_id")
    private User creator;

    private Integer apiMovieId;

    
    public Comment(){}
    
    public Comment(String commentInfo){
        this.commentInfo = commentInfo;
    }
    
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getCommentInfo() {
        return commentInfo;
    }
    
    public void setCommentInfo(String commentInfo) {
        this.commentInfo = commentInfo;
    }
    
    public Date getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date getUpdatedAt() {
        return updatedAt;
    }
    
    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public User getCreator() {
        return creator;
    }
    
    public void setCreator(User creator) {
        this.creator = creator;
    }
    
    public Integer getApiMovieId() {
        return apiMovieId;
    }
    
    public void setApiMovieId(Integer apiMovieId) {
        this.apiMovieId = apiMovieId;
    }
    
    
}
