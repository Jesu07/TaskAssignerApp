package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Language;
import com.project.repository.LanguageRepository;

@Service
public class LanguageService {

	@Autowired
	LanguageRepository lgrepo;

	public List<Language> selectAll(){
		List<Language> list = lgrepo.findAll();
		return list;
	}
	
	public void saveLanguageMaster(String name,boolean inn) {
		Language l = new Language(name,inn?1:0);
		lgrepo.save(l);
	}
	
	public void update(int id, String name,boolean inn) {
		lgrepo.update(id,name,inn?1:0);
	}

	public List<Language> selectAllExceptId(int id) {
		return lgrepo.findAllExceptId(id);
	}

	public void updateInnZero(int id, int i) {
		lgrepo.updateInnZero(id,i);
	}
	
	public Language selectById(int id) {
		List<Language> list = lgrepo.findAll();
		for(Language d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
}
