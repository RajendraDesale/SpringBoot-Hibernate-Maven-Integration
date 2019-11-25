package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.PersonModel;
import com.example.service.PersonService;

@Controller
public class PersonController {

	@Autowired
	private PersonService personService;

	/*
	 * @Autowired(required = true)
	 * 
	 * @Qualifier(value = "personService") public void
	 * setPersonService(PersonService ps) { this.personService = ps; }
	 */

	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(ModelMap model) {
		model.addAttribute("person", new PersonModel());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person";
	}

	// For add and update person both
	@RequestMapping(value = "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") PersonModel p, ModelMap model) {
		String errorMessge = null;
		if (p != null) {
			if (p.getId() == 0) {
				// new person, add it
				this.personService.addPerson(p);
			} else {
				// existing person, call update
				this.personService.updatePerson(p);
			}
		} else {
			errorMessge = "Please enter ther required field";
		}

		model.addAttribute("errorMessge", errorMessge);
		return "redirect:/persons";
	}

	@RequestMapping("/remove/{id}")
	public String removePerson(@PathVariable("id") int id) {
		this.personService.removePerson(id);
		return "redirect:/persons";
	}

	@RequestMapping("/edit/{id}")
	public String editPerson(@PathVariable("id") int id, ModelMap model) {
		model.addAttribute("person", this.personService.getPersonById(id));
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person";
	}
}
