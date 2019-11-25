package com.example.service;

import java.util.List;

import com.example.model.PersonModel;

public interface PersonService {

	public void addPerson(PersonModel p);

	public void updatePerson(PersonModel p);

	public List<PersonModel> listPersons();

	public PersonModel getPersonById(int id);

	public void removePerson(int id);
}
