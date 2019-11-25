package com.example.DAO;

import java.util.List;

import com.example.model.PersonModel;

public interface PersonDAO {
	
	public void addPerson(PersonModel p);

	public void updatePerson(PersonModel p);

	public List<PersonModel> listPersons();

	public PersonModel getPersonById(int id);

	public void removePerson(int id);
}
