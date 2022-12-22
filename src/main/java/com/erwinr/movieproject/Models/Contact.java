    package com.erwinr.movieproject.Models;
    
    import java.util.Date;
    
    import javax.persistence.Entity;
    import javax.persistence.GeneratedValue;
    import javax.persistence.GenerationType;
    import javax.persistence.Id;
    import javax.persistence.PrePersist;
    import javax.persistence.PreUpdate;
    import javax.persistence.Table;
    
    @Entity
    @Table(name="contacts")
    public class Contact {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    
    private String fullName;
    private String email;
    private String question;

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

    public Contact(){}

    public Contact(String fullName, String email, String question) {
        this.fullName = fullName;
        this.email = email;
        this.question = question;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
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




    
}


