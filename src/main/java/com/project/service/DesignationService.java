package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Designation;
import com.project.repository.DesignationRepository;

@Service
public class DesignationService {

	@Autowired
	DesignationRepository dgRepo;
	
	public void saveDesignation(Designation dgn) {
		dgRepo.save(dgn);
	}
	
	public List<Designation> selectAll(){
		List<Designation> list = dgRepo.findAll();
		return list;
	}
	
	public void updateDesignation(int id, String name, int inn) {
		dgRepo.updateDesignation(id, name, inn);
	}
	
	public void deleteById(int id) {
		dgRepo.deleteById(id);		
	}

	public void updateInnZero(int id) {
		dgRepo.updateDesignation(id,0);
	}

	public List<Designation> selectAllExceptId(int id) {
		return dgRepo.findAllExceptId(id);
	}
	
	public Designation selectById(int id) {
		List<Designation> list = dgRepo.findAll();
		for(Designation d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
}
