package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Religion;
import com.project.repository.ReligionRepository;

@Service
public class ReligionService {

	@Autowired
	ReligionRepository rgrepo;

	public List<Religion> selectAll(){
		List<Religion> list = rgrepo.findAll();
		return list;
	}
	
	public void saveReligionMaster(String name,boolean inn) {
		Religion r = new Religion(name,inn?1:0);
		rgrepo.save(r);
	}
	
	public void update(int id, String name,boolean inn) {
		rgrepo.update(id,name,inn?1:0);
	}

	public List<Religion> selectAllExceptId(int id) {
		return rgrepo.findAllExceptId(id);
	}

	public void updateInnZero(int id, int i) {
		rgrepo.updateInnZero(id,i);
	}
	
	public Religion selectById(int id) {
		List<Religion> list = rgrepo.findAll();
		for(Religion d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
}
