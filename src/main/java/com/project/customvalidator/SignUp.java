package com.project.customvalidator;

import javax.validation.constraints.Email;

import com.project.customannotations.NotEmpty;

public class SignUp {
	
	int user_id;
	
	@NotEmpty(message="* Please Select Any Role...")
	String role;
	
	//@AlphabetsOnly(message="* Please Enter the Characters only")
	@NotEmpty(message="* Please Enter the Name")
	String name;
	
	@NotEmpty(message="* Please Enter the Email.")
	@Email(message="* Please Enter Valid Email.")
	String email;
	
	@NotEmpty(message="* Please Enter the Username")
	String username;
	
	String password;
	
	int personal_status;
	
	boolean inn;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPersonal_status() {
		return personal_status;
	}
	public void setPersonal_status(int personal_status) {
		this.personal_status = personal_status;
	}
	public boolean isInn() {
		return inn;
	}
	public void setInn(boolean inn) {
		this.inn = inn;
	}
}