package com.isb.demos.springboot.repos;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.isb.demos.springboot.model.Contact;

public interface ContactRepository extends MongoRepository<Contact, String> {
	
}
