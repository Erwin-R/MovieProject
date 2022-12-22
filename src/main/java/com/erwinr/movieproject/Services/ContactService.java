package com.erwinr.movieproject.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erwinr.movieproject.Models.Contact;
import com.erwinr.movieproject.Repositories.ContactRepository;

@Service
public class ContactService {

    @Autowired
    private ContactRepository contactRepo;

    public Contact create(Contact contact){
        return contactRepo.save(contact);
    }

    public Contact getContact(Long id){
        return contactRepo.findById(id).orElse(null);
    }

    public void deleteContact(Long id){
        contactRepo.deleteById(id);
    }
    
    
}
