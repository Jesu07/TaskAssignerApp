package com.project.customvalidator;

import com.project.customannotations.NotEmpty;

public class SignIn {

	@NotEmpty(message="* Please Enter the Username.")
	String username;
	
	//@NotEmpty(message="* Please Enter the Email")
	//String email;
	
	@NotEmpty(message="* Please Enter the Password.")
	String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	
	/*public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}*/
	
	public void setPassword(String password) {
		this.password = password;
	}
	/*
	@Override
	public String toString() {
		return "SignIn [email=" + email + ", password=" + password + "]";
	}*/
	
	@Override
	public String toString() {
		return "SignIn [username=" + username + ", password=" + password + "]";
	}
}
