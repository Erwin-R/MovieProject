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


@Entity
@Table(name="movies")
public class Movie {
    
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

    private Integer apiMovieId;
	private String title;
    private String posterPath;
    private Float voteAverage;

    @Column(length=1000)
    private String overview;

    private String releaseDate;
    
    @Column(updatable = false)
    
	private Date createdAt;
    
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
	@JoinColumn(name = "user_id")
	private User user;


    public Movie(){}

    public Movie(int apiMovieId, String title, String posterPath, Float voteAverage, String overview,
            String releaseDate) {
        this.apiMovieId = apiMovieId;
        this.title = title;
        this.posterPath = posterPath;
        this.voteAverage = voteAverage;
        this.overview = overview;
        this.releaseDate = releaseDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getapiMovieId() {
        return apiMovieId;
    }

    public void setapiMovieId(Integer apiMovieId) {
        this.apiMovieId = apiMovieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getposterPath() {
        return posterPath;
    }

    public void setposterPath(String posterPath) {
        this.posterPath = posterPath;
    }

    public Float getvoteAverage() {
        return voteAverage;
    }

    public void setvoteAverage(Float voteAverage) {
        this.voteAverage = voteAverage;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getreleaseDate() {
        return releaseDate;
    }

    public void setreleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}