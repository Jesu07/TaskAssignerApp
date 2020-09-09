package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.model.Users;
import com.project.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepo;
	
	public void createUser(String role,String name,String email,String username,String password, int personal_status, boolean i) {
		Users u = new Users(role,name,email,username,password,personal_status,i ? 1 : 0);
		userRepo.save(u);
	}

	public void updateUser(int id, String role, String name, String email, String username, String password, boolean inn) {
		userRepo.updateUser(id,role,name,email,username,password,inn ? 1 : 0);	
	}
	
	public Users selectById(int id) {
		List<Users> list = userRepo.findAll();
		for(Users c : list) {
			if(c.getUser_id() == id)
				return c;
		}
		return null;
	}
	
	public List<Users> selectAllUser(){
		return userRepo.findAll();
	}
	
	public List<Users> selectAllExceptId(int id) {
		return userRepo.findAllById(id);
	}
	
	public Users findByUsername(String username) {
		return userRepo.findByUsername(username);
	}
	
	public Users findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public Users findByPassword(String password) {
		return userRepo.findByPassword(password);
	}

	public void updatePassword(String password, int i) {
		userRepo.updatePassword(password,i);
	}

	public void updateInnZero(int id, int i) {
		userRepo.updateInnZero(id,i);
	}
	
	public List<Users> selectAllAdministrators(){
		return userRepo.findAllAdministrators();
	}
	
	public List<Users> selectAllUsers(){
		return userRepo.findAllUsers();
	}
	
	public void updatePersonalStatus(int id, int status) {
		userRepo.updatePersonalStatus(id, status);
	}
}
