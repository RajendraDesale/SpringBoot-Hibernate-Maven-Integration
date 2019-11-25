package com.example.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.DAO.PersonDAO;
import com.example.model.PersonModel;
import com.example.service.PersonService;


@Service("personService")
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonDAO personDAO;
	
	/*
	 * public void setPersonDAO(PersonDAO personDAO) { this.personDAO = personDAO; }
	 */

	@Override
	@Transactional
	public void addPerson(PersonModel p) {
		this.personDAO.addPerson(p);
	}

	@Override
	@Transactional
	public void updatePerson(PersonModel p) {
		this.personDAO.updatePerson(p);
	}

	@Override
	@Transactional
	public List<PersonModel> listPersons() {
		return this.personDAO.listPersons();
	}

	@Override
	@Transactional
	public PersonModel getPersonById(int id) {
		return this.personDAO.getPersonById(id);
	}

	@Override
	@Transactional
	public void removePerson(int id) {
		this.personDAO.removePerson(id);
	}
}
