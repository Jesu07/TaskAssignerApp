package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Contact;
import com.project.repository.ContactRepository;

@Service
public class ContactService {

	@Autowired
	ContactRepository conRepo;
	
	public List<Contact> selectAll(){
		List<Contact> list = conRepo.findAll();
		return list;
	}
	
	public void saveContact(Contact c) {
		conRepo.save(c);
	}
	
	public void update(int id, String door_no, String street,String village, String city, int country, int state, int district, int pincode, boolean inn) {
		conRepo.update(id, door_no,street,village,city,country,state,district,pincode, inn ? 1 : 0);
	}

	public List<Contact> selectAllExceptId(int id) {
		return conRepo.findAllExceptId(id);
	}

	public void updateInnZero(int id, int i) {
		conRepo.updateInnZero(id, i);
	}
	
	public Contact selectById(int id) {
		List<Contact> list = conRepo.findAll();
		for(Contact d : list) {
			if(d.getId() == id)
				return d;
		}
		return null;
	}
	
	public Contact selectByUserId(int id) {
		List<Contact> list = conRepo.findAll();
		for(Contact d : list) {
			if(d.getUser_ref().getUser_id() == id)
				return d;
		}
		return null;
	}
}
