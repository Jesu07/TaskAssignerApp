package com.project.customvalidator;

import javax.validation.constraints.Email;

import com.project.customannotations.NotEmpty;

public class ForgotPassword {
	
	@NotEmpty(message="* Please Enter the Email...")
	@Email(message="* Please Enter the Valid Email Id...")
	String email;

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
