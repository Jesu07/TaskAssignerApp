package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.College;
import com.project.repository.CollegeRepository;

@Service
public class CollegeService {

	@Autowired
	CollegeRepository clgRepo;
	
	public List<College> selectAll(){
		List<College> list = clgRepo.findAll();
		return list;
	}
	
	public void saveCollege(College c) {
		clgRepo.save(c);
	}
	
	public void update(int id,String clg_name,String course,String university,double cgpa,boolean inn) {
		clgRepo.update(id,clg_name,course,university,cgpa,inn?1:0);
	}

	public List<College> selectAllExceptId(int id) {
		return clgRepo.findAllExceptId(id);
	}

	public void updateInnZero(int id, int i) {
		clgRepo.updateInnZero(id,i);
	}
	
	public College selectById(int id) {
		List<College> list = clgRepo.findAll();
		for(College d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
	
	public College selectByUserId(int id) {
		List<College> list = clgRepo.findAll();
		for(College d : list) {
			if(d.getUser_ref().getUser_id() == id)
				return d;
		}
		return null;
	}
}
