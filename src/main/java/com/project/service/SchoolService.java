package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.School;
import com.project.repository.SchoolRepository;

@Service
public class SchoolService {

	@Autowired
	SchoolRepository scRepo;
	
	public List<School> selectAll(){
		List<School> list = scRepo.findAll();
		return list;
	}
	
	public void saveSchool(School s) {
		scRepo.save(s);
	}
	
	public void update(int id,String school_name,String board,int marks,double percentage,boolean inn) {
		scRepo.update(id,school_name,board,marks,percentage,inn?1:0);
	}

	public List<School> selectAllExceptId(int id) {
		return scRepo.findAllExceptId(id);
	}

	public void updateInnZero(int id, int i) {
		scRepo.updateInnZero(id,i);
	}
	
	public School selectById(int id) {
		List<School> list = scRepo.findAll();
		for(School d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
	
	public School selectByUserId(int id) {
		List<School> list = scRepo.findAll();
		for(School d : list) {
			if(d.getUser_ref().getUser_id() == id)
				return d;
		}
		return null;
	}
}
