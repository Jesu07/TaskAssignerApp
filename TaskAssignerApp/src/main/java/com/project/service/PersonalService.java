package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Bloodgroup;
import com.project.model.Community;
import com.project.model.Country;
import com.project.model.Designation;
import com.project.model.Language;
import com.project.model.Personal;
import com.project.model.Religion;
import com.project.repository.PersonalRepository;

@Service
public class PersonalService {

	@Autowired
	PersonalRepository psRepo;
	
	public static String uploadDirectory = System.getProperty("user.dir") + "/uploads";
	
	public void savePersonal(Personal ps) {
		psRepo.save(ps);
	}
		
	public List<Personal> selectAll(){
		List<Personal> list = psRepo.findAll();
		return list;
	}
	
	public void updatePersonal(int id, Designation designation, String mobile, String gender, String dob,
			Bloodgroup bloodgroup, Language language, String place_of_birth, Country country,
			Religion religion, Community community, String image_name, String image_path, 
			String image_size, String image_type) {
		psRepo.updatePersonal(id, designation, mobile, gender, dob, bloodgroup, language, place_of_birth, country, 
				religion, community, image_name, image_path, image_size, image_type);
	}
	
	public void deleteById(int id) {
		psRepo.deleteById(id);		
	}

	public void updateInnZero(int id) {
		psRepo.updateInn(id,0);
	}

	public List<Personal> selectAllExceptId(int id) {
		return psRepo.findAllExceptId(id);
	}
	
	public Personal selectById(int id) {
		List<Personal> list = psRepo.findAll();
		for(Personal d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
	
	public Personal selectByUserId(int id) {
		List<Personal> list = psRepo.findAll();
		for(Personal d : list) {
			if(d.getUser_ref().getUser_id() == id)
				return d;
		}
		return null;
	}

	public List<Personal> selectUserImageByUserID(int user) {
		return psRepo.findUserImageByUserID(user);
	}
}
