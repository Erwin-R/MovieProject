package com.erwinr.movieproject.Repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.erwinr.movieproject.Models.Contact;

@Repository
public interface ContactRepository extends CrudRepository<Contact, Long> {

    List <Contact> findAll();
    
}