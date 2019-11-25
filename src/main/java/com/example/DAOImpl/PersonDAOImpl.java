package com.example.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.DAO.PersonDAO;
import com.example.model.PersonModel;

@Repository
public class PersonDAOImpl implements PersonDAO {

	private static final Logger logger = LoggerFactory.getLogger(PersonDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
 
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addPerson(PersonModel p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("PersonModel saved successfully, PersonModel Details=" + p);
	}

	@Override
	public void updatePerson(PersonModel p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("PersonModel updated successfully, PersonModel Details=" + p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PersonModel> listPersons() {
		Session session = this.sessionFactory.getCurrentSession();
		List<PersonModel> personsList = session.createQuery("from PersonModel").list();
		for (PersonModel p : personsList) {
			logger.info("PersonModel List::" + p);
		}
		return personsList;
	}

	@Override
	public PersonModel getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		PersonModel p = (PersonModel) session.load(PersonModel.class, new Integer(id));
		logger.info("PersonModel loaded successfully, PersonModel details=" + p);
		return p;
	}

	@Override
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		PersonModel p = (PersonModel) session.load(PersonModel.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}
		logger.info("PersonModel deleted successfully, person details=" + p);
	}
}
