package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Country;
import com.project.repository.CountryRepository;

@Service
public class CountryService {

	@Autowired
	CountryRepository cnrepo;
	
	public void saveCountryMaster(String name,String acronym,boolean inn) {
		Country cn = new Country();
		cn.setName(name);
		cn.setAcronym(acronym);
		cn.setInn(inn);
		cnrepo.save(cn);
	}
	
	public List<Country> selectAll(){
		List<Country> list = cnrepo.findAll();
		return list;
	}

	public List<Country> selectByAcronym(String acronym) {
		return cnrepo.findByAcronym(acronym);
	}
	
	public List<Country> selectByCountry(String country){
		return cnrepo.findByName(country);
	}

	public void updateCountry(int id, String name, String acronym, int inn) {
		cnrepo.updateCountry(id,name,acronym,inn);
	}

	public void deleteById(int id) {
		cnrepo.deleteById(id);		
	}

	public void updateInnZero(int id) {
		cnrepo.updateCountry(id,0);
	}

	public List<Country> selectAllExceptId(int id) {
		return cnrepo.findAllExceptId(id);
	}

	public Country selectById(Integer country) {
		List<Country> list = cnrepo.findAll();
		for(Country c1 : list) {
			if(c1.getId() == (int) country) {
				return c1;
			}
		}
		return null;
	}
	
}
